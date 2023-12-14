* Chapter 9;

* Enter your file path here;
* %LET filepath = C:\Users\TWWong\Desktop\data\2005;
%LET filepath = /home/u5865803/data;


* Example 1;

LIBNAME DATAIN "&filepath";

DATA DATAIN.NEW;
INPUT X Y;

CARDS;
2   4
3   8
RUN;

LIBNAME NEWDATA "&filepath";
PROC PRINT DATA=NEWDATA.NEW;
RUN;

* Example 2;
* Version 1;
LIBNAME STUDENT "&filepath";
DATA STUDENT.SCORES;
LENGTH NAME $ 14;
INPUT NAME $ & AGE SEX $ GRADE;
CARDS; 
CHAN CHI SHING  15 M 70.5	
CHEUNG TIN  16 M 67.2
LEUNG MAN SHAN  18 F 72.0
MA YUEN LAN  . F 80.1
WU KEUNG  17 M 75.3
RUN;

* Version 2;
LIBNAME STUDENT "&filepath";
DATA STUDENT.SCORES;
LENGTH NAME $ 14;
INPUT NAME $ & AGE SEX $ GRADE @@;
CARDS;
CHAN CHI SHING  15 M 70.5 CHEUNG TIN  16 M 67.2
LEUNG MAN SHAN  18 F 72.0 MA YUEN LAN  . F
80.1 WU KEUNG  17 M 75.3
RUN;


* Version 3;
DATA;
LENGTH NAME $ 14;
INPUT NAME $ & / AGE SEX $ GRADE;
* INPUT NAME $ &; * INPUT AGE SEX $ GRADE;
* INPUT #2 AGE SEX $ GRADE #1 NAME $ &;
CARDS;
CHAN CHI SHING 
15 M 70.5
CHEUNG TIN 
16 M 67.2
LEUNG MAN SHAN 
18 F 72.0
MA YUEN LAN 
. F 80.1
WU KEUNG 
17 M 75.3
RUN;


* Example 3;
DATA toads;
INFILE "&filepath/ToadJump.dat";
INPUT ToadName $ Weight Jump1 Jump2 Jump3;
RUN;
* Print the data to make sure the file was read correctly;
PROC PRINT DATA = toads;
TITLE 'SAS Data Set Toads';
RUN;


* Example 4;
DATA TEST;
LENGTH REGION $ 17;
INPUT NAME $ REGION $ &;
CARDS4;
TOM WONG TAI SIN; KLN
MARY SHATIN; NT
;;;;
RUN;


* Example 5;

LIBNAME STUDENT "&filepath";
DATA STUDENT.SCORES;
INPUT NAME $ 1-15 AGE 17-18 SEX $ 20 GRADE 22-25;
CARDS;
CHAN CHI SHING  15 M 70.5
CHEUNG TIN      16 M 67.2
LEUNG MAN SHAN  18 F 72.0
MA YUEN LAN      . F 80.1
WU KEUNG        17 M 75.3
RUN;


* Example 6;

LIBNAME STUDENT "&filepath";
DATA STUDENT.SCORES;
INPUT AGE 17-18 NAME $ 1-15 SEX $ 19 GRADE 21-24;
CARDS;
CHAN CHI SHING  15M 70.5
CHEUNG TIN     *16M 67.2
LEUNG MAN SHAN  18F 72.0
MA YUEN LAN      .F 80.1
WU KEUNG        17M 75.3
RUN;


* Example 7;
DATA;
INPUT X 1-4 @@;
CARDS;
1234
2345
RUN;


* Example 8;
* Read the file Pumpkin.dat using formatted input;
DATA contest;
INFILE "&filepath/Pumpkin.dat";
INPUT Name $16. Age 3. +1 Type $1. +1 Date MMDDYY10.
	(Score1 Score2 Score3 Score4 Score5) (4.1);
RUN;
* Print the data set to make sure the file was read correctly;
PROC PRINT DATA = contest;
	TITLE 'Pumpkin Carving Contest';
RUN;


* Example 9;

DATA SCORES;
INPUT @17 AGE 2. @1 NAME $15. @19 SEX $1. +1 GRADE 4.1;
CARDS;
CHAN CHI SHING  15M 70.5
CHEUNG TIN     *16M 67.2
LEUNG MAN SHAN  18F 72.0
MA YUEN LAN      .F 80.1
WU KEUNG        17M 75.3
RUN;


* Example 10;
* Read a data file NatPark.dat mixing input styles;
DATA nationalparks;
	INFILE "&filepath/NatPark.dat";
	INPUT ParkName $ 1-22 State $ Year @40 Acreage COMMA9.;
RUN;
PROC PRINT DATA = nationalparks;
	TITLE 'Selected National Parks';
RUN;


* Example 11;
DATA Employee1;
	INPUT name $ salary:comma10. state $; 
	* list input;
CARDS;
Ted $2.345 Georgia
Sam $222,345 Florida
RUN;

DATA Employee2;
	INPUT name $ salary comma10. state $; 
	* formatted input;
CARDS;
Ted $2.345 Georgia
Sam $222,345 Florida
RUN;

* Example 12;
DATA kids;
   INFILE "&filepath/kids.dat" DSD;
   * INFILE '&filepath/kids.dat' DLM=','; /*Does not work*/
   INPUT name $ 
         siblings 
         bdate : mmddyy10. 
         allowance : comma2. 
         hobby1 : $10. 
         hobby2 : $10.  
         hobby3 : $10.;
RUN;

DATA kids_a;
   INFILE "&filepath/kids_a.dat" DLM='/' DSD;
   INPUT name $ 
         siblings 
         bdate : mmddyy10. 
         allowance : comma2. 
         hobby1 : $10. 
         hobby2 : $10.  
         hobby3 : $10.;
RUN;

	

