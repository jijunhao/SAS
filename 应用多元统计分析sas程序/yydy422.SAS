
title ' "应用多元统计分析"  p128-P130:例4.2.2';
/*----yydy422.sas  */


data d411;
  input x1-x4 y ;
  cards;
7  26  6 60  78.5
1  29 15 52  74.3
11 56  8 20 104.3
11 31  8 47  87.6
7  52  6 33  95.9
11 55  9 22 109.2
3  71 17  6 102.7
1  31 22 44  72.5
2  54 18 22  93.1
21 47  4 26 115.9
1  40 23 34  83.8
11 66  9 12 113.3
10 68  8 12 109.4
;

proc reg data=d411;
   model y=x1-x4 / selection=rsquare 
                   b adjrsq cp aic mse sbc; 
run;

quit;

