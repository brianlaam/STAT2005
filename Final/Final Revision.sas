* 18/19 Sem1;
* Q3;
DATA record;
LENGTH Name $ 13 Address $ 11;
INPUT Name & Address & Sex $ Height Salary COMMA7. Date_of_Employment $ 46-55;

DATALINES;
Chan Tai Man  Sheung Wan  M 168 $31,000      01Jul1993
Lee Siu Ming  Central  F 175 $25,145         01Oct1995
RUN;

* =================================================================================;
* 20/21 Sem1;
* Q5(a)(i);
data club1;
INPUT ID 1-4 Name $ 6-12 Team $ 13-19 StartWeight 20-22 EndWeight 24-26;

DATALINES;
1023 David  red    189 165
1049 Amelia yellow 145
1246 Ravi   yellow     177
RUN;

* Q5(a)(ii);
data club2;
LENGTH ID 4 Name $ 14 Team $ 6;
INPUT ID Name $ & Team StartWeight EndWeight;

DATALINES;
1023 David Shaw  red 189 165
1049 Amelia Serrano   yellow 145 124 
1221 Jim Brown  yellow 220 .
RUN;

* Q5(b)(i);
DATA club1_subset;
    SET club1;
    IF (NOT(StartWeight EQ . OR EndWeight EQ .)) THEN OUTPUT;
RUN;

* Q5(b)(ii);
DATA club2_subset;
	SET club2 (DROP = Team Name);
RUN;

* Q(6);
data Tim;
    input birthday_num;
    
    Y = year(birthday_num);
    M = month(birthday_num);
    D = day(birthday_num);
    
    /* Calculating the weekday (W=1 if Saturday or Sunday, 0 otherwise) */
    W = (weekday(birthday_num) in (1, 7));
    
    current_year = year(today());
    this_year_birthday = mdy(M, D, current_year); 
    
	if this_year_birthday >= today() then
        NEXT = this_year_birthday - today(); 
    else
        NEXT = mdy(M, D, current_year + 1) - today();

/* Calculate Tim's age at the next birthday */
    if today() < this_year_birthday then
        AGE = current_year - Y;
    else
        AGE = current_year - Y + 1;
    
    format birthday_num date9.;
    
    datalines;
11555
;
run;
proc print data=Tim (KEEP=Y M D W NEXT AGE this_year_birthday);
run;

* =================================================================================;
* 21/22 Sem1;
* Q4;
* Data Not Provided;

* =================================================================================;
* 19/20 Sem1;
* Q3a (FUCKED);
DATA Q3;
* INFILE '/home/u63673730/sasuser.v94/STAT2005/Final Revison/1920Sem1Q3.txt';
INPUT city $ & 11. & state $2. coast $5. rate 2.;

DATALINES;
Denver  CO      West     9 ####
 Los Angeles     CA     West  23
San Diego  CA West 10
   Atlanta      GA      South 14
Dallas  TX     South 18
  Washington     DC  South  11
Chicago     IL  North   14
    Cleveland   OH     North 16
Detroit     MI     North   16
 Madison        WI     North   2
run;
proc print;
run;

* Q4a;
DATA Q4a;
LENGTH TIME $ 5 FULL_NAME $ 13;
INPUT TIME $ 
	  FULL_NAME $ 7-19 
	  +(-13) LAST_NAME $ 
	  PLACE $ 22-35
	  SUBJECT $ 37-52
	  LENGTH_MEETING $ 54-63
	  CONFIRMED $ 68-70
	  ;
CARDS;
11:00 Li Lan         Room 30        Personnel review 45 minutes    Yes
13:00 Leung Mei Fai  Leung's office Marketing        30 minutes    No
15:00 Mak David      Lab            Test results     20 minutes    Yes
run;
proc print;
run;

* Q4b;
DATA Q4b;
LENGTH TIME $ 5 FULL_NAME $ 13 PLACE $ 14 SUBJECT $ 16;
INPUT TIME $ 
	  LAST_NAME $  
	  @7 FULL_NAME $ &
	  PLACE $ & 
      SUBJECT $ &
      @52 LENGTH:2.
      CONFIRMED $3.
	  ;
CARDS;
11:00 Li Lan      Room 30          Personnel review 45 Yes#
13:00 Leung Mei Fai  Leung's office  Marketing     30 No
15:00 Mak David     Lab            Test results      20 Yes
run;
proc print DATA=Q4b;
	VAR TIME LAST_NAME FULL_NAME PLACE SUBJECT LENGTH CONFIRMED;
run;

* Q4c (FUCKED);
DATA Q4c;
LENGTH TIME $ 5;
INPUT TIME $
      @7 LAST_NAME $
      @7 FULL_NAME $ & 7-19
      PLACE & $14. 
      SUBJECT & $16.
      ;
CARDS;
11:00 Li Lan      Room 30       Personnel review  45 minsYes
 13:00Leung Mei Fai   Leung's office Marketing      30 mins No
15:00 Mak David      Lab            Test results        20 mins Yes
run;
proc print;
run;

* =================================================================================;
* 22/23 Sem1;
* Q3(a) ;
/*
: modifier can preserve formatting: 
It can preserve the original formatting of input data (like leading and trailing spaces), 
using the colon modifier preserves these spaces as part of the variable's value.
*/

* Q3(b);
DATA Q3b;
* INFILE 'C:\Folder\StudentInfo.dat';
INPUT AGE 
	  CITY : & $QUOTES15.
	  * CITY $QUOTE15.
	  Name $;


CARDS;
20 "San Diego" Rebecca 10OCT2020 "Economics" "Accounting"
19 "San Francisco" Kathy 1SEP2021 "Biology" "Chemistry"
18 "Las Vegas" Ethan 15JAN2022 "Music" "Chinses Literature"
run;

proc print DATA=Q3b;
run;

* =================================================================================;
* 22/23 Sem2;
* Q3(a);
DATA Q3a;
* INFILE 'C:\Folder\hotel.txt';
INPUT ROOM 1-3 GUESTS 5 
      InM 9 InD 13-14 InY 17-20 
      OutM 25 OutD 29-30 OutY 33-36 
      RoomType & $13. Rate :DOLLAR8.;

CARDS;
211 3   2   7   2019    2   11  2019 Deluxe Suite    $295
214 2   2   2   2019    2   12  2019 Basic no view  $75
216 4   2   2   2019    2   13  2019 Suite  $255
220 5   2   3   2019    2   12  2019 Basic w/view   $155
221 3   2   3   2019    2   12  2019 Luxury  $195
223 5   2   7   2019    2   13  2019 Suite  $255
238 4   1   31  2019    2   13  2019 Basic w/view   $155
241 1   2   1   2019    2   13  2019 Luxury  $195
run;
PROC PRINT;
title "Hotel";
RUN;

* Q3(b);
DATA Q3b;
SET Q3a;
InDate = MDY(InM,InD,Iny);
OutDate = MDY(OutM,OutD,Outy);
PROC PRINT;
title "Hotel";
RUN;

* Q3(c);
DATA Q3c;
SET Q3b;
Charge = (OutDate-InDate)*Rate + 10*GUESTS;
PROC PRINT;
title "Hotel";
RUN;
