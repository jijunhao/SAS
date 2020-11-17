
title ' "应用多元统计分析"  p191-P192:例5.2.2';
/*----yydy522.sas  */



data d522;
  input group x1-x4 @@;
  cards;
1 228 134 20 11  1 245 134 10 40
1 200 167 12 27  1 170 150  7  8
1 100 167 20 14  2 225 125  7 14
2 130 100  6 12  2 150 117  7  6
2 120 133 10 26  2 160 100  5 10
3 185 115  5 19  3 170 125  6  4
3 165 142  5  3  3 135 108  2 12
3 100 117  7  2
;
proc print data=d522;
run;

proc discrim data=d522 pool=no distance list;
  class group;
* priors '1'=0.33333 '2'=0.33333 '3'=0.33333;
  var x1-x4;
run;
quit;



