/* Q4(a) */
DATA PERSONNEL;
INPUT ID $ 1-4 
      DEPT $ 1 
      + 6 BIRTHDAY DATE9.
      YEAR 12-15
       + 4 SALARY COMMA8.2;
CARDS;
A123   4Mar1989    8,60000
A037  23Jun1957   21,45000
M015  19Sep1977   17,50000
RUN;

/* Q4(b) */
DATA PERSONNEL;
INPUT ID: $4.
	  +(-5) DEPT $1. 
	  +4 BIRTHDAY DATE9. 
      +(-4) YEAR 4. 
      SALARY COMMA8. /;
CARDS;

A123  4Mar1989  8,6,00
***************
    A037 23Jun1957  21,450
**************
 M015 19Sep1977$17,500
***********
RUN;




