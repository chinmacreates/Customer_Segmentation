options obs=100;   /* cap input rows for the captured run */

/*
  This bundle replaces the upstream MKTG525.CLUSTERDATA class library
  reference with a small in-memory sample of the same shape, so the
  segmentation pipeline can run standalone. Columns match what the
  script reads: CustomerID, Age, Annual_Income, Spending_Score,
  Product_Description. The clustering logic below is unchanged.
*/
data CLUSTERDATA;
    length Product_Description $ 24;
    input CustomerID Age Annual_Income Spending_Score Product_Description $ 25-48;
    datalines;
1001 22 15000 78 Trendy Sneakers
1002 25 16000 81 Trendy Sneakers
1003 21 14000 73 Graphic Tee
1004 23 17000 88 Wireless Earbuds
1005 26 18000 76 Graphic Tee
1006 40 62000 42 Leather Wallet
1007 43 64000 45 Leather Wallet
1008 45 66000 39 Desk Organizer
1009 41 60000 47 Desk Organizer
1010 47 68000 44 Fountain Pen
1011 55 90000 15 Luxury Watch
1012 58 95000 18 Luxury Watch
1013 60 98000 12 Silk Scarf
1014 52 88000 21 Silk Scarf
1015 62 99000 14 Leather Briefcase
1016 30 42000 55 Coffee Maker
1017 33 45000 58 Coffee Maker
1018 35 47000 52 Yoga Mat
1019 28 40000 61 Yoga Mat
1020 38 50000 49 Blender
1021 24 15500 84 Trendy Sneakers
1022 44 65000 41 Notebook Set
1023 57 92000 17 Cashmere Sweater
1024 31 43000 57 Water Bottle
1025 61 97000 13 Leather Briefcase
;
run;
