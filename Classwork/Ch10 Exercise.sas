/* Ex10 */
/* Author: Chung Sin Fai */
/* Q1 */
DATA q1;
/*
(a)	2 ** 5 >< 3 <> 4 * 6
	   3    2    1   4
	result: 96
(b) 2 = ^1 | 3 | 4 & 5 >< 6
	  3	2  5   6   4    1
	result: 1
	1. 5 >< 6 -> 5
	2. ^1 -> 0
	3. 2 = 0 -> 0
	4. 4 & 5 -> 1
	5. 0 | 3 -> 1
	6. 1 | 1 -> 1
(c) 3 ** 3 * 3 * 3 ** 3 ** 3 + 3 * 3 | 3
	   3   4   5    2    1   7   6   8
	result: 1
	We consider the only OR operator in the experssion
	On the right side of OR, the value is 3, which is non-zero, so the expression is 1
(d) 1 < 2 + 3 > 4 - 5 < 6
      3   1   4   2   5
    result: 1
(e) ^ ^ 3 * 4 / 2 = ^ ^ 4 * 3 / 2
    4 3   5   6   9 2 1   7   8
    result: 0
    1. ^4 -> 0
	2. ^0 -> 1
	3. ^3 -> 0
	4. ^0 -> 1
	5. 1 * 4 -> 4
	6. 4 / 2 -> 2
	7. 1 * 3 -> 3
	8. 3 / 2 -> 1.5
	9. 2 = 1.5 -> 0
*/
a = 2 ** 5 >< 3 <> 4 * 6;
b = 2 = ^1 | 3 | 4 & 5 >< 6;
c = 3 ** 3 * 3 * 3 ** 3 ** 3 + 3 * 3 | 3;
d = 1 < 2 + 3 > 4 - 5 < 6;
e = ^^3 * 4 / 2 = ^^4 * 3 / 2;
RUN;

/* Q2a */
DATA q2a;
MONTH = 1;
IF MONTH in (1,3,5,7,8,10,12) THEN A = 31;
/* 
Alternative:
IF MONTH=1|MONTH=3|MONTH=5|MONTH=7|MONTH=8|MONTH=10|MONTH=12 THEN A = 31;
*/
ELSE IF MONTH = 2 THEN A = 28;
ELSE A = 30;
RUN;

/* Q2b */
DATA q2b;
MONTH = 1;
SELECT (MONTH);
WHEN (1,3,5,7,8,10,12) B = 31;
WHEN (2) B = 28;
OTHERWISE B = 30;
END;
RUN;

/* Alternative */
DATA q2b_alt;
MONTH = 1;
SELECT; * not including a variable here;
WHEN (MONTH in (1,3,5,7,8,10,12)) B = 31;
/* 
WHEN (MONTH=1|MONTH=3|MONTH=5|MONTH=7|MONTH=8|MONTH=10|MONTH=12) A = 31;
or
WHEN (MONTH=1,MONTH=3,MONTH=5,MONTH=7,MONTH=8,MONTH=10,MONTH=12) A = 31;
is also ok
*/
WHEN (MONTH = 2) B = 28;
OTHERWISE B = 30;
END;
RUN;

/* Q3 */
DATA q3;
INFILE "/home/u63529371/ex10_strings.txt";
/* u63529371 is the user id, each account has different user id */
LENGTH S $ 50;
INPUT S;
IF (LENGTH(S)>=6&LENGTH(S)<=10) THEN S=SUBSTR(S,1,5);
ELSE IF (LENGTH(S)>10&INDEXC(S,'0123456789')) THEN
	DO WHILE (LENGTH(S)>10&INDEXC(S,'0123456789'));
		IF (INDEXC(S,'0123456789')=1) THEN S=SUBSTR(S,2);
		/* if the first character is a digit, starts at the second charcter */
		ELSE S=SUBSTR(S,1,INDEXC(S,'0123456789')-1)||SUBSTR(S,INDEXC(S,'0123456789')+1);
	END;
RUN;

/* A more clear code using DROP statement from Chapter 11: */
DATA q3_alt;
INFILE "/home/u63529371/ex10_strings.txt";
/* u63529371 is the user id, each account has different user id */
LENGTH S $ 50;
INPUT S;
hvno = INDEXC(S,'0123456789'); * check if S has digits;
L = LENGTH(S);
IF (L>=6&L<=10) THEN S=SUBSTR(S,1,5);
ELSE IF (L>10&hvno) THEN
	DO WHILE (L>10&hvno);
		IF (hvno=1) THEN S=SUBSTR(S,2);
		ELSE S=SUBSTR(S,1,hvno-1)||SUBSTR(S,hvno+1);
		hvno = INDEXC(S,'0123456789');
		L=L-1;
	END;
DROP hvno L; * DROP statement is in Chapter 11;
RUN;
