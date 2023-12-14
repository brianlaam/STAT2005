* Chapter 8;

* Example 1;
DATA distance;
	Miles = 26.22;
	Kilometers = 1.61 * Miles;
	
PROC PRINT DATA = distance;
RUN;

* Example 2;
* Create a data set called "fitness";

DATA fitness;
	INPUT name $ weight waist pulse chins situps jumps;
	CARDS;
	Hodges    191  36  50   5  162   60
	Kerr      189  37  52   2  110   60
	Putnam    193  38  58  12  101  101
	Roberts   162  35  62  12  105   37
	Blake     189  35  46  13  155   58
RUN;

/* Sort the data set "fitness" by name: */

PROC SORT;
	BY name;
RUN;

/* Print out the sorted data set: */

PROC PRINT data=fitness;
	title 'Fitness data';
RUN;

/* Get some descriptive statistics: */

PROC MEANS maxdec=1 data=fitness;
RUN;

* Example 3;
DATA example3;
	INPUT Z;
	X = 5;
	Y = 2 * Z;
	CARDS;
	1
	2
RUN;

PROC PRINT data=example3; 
RUN;

