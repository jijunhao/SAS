
title '  "应用多元统计分析"习题四(p171):4-3 ';
/*----yyexa0403.sas  */


* 4-3(1) ;
data de403;
  input x1-x3 y;
  cards;
38 47.5 23 66.0
41 21.3 17 43.0
34 36.5 21 36.0
35 18.0 14 23.0
31 29.5 11 27.0
34 14.2  9 14.0
29 21.0  4 12.0
32 10.0  8  7.6
;
proc print;
run;
proc reg data=de403;
  model y=x1-x3;
run;

* 4-3(2);
data ds403;
  set de403;
  x4=x1*x1;x5=x2*x2;x6=x3*x3;
  x7=x1*x2;x8=x1*x3;x9=x2*x3;
run;
proc reg data=ds403;
  model y=x1-x9/selection=stepwise
                sle=0.05 sls=0.05;
run;
quit;
