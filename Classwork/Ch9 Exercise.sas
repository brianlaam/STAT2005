/* Ex9 */
/* Author: Chung Sin Fai */
/* Q1a */
DATA q1a;
LENGTH  Name $ 14;
INPUT Name $ & SID $ Year;
DATALINES;
Chan Tai Man  12345 1
Cheung Tai Man  23456 2
Wong Tai Man  34567 3
RUN;
PROC PRINT DATA = q1a;
RUN;

/* Q1b */
DATA q1b;
LENGTH  Name $ 14;
INPUT Name $ & SID $ Year @@;
DATALINES;
Chan Tai Man  12345 1 Cheung Tai Man  23456 2 Wong Tai Man  34567 3
RUN;
PROC PRINT DATA = q1b;
RUN;

/* Q2a */
DATA q2a;
INFILE CARDS4 dlm=';';
INPUT Name :$15. Age District $;
CARDS4;
Chan Tai Man;16;MK
Cheung Wing Yan;21;ST
Wong Wai Shing;18;TKO
Suen King Fung;19;TST
;;;;
RUN;
PROC PRINT DATA = q2a;
RUN;

/* Q2b */
DATA q2b;
INPUT Name $ 1-15 Age 18-19 District $ 21-23;
CARDS;
Chan Tai Man     16 MK
Cheung Wing Yan  21 ST
Wong Wai Shing   18 TKO
Suen King Fung   19 TST
RUN;
PROC PRINT DATA = q2b;
RUN;

/* Q3 */
DATA q3;
INFILE "/home/u63529371/ex9_q3.dat";
/* u63529371 is the user id, each account has different user id */
INPUT Time TIME5. Flight_code $ 6. +(-6) Airline $ 2. Destination $ 14-16;
/* INPUT Time TIME5. @7 Flight_code $ Airline $ 7-8 Destination $ 14-16; */
RUN;
PROC PRINT DATA = q3;
RUN;