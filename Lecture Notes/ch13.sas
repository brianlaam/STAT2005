* Chapter 13;

* Enter your file path here;
* %LET filepath = C:\Users\TWWong\Desktop\data\2005;
%LET filepath = /home/u5865803/data;


DATA sales;
    INFILE "&filepath/sales_data.txt" DLM=';' FIRSTOBS=2;
    INPUT Item_Name : $20. Item_Price : COMMA5. Number_In_Stock Number_Sold;
RUN;

PROC EXPORT DATA=sales OUTFILE="&filepath/sales_data.csv" DBMS=CSV REPLACE;
RUN;

