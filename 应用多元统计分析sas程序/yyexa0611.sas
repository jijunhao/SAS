
title '  "应用多元统计分析"习题六(p264):6-11 ';
/*----yyexa0611.sas  */



data data611;
   input num type  cu ag bi;
   cards;
1  1  2.58 0.90 0.95
2  1  2.90 1.23 1.00
3  1  3.55 1.15 1.00
4  1  2.35 1.15 0.79
5  1  3.54 1.85 0.79
6  1  2.70 2.23 1.30
7  1  2.70 1.70 0.48
8  0  2.25 1.98 1.06
9  0  2.16 1.80 1.06
10 0  2.33 1.74 1.10
11 0  1.96 1.48 1.04
12 0  1.94 1.40 1.00
13 0  3.00 1.30 1.00
14 0  2.78 1.70 1.48
;
proc print;
run;
proc cluster data=data611 method=ave outtree=o611;
  var cu ag bi;
  id num;
run;

goptions  ftext="宋体";
proc tree data=o611 horizontal graphics;
    title  '使用类平均法的谱系聚类图';
run;

proc cluster data=data611 method=ward outtree=o611;
  var cu ag bi;
  id num;
run;
proc tree data=o611 horizontal graphics;
  title '使用Ward法的谱系聚类图';
run;
quit;
