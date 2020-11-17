
title '  "应用多元统计分析" 习题八(p323): 8-8 ';
/*----yyexa0808.sas  */


data data808;
   input x1-x5 @@;
   label x1='力学(闭)'  x2='物理(闭)'
         x3='代数(开)'  x4='分析(开)' x5='统计(开)';
   n=_n_;
   cards;
77 82 67 67 81 63 78 80 70 81
75 73 71 66 81 55 72 63 70 68
63 63 65 70 63 53 61 72 64 73
51 67 65 65 68 59 70 68 62 56
62 60 58 62 70 64 72 60 62 45
52 64 60 63 54 55 67 59 62 44
50 50 64 55 63 65 63 58 56 37
31 55 60 57 73 60 64 56 54 40
44 69 53 53 53 42 69 61 55 45
62 46 61 57 45 31 49 62 63 62
44 61 52 62 46 49 41 61 49 64
12 58 61 63 67 49 53 49 62 47
54 49 56 47 53 54 53 46 59 44
44 56 55 61 36 18 44 50 57 81
46 52 65 50 35 32 45 49 57 64
30 69 50 52 45 46 49 53 59 37
40 27 54 61 61 31 42 48 54 68
36 59 51 45 51 56 40 56 54 35
46 56 57 49 32 45 42 55 56 40
42 60 54 49 33 40 63 53 54 25
23 55 59 53 44 48 48 49 51 37
41 63 49 46 34 46 52 53 41 40
;
proc print data=data808;
run;

proc factor data=data808 p=0.8 method=prin simple;
  var x1-x5;
run;

proc factor data=data808 rotate=varimax  n=2 ;
  var x1-x5;
run;
proc factor data=data808 score n=2 out=o88;
   var x1-x5;
run;

proc print data=o88;
   var factor1 factor2;
run;
options ls=80 ps=35;
proc plot data=o88;
   plot factor2*factor1 $ n='*'/href=0 vref=0;
run;
quit;
