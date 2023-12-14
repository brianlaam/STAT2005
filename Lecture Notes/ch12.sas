* Chapter 12;

* Enter your file path here;
* %LET filepath = C:\Users\TWWong\Desktop\data\2005;
%LET filepath = /home/u5865803/data;


* Example 1;
DATA D1; INPUT X $ Y @@;
CARDS;
A 10 C 11 H 13
RUN;
DATA D2; INPUT X $ Y @@;
CARDS;
B 12 D 14
RUN;
DATA COMB; SET D1 D2; RUN; 


* Example 2;
DATA D1; INPUT X $ Y @@;
CARDS;
A 10 C 11 H 13
RUN;
DATA D2; INPUT X $ Z @@;
CARDS;
B 12 D 14
RUN;
DATA COMB; SET D1 D2; RUN; 


* Example 5;
DATA D1; INPUT X $ Y @@;
CARDS;
A 10 C 11 D 13
RUN;
DATA D2; INPUT X $ Y @@;
CARDS;
B 12 D 14
RUN;
DATA COMB; SET D1 D2; BY X; RUN;


* Example 6;
DATA southentrance;
INFILE "&filepath/South.dat";
INPUT Entrance $ PassNumber PartySize Age;
PROC PRINT DATA = southentrance;
TITLE 'South Entrance Data'; RUN;
DATA northentrance;
INFILE "&filepath/North.dat";
INPUT Entrance $ PassNumber PartySize Age Lot;
PROC SORT DATA = northentrance;
BY PassNumber;
PROC PRINT DATA = northentrance;
TITLE 'North Entrance Data'; RUN;

* Interleave observations by PassNumber;
DATA interleave;
SET northentrance southentrance;
BY PassNumber; RUN;
PROC PRINT DATA = interleave;
TITLE 'Both Entrances, By Pass Number'; 
RUN;


* Example 7;
DATA D1; INPUT X $ Y @@;
CARDS; 
A 10 C 11 D 13 
RUN;
DATA D2; INPUT Z $ Y @@;
CARDS; 
B . D 14 
RUN;
DATA COMB; MERGE D1 D2; RUN;


* Example 8;
DATA D1; INPUT X $ Y @@;
CARDS; 
A 10 C 11 D 13 
RUN;
DATA D2; INPUT X $ Y @@;
CARDS; 
B . D 14 
RUN;
DATA COMB1; MERGE D1 D2; RUN;
PROC PRINT; RUN;
DATA COMB2; SET D1; SET D2; RUN;
PROC PRINT; RUN;


* Example 9;
DATA D1; INPUT X $ Y @@;
CARDS; 
A 10 C 11 H 13 
RUN;
DATA D2; INPUT X $ Z S @@;
CARDS; 
C 12 10 C 17 15 D 14 9 
RUN;
DATA COMB(KEEP = X Y S W);
MERGE D1 D2; BY X; W = Y+Z; RUN;


* Version 2;
DATA COMB(KEEP= X Y S W);
MERGE D1(IN=A) D2(IN=B);
BY X; W = Y+Z;
IF A AND B THEN OUTPUT;
RUN;


* Example 10;
DATA DATA1; INPUT YEAR VARX $ @@;
CARDS; 
1991 X1 1992 X2 1993 X3 1994 X4 1994 X5 1995 X6 1995 X7 
RUN;
DATA DATA2; INPUT YEAR VARY $ @@;
CARDS; 
1991 Y1 1991 Y2 1993 Y3 1994 Y4 1994 Y5 1995 Y6 
RUN;
DATA ALL;
MERGE DATA1 DATA2; BY YEAR;
RUN;

* Version 2;
DATA ALL;
MERGE DATA1 DATA2; BY YEAR;
OUTPUT; IF VARX = 'X1' THEN VARX='***';
RUN;



* Example 11;
LIBNAME IN "&filepath";
PROC SORT 
	DATA=IN.NATLPARK OUT=TEMP1; 
	BY YRESTAB; 
RUN;
PROC SORT 
	DATA=IN.PRES OUT=TEMP2; 
	BY INAUG; 
RUN;
DATA IN.PARK;
LENGTH P $ 20 PRESID $ 20;
RETAIN P;
MERGE 
	TEMP1(IN=A)
	TEMP2(IN=B RENAME=(INAUG=YRESTAB NAME=PRESID));
	BY YRESTAB;
IF A AND B THEN DO;
	TEMP=PRESID;
	PRESID= TRIM(P)||', '||TRIM(PRESID)||' ?';
	OUTPUT; P=TEMP; DELETE;
END;
IF B = 0 THEN DO; 
	PRESID=P; OUTPUT; 
END;
	ELSE P=PRESID;
KEEP PARK -- ACRES PRESID;
RUN;

* Example 14;
LIBNAME IN "&filepath";
DATA IN.PATIENTMASTER;
	INFILE "&filepath/Admit.dat";
	INPUT 
		ACCOUNT LASTNAME $ 8-16 
		ADDRESS $ 17-34 
		BIRTHDATE MMDDYY10. 
		SEX $ 
		INSCODE $ 48-50 
		@52 LASTUPDATE MMDDYY10.; 
RUN;
DATA TRANSACTIONS;
	INFILE "&filepath/NewAdmit.dat";
	INPUT 
		ACCOUNT LASTNAME $ 8-16 
		ADDRESS $ 17-34 
		BIRTHDATE MMDDYY10.
		SEX $ 
		INSCODE $ 48-50 
		@52 LASTUPDATE MMDDYY10.; 
RUN;
PROC SORT 
	DATA = TRANSACTIONS;
	BY ACCOUNT; 
RUN; 
* Update patient data with transactions;
DATA IN.PATIENTMASTER;
	UPDATE IN.PATIENTMASTER TRANSACTIONS;
	BY ACCOUNT; 
RUN;
PROC PRINT 
	DATA = IN.PATIENTMASTER;
	FORMAT BIRTHDATE LASTUPDATE MMDDYY10.;
	TITLE 'Admissions Data'; 
RUN;


