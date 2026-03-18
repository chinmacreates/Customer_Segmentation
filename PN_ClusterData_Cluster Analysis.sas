/****************************************************************************
								Cluster Data Cleaned
****************************************************************************/

/* Remove missing data found in product_description */
PROC SQL;
Create Table  Cluster_new AS
SELECT *
FROM MKTG525.CLUSTERDATA
WHERE product_description IS NOT MISSING
;
Quit;

/* Select columns needed for the analysis */
PROC SQL;
Create Table Cluster_clean AS
SELECT Age, Annual_Income, Spending_Score
FROM CLUSTER_NEW
;
Quit;

/* Correlation Analysis */
ods noproctitle;
ods graphics / imagemap=on;

proc corr data=CLUSTER_NEW pearson nosimple noprob plots=none;
	var Age Annual_Income Spending_Score ;
	
run;

/* K-means clustering */
ods noproctitle;

proc stdize data=CLUSTER_NEW out=_std_ method=range;
	var Age Annual_Income Spending_Score;
run;

proc fastclus data=_std_ maxclusters=3 out=CLUSTER_SCORES;
	var Age Annual_Income Spending_Score;
run;

proc delete data=_std_;
run;

/* Combine Tables */
proc sql noprint;
	create table CLUSTER_combine as select a.CustomerID, a.Age, a.Annual_Income, 
		a.Spending_Score, a.Product_Description, b.CLUSTER from CLUSTER_NEW 
		as a, CLUSTER_SCORES as b where a.CustomerID=b.CustomerID;
quit;

/*Compare Cluster Means */
ods noproctitle;
ods graphics / imagemap=on;

proc means data=CLUSTER_COMBINE chartype mean std min max n vardef=df;
	var Age Annual_Income Spending_Score;
	class CLUSTER;
run;