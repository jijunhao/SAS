
title '  "应用多元统计分析"习题六(p263):6-10 ';
/*----yyexa0610.sas  */


data data610;
  input x1-x7;
  cards;
0.05798    5.5150    347.10    21.910     8586    1742     61.69
0.08441    3.9700    347.20    19.710     7947    2000   2440.00
0.07217    1.1530     54.85     3.052     3860    1445   9497.00
0.15010    1.7020    307.50    15.030    12290    1461   6380.00
5.74400    2.8540    229.60     9.657     8099    1266   12520.0
0.21300    0.7058    240.30    13.910     8980    2820   4135.00
;
proc print;
run;


* 6-10(1) ;
goptions  ftext="宋体";
proc cluster data=data610 method=ave outtree=o610;
  var x1-x7;
run;
proc tree data=o610 horizontal graphics;
    title  '使用类平均法的谱系聚类图(弹头)';
run;
proc cluster data=data610 method=ward outtree=o610;
  var x1-x7;
run;
proc tree data=o610 horizontal graphics;
  title '使用Ward法的谱系聚类图(弹头)';
run;

proc corr data=data610 outp=oc610;
   var x1-x7;
run;


* 6-10 (2) ;
data od610(drop=i);
  set oc610(firstobs=4);
  array  x(7) x1-x7;
  do i=1 to 7;
    x(i)=sqrt(1-abs(x(i)*x(i)));
  end;
run;
proc print data=od610;
run;
proc cluster data=od610 method=ave outtree=o610;
  var x1-x7;
run;
proc tree data=o610 horizontal graphics;
    title  '使用类平均法的谱系聚类图(元素)';
run;
proc cluster data=od610 method=ward outtree=o610;
  var x1-x7;
run;
proc tree data=o610 horizontal graphics;
  title '使用Ward法的谱系聚类图(元素)';
run;


proc varclus data=data610;
run;
proc varclus data=data610 maxc=3 summary outtree=tree;
run;
proc tree data=tree horizontal graphics;
  title '用VARCLUS过程对变量(元素)的聚类结果'; 
run;
quit;

/*
data ob610(drop=i);
  set oc610(firstobs=4);
  array  x(7) x1-x7;
  do i=1 to 7;
    x(i)=1-abs(x(i));
  end;
run;
proc print data=ob610;
run;
proc cluster data=ob610 method=ave outtree=o610;
  var x1-x7;
run;
proc tree data=o610 horizontal graphics;
    title  '使用类平均法的谱系聚类图';
run;
proc cluster data=ob610 method=ward outtree=o610;
  var x1-x7;
run;
proc tree data=o610 horizontal graphics;
  title '使用Ward法的谱系聚类图';
run;
*/