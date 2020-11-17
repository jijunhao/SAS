
title ' "应用多元统计分析"  p229-P231:例6.3.1';
/*----yydy631.sas  */


data d631;
  input name $ x @@;
  cards;
X(1) 1 X(2) 2 X(3) 4.5 X(4) 6 X(5) 8
;
proc cluster data=d631 method=single
             nonorm  outtree=b631;
   var x;
   id name;
run;
proc tree data=b631 out=c631 ncl=2 horizontal graphics;
run;
proc print data=c631;
run;

proc cluster data=d631 method=complete
             nonorm  outtree=b631;
   var x;
   id name;
run;

proc cluster data=d631 method=average
             nonorm  outtree=b631;
   var x;
   id name;
run;

proc cluster data=d631 method=ward
             nonorm  outtree=b631;
   var x;
   id name;
run;
quit;