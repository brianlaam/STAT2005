/* Ex8 */
/* Author: Chung Sin Fai */

/* Q1a */
LIBNAME STAT2005 '/home/u63529371';
/* u63529371 is the user id, each account has different user id */
DATA q1a;
q1a = 2005;
RUN;
PROC PRINT DATA = q1a;
RUN;

/* Q1b */
DATA ans;
	INFILE "/home/u63529371/ex8_q1b.dat";
	/* u63529371 is the user id, each account has different user id */
	INPUT A B;
	AplusB = A + B;
RUN;
PROC SORT;
	BY A;
RUN;
PROC PRINT DATA = ans;
RUN;

/* Q2a */
data q2a;
	A = 1;
	A = A+1; * comment ;
	/* comment */
	* comment;
RUN;

/* Q2b */
dATa q2b; 	/* note that SAS is case-insensitive */
	INPUT C;
	A = 3*C;	/* change x to * */
	B = A-c;    /* add a semicolon */
	CARDS;/* change CARD to CARDS */
	1
	2
RUN;
PROC PRINT data = q2b; /* add PROC  before PRINT */
RUN;