* Chapter 11;

* Enter your file path here;
* %LET filepath = C:\Users\TWWong\Desktop\data\2005;
%LET filepath = /home/u5865803/data;


* Example 1;
* Part 1;
DATA MSalary;
INFILE "&filepath/SALARY.txt";
INPUT NAME $ AGE 2. SEX $ SALARY;
IF SEX = 'M' THEN OUTPUT;
RUN;

* Part 2;
DATA MSalary;
INFILE "&filepath/SALARY.txt";
INPUT NAME $ AGE 2. SEX $ SALARY;
IF ^(SEX = 'M' ) THEN DELETE;
RUN;

* Part 3;
DATA MFSalary;
INFILE "&filepath/SALARY.txt";
INPUT NAME $ AGE 2. SEX $ SALARY;
IF SEX = 'M' THEN OUTPUT;
IF SEX = 'F' AND SALARY > 11000 THEN OUTPUT;
RUN;

* Part 4;
DATA MFSalary;
INFILE "&filepath/SALARY.txt";
INPUT NAME $ AGE 2. SEX $ SALARY;
IF SEX = 'F' AND SALARY > 11000 THEN OUTPUT;
IF ^(SEX = 'M' ) THEN DELETE; OUTPUT;
RUN;


* Example 4;
LIBNAME SCHOOL "&filepath/";
DATA SCHOOL.PARS;
  SET SCHOOL.CLASS;
  KEEP PARENT RELATION NAME;
  IF FATHER ^= '' THEN DO; 
	PARENT = FATHER;
	RELATION = 'FATHER';
	OUTPUT;
  END;
  IF MOTHER ^= '' THEN DO; 
	PARENT = MOTHER;
	RELATION = 'MOTHER';
	OUTPUT;
  END;
RUN;

* Example 5;
* Version 1;
DATA MALE FEMALE;
  SET SCHOOL.CLASS;
  IF GENDER = 'M' THEN OUTPUT MALE;
  ELSE IF GENDER = 'F' THEN OUTPUT FEMALE;
RUN;

* Version 2, with DROP statement;
DATA MALE FEMALE;
  SET SCHOOL.CLASS; DROP GENDER;
  IF GENDER = 'M' THEN OUTPUT MALE;
  ELSE IF GENDER = 'F' THEN OUTPUT FEMALE;
RUN;


* Example 6;
* Version 3, with DROP option;
DATA MALE(DROP = GENDER) FEMALE(DROP = GENDER BIRTH);
  SET SCHOOL.CLASS;
  IF GENDER = 'M' THEN OUTPUT MALE;
  ELSE IF GENDER = 'F' THEN OUTPUT FEMALE;
RUN;


* Example 8;
DATA TEMP;
  INPUT X @@;
  IF X = . THEN STOP;
  CARDS;
  1 3 5 7 . 9 . 11
RUN;

* Example 9;
DATA ABC;
INFILE "&filepath/RECORDS.txt";
INPUT ACC_NO START_D DDMMYY10. +1 AMOUNT COMMA7.;
T=TODAY();
IF (T < START_D) THEN STOP;
INTEREST = AMOUNT *((1.05)**((T - START_D)/365) - 1);
RUN;


* Example 11;
* Version 1, using RENAME option;
LIBNAME SCHOOL "&filepath/";
DATA 
	CLASS_FATHER(RENAME=(PARENT=FATHER)
	LABEL='Data set for fathers of students')
	CLASS_MOTHER(RENAME=(PARENT=MOTHER)
	LABEL='Data set for mothers of students');
	SET SCHOOL.PARS;
	DROP RELATION;
	IF (RELATION = 'FATHER') THEN OUTPUT CLASS_FATHER;
	ELSE OUTPUT CLASS_MOTHER;
RUN;

* Version 2, without using RENAME option;
DATA 
	CLASS_FATHER(DROP = MOTHER
	LABEL='Data set for fathers of students')
	CLASS_MOTHER(DROP = FATHER
	LABEL='Data set for mothers of students');
	SET SCHOOL.PARS;
	DROP PARENT RELATION;
	IF (RELATION = 'FATHER') THEN DO;
	FATHER=PARENT; OUTPUT CLASS_FATHER; END;
	ELSE DO; MOTHER=PARENT; OUTPUT CLASS_MOTHER; END;
RUN;

