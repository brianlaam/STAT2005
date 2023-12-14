/* Ex11 */
/* Author: Chung Sin Fai */

LIBNAME home "/home/u63529371/";
/* u63529371 is the user id, each account has different user id */

/* Q1a */

DATA home.ocamp;
/* create a permanent dataset at "/home/u63529371/" */
INFILE "/home/u63529371/ex11_ocamp.txt";
/* u63529371 is the user id, each account has different user id */
LENGTH Name $ 20;
INPUT Name Sex $ Year Duty $;
RUN;

DATA EC;
SET home.ocamp;
WHERE (Duty = 'EC');
RUN;

/* Q1b */
DATA Name_only;
SET home.ocamp(KEEP=Name);
/* Alternative */
* SET home.ocamp(DROP=Sex Year Duty);
RUN;

/* Q2a */
DATA home.activity_list;
/* create a permanent dataset at "/home/u63529371/" */
/* home is defined as in q1a */
INFILE "/home/u63529371/ex11_activities.txt";
/* u63529371 is the user id, each account has different user id */
LENGTH Activity $ 20;
INPUT Activity & Day;
RUN;

DATA q2a;
SET home.activity_list(WHERE = (Day>=2&Day<=6) OBS=5);
RUN;

/* Q2b */
DATA Weekdays Weekend;
SET home.activity_list;
IF (Day>=2&Day<=6) THEN OUTPUT Weekdays;
ELSE OUTPUT Weekend;
RUN;

/* Q2c */
DATA q2c;
SET home.Activity_list(RENAME = (Activity=A Day=D));
/* home is defined in q1a */
RUN;