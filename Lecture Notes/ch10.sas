* Chapter 10;

* Enter your file path here;
* %LET filepath = C:\Users\TWWong\Desktop\data\2005;
%LET filepath = /home/u5865803/data;


* Example 1;
DATA AA;
X=2; Y = '1E2'; W='A123456789012'; T='K';
Z=X+Y; W=T||X; X = Y;
RUN;

* Print the data set to a file;
PROC PRINTTO NEW PRINT="&filepath/listing.lst"; 
RUN;

PROC PRINT DATA=AA; RUN;
PROC PRINTTO; RUN;


* Example 2;
DATA TESTING; 
a=1; b=2; c=3; d=4; aa='abc'; 
* result = a**2/b+c**2*d-2; 
* result = (a = b & c < d) | a<=d; 
* result = (b ^= c) = a; 
* result = aa ^= 'a' || "bc"; 
* result = a +(b > c); 
* result = 4**sin(2*a-b)/5; 
* result = a + sqrt(d) ** 1 <> b; 
* result = ^ c – 1; 
* result = c = 1 | 2; 
PUT result=; 
RUN;


* Example 5;
DATA ;
INPUT C1 - C3;
A1 = LOG(C1) - 1; A2 = MEAN(OF C1 - C3); C3 = MIN(A2, C3+2);
CARDS;
. 64 56
3 30 .
4 22 45
RUN;


* Example 6;
DATA;
X=TODAY(); Y=YEAR(X); M=MONTH(X); D=DAY(X);
PUT Y= M= D=;
RUN;


* Example 7;
DATA;
X='STAT 2005 Programming Languages for Statistics';
W=LENGTH(X); Y=UPCASE(X);
Z=LOWCASE(X); T=INDEX(X,'ram');
R=INDEXC(X,'Daot'); G=INDEXW(X,'Programming');
K=SUBSTR(X,18); PUT _ALL_;
RUN;


* Example 13;
DATA TEMP;
INFILE "&filepath/swim.txt";
INPUT EVENT $ 1-22 A $ 24-31 NAME $ 33-55 ;
T=INDEX(A,':');
IF T THEN TIME=60*SUBSTR(A,1,T-1)+SUBSTR(A,T+1);
ELSE TIME=A;
RUN;

DATA WORLD_RECORD(KEEP = NAME EVENT TIME); 
SET TEMP;
RUN;


* Example 18;
DATA EXPONENTIAL;
DO X = 0 TO 4 BY 0.02;
	Y = EXP(-X);
	OUTPUT;
END;
RUN;

SYMBOL1 COLOR=RED VALUE=NONE INTERPOL=JOIN;
* Defines the characteristics of symbols that display the data plotted;
* INTERPOL=JOIN connects data points with straight lines;
* VALUE=NONE suppresses the ploting symbol;
PROC GPLOT DATA=EXPONENTIAL; 
     PLOT Y*X; 
RUN;


* Example 19;
DATA T;
	A=0; B=1;
	DO I=1 TO 20;
		A=SQRT(0.5+A/2); B=B*A;
	END;
	D= 2/B; PUT B= D=;
RUN;


* Example 20;
DATA NORMAL_APPROX;
	INPUT N P;
	A=0;
	DO K=0 TO N;
		A=MAX(ABS(PROBBNML(P,N,K) - PROBNORM((K+0.5-N*P)/SQRT(N*P*(1-P)))),A);
	END;
	PUT N= P= A=;
	CARDS;
	10 0.5
	8 0.3
RUN;


* Example 21;
DATA FIBONACCI;
	F1=1; F2=1;
	DO WHILE (F2 < 1000);
		A=F1+F2; F1=F2; F2=A;
	END;
	PUT F1=;
RUN;



