
title ' "应用多元统计分析"  p288-P289:例7.3.3';
/*----yydy733.sas  */



data d733;
  input x1-x3 y;
  cards;
149.3    4.2    108.1    15.9
161.2    4.1    114.8    16.4
171.5    3.1    123.2    19.0
175.5    3.1    126.9    19.1
180.8    1.1    132.1    18.8
190.7    2.2    137.7    20.4
202.1    2.1    146.0    22.7
212.4    5.6    154.1    26.5
226.1    5.0    162.3    28.1
231.9    5.1    164.3    27.6
239.0    0.7    167.6    26.3
;
proc corr data=d733;
  var x1-x3;
run;
proc standard data=d733  out=do733 mean=0 std=1;
  var x1-x3 y;
run;

proc princomp  data=do733 prefix=z out=o733 ;
  var x1 x2 x3;
run;

proc print data=o733;
  var z1 z2 y;
run;


proc reg data=o733 ;
  model y=z1 z2;
run;

proc reg data=d733 outest=out733;
  model y=x1-x3/pcomit=1,2;
run;
options ps=40 ls=100;
proc print data=out733;
run;
quit;