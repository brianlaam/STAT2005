DATA Q1;
* Q1 /;
x1 = – (2 + 3 / 2) * 4;
*    3    2   1	  4 /;
* result: -14 /;

x2 = Exp(- 3 ** 2 / 4 - 7) * 2;
*     5  2    1   3   4    6 /;
* result: 0.000192223 /;

x3 = – 2 ** 4 + 4 / 2 * 9;
*     2   1   5  3    4/;
* result: 2/;

x4 = 10 * 2 >< 3 ** 2;
*       3    2   1 /;
* result: 20 /;

x5 = 2 + 3 = 6 | 3 & 0;
*       1  2   4   3 /;
* result: 0 /;

x6 = (3 gt 2 = 1);
*    (3 > 2) & (2 = 1) /;
*        1   3    2 /;
* result: 0 /;

x7 = ^(-3) + 3;
*    2  1  3 /;
* result: 3 /;

x8 =  4 in (1, 2, 3, 4, 5) and 2;
*        1                  2 /;
* result: 1 /;

x9 = 4 > 3 >= 2;
*    (4 > 3) & (3 >= 2) /;
*       1    3    2 /;
* result: 1 /;

x10 = not ("ab " = "a" || "b") ;
*       3        2     1 /;
* result: 0 /;
RUN;

* Q2: /;
(a) 
x1 = mdy(1,1,year+1) - mdy(1,1,year);

(b) 
if(scan(x2,3)^= '') then
name = scan(x2,1) || ' ' || substr(scan(x2,2),1,1) || '.' || substr(scan(x2,3),1,1) || '.' ;
else name=scan(x2,1)||' '||substr(scan(x2,2),1,1)||'.';

(c) 
det = b*b-4*a*c;
if det >= 0 then x3 = ((-b+sqrt(det))/(2*a)) <> ((-b-sqrt(det))/(2*a));
else x3 = .;

(d) 
pi = constant('pi');
angle = 52*pi/180;
c=sqrt(a*a+b*b-2*a*b*cos(angle));

(e) 
if length(y) <= 1 then y = x4; 
else y = substr(y,1,length(y)-1)||x4;

* Q3;
data school; 
input Age Quiz $1. Midterm Final; 

IF AGE = 12 THEN GRADE = 6;
ELSE IF AGE = 13 THEN GRADE = 8;

IF QUIZ = 'A' THEN QUIZGrade = 95;
ELSE IF QUIZ = 'B' THEN QUIZGrade = 85;
ELSE IF QUIZ = 'C' THEN QUIZGrade = 75;
ELSE IF QUIZ = 'D' THEN QUIZGrade = 70;
ELSE IF QUIZ = 'F' THEN QUIZGrade = 65;
COURSE = .2*QUIZGrade + .3*MIDTERM + .5*FINAL;

datalines; 
12 A 92 95 
12 B 88 88 
13 C 78 75 
13 A 92 93 
12 F 55 62 
13 B 88 82
PROC PRINT DATA = SCHOOL; 
RUN;

* Q4a;
DATA SUBSET_A;
LIBNAME Asm4 '/home/u63673730/sasuser.v94/STAT2005/Asm4';
SET Asm4.BLOOD;
WHERE GENDER EQ 'Female' AND BLOODTYPE='AB';
COMBINED = .001*WBC + RBC;
RUN;
TITLE "Listing of SUBSET_A";
PROC PRINT DATA=SUBSET_A NOOBS;
RUN;

DATA SUBSET_B;
SET Asm4.BLOOD;
COMBINED = .001*WBC + RBC;
IF GENDER EQ 'Female' AND BLOODTYPE='AB' AND COMBINED GE 14;
RUN;
TITLE "Listing of SUBSET_B";
PROC PRINT DATA=SUBSET_B NOOBS;
RUN;

* Q4b;
DATA LOWMALE LOWFEMALE;
SET Asm4.BLOOD;
WHERE CHOL LT 100 AND NOT MISSING(CHOL);
IF GENDER = 'Female' THEN OUTPUT LOWFEMALE;
ELSE IF GENDER = 'Male' THEN OUTPUT LOWMALE;
RUN;
TITLE "Listing of LOWMALE";
PROC PRINT DATA=LOWMALE;
RUN;
TITLE "Listing of LOWFEMALE";
PROC PRINT DATA=LOWFEMALE;
RUN;