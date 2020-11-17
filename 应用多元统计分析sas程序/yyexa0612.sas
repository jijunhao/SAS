
title '  "应用多元统计分析"习题六(p264):6-12 ';
/*----yyexa0612.sas  */


data data612;
  input num x1-x3 type ;
  cards;
1  0.045    0.043    0.265  2
2  0.066    0.039    0.264  2
3  0.094    0.061    0.194  2
4  0.003    0.003    0.102  3
5  0.048    0.015    0.106  3
6  0.210    0.066    0.263  1
7  0.086    0.072    0.274  2
8  0.196    0.072    0.211  1
9  0.187    0.082    0.301  1
10 0.053    0.060    0.209  2
11 0.020    0.008    0.112  3
12 0.035    0.015    0.170  3
13 0.205    0.068    0.284  1
14 0.088    0.058    0.215  2
15 0.101    0.052    0.181  .
16 0.045    0.005    0.122  .
;

proc print data=data612;
run;
proc cluster data=data612 method=ave outtree=o612;
  var x1-x3;
  id num;
run;

goptions  ftext="宋体";
proc tree data=o612 horizontal graphics;
    title  '使用类平均法的谱系聚类图';
run;


proc cluster data=data612 method=ward outtree=o612;
  var x1-x3;
run;
proc tree data=o612 horizontal graphics;
  title '使用Ward法的谱系聚类图';
run;
quit;
