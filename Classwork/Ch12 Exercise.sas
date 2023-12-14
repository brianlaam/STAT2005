/* Ex12 */
/* Author: Chung Sin Fai */
/* Q1a */
DATA A;
INPUT X Y;
CARDS;
1 2
3 4
5 6
7 8
RUN;

DATA B;
INPUT X Y;
CARDS;
1 1
3 3
5 5
RUN;

/* Q1b */
DATA q1b;
SET A B;
BY X Y;
RUN;

/* Q1c */
DATA q1c;
MERGE A B;
RUN;

/* Q2a */
DATA C;
INPUT X Y Z;
CARDS;
1 2 5
2 3 6
3 4 7
RUN;

DATA D;
INPUT X Y Z;
CARDS;
1 3 .
2 4 .
3 4 5
4 5 6
RUN;

/* Q2b */
DATA q2b;
UPDATE C D;
BY X;
RUN;