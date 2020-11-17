
title ' "应用多元统计分析"  p339-P341:例9.3.2';
/*----yydy932.sas  */


data  d932;
  input group $ a b c d e f g;
  cards;
1山西     0.583910 0.111480 0.092473 0.050073 0.038193 0.018803 0.079946
2内蒙古   0.581218 0.081315 0.112380 0.042396 0.043280 0.040004 0.083339
3辽宁     0.565036 0.100121 0.123970 0.041121 0.043429 0.031328 0.078919
4吉林     0.530918 0.105360 0.116952 0.045064 0.043735 0.038508 0.095256
5黑龙江   0.555201 0.096500 0.143498 0.037566 0.052111 0.026267 0.072829
6海南     0.654952 0.047852 0.095238 0.047945 0.022134 0.018519 0.096844
7四川     0.640012 0.061680 0.116677 0.048471 0.033529 0.017439 0.072043
8贵州     0.725239 0.056362 0.073262 0.044388 0.016366 0.015720 0.057261
9甘肃     0.678630 0.058043 0.088316 0.038100 0.039794 0.015167 0.067999
0青海     0.665913 0.088508 0.096899 0.038191 0.039275 0.019243 0.033801
;
proc print;
  format group $8.0  a b c d e f g 8.6;
  id group;
  var a b c d e f g;
run;

proc corresp data=d932 all out=o932;
  var  a b c d e f g;
  id group;
run;

proc print data=o932;
run;

data o932;
  set o932;
  if _type_='VAR' then group=substr(group,1,1);
run;

options ps=40 ls=90;
proc plot data=o932;
   plot dim2*dim1=group /box  vspace=15  hspace=27  vref=0 href=0
            haxis=-.5 to .5 by .1 vaxis=-.2 to .4 by .1;
run;
quit;