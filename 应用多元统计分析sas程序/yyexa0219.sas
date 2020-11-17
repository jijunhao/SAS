
title ' "应用多元统计分析"习题二(p50):2-19 ';
/*----yyexa0219.sas  */



data d0219;
  input num x1 x2 x3;
  cards;
 1 65 45 27.6
 2 70 45 30.7
 3 70 48 31.8
 4 69 46 32.6
 5 66 50 31.0
 6 67 46 31.3
 7 68 47 37.0
 8 72 43 33.6
 9 66 47 33.1
10 68 48 34.2
;
proc print;
run;
proc corr data=d0219 cov csscp ;
  var x1-x3;
run;
quit;