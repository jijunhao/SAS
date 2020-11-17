
title ' "应用多元统计分析"  p198-P199:例5.3.2';
/*----yydy532.sas  */

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


proc candisc data=d522 out=can532  ncan=2 distance simple;
  class group;
  var x1-x4;
run;

goptions ftext='宋体';
symbol1 cv=reg v=square h=2;
symbol2 cv=blue v=star h=2;
symbol3 cv=green v=dot h=2;

proc gplot data=can532;
  plot can2*can1 = group;
run;
proc print data=can532;
run;

proc discrim data=can532 distance list;
  class group;
  var can1 can2;
run;

proc discrim data=can532 pool=test distance list;
  class group;
  var can1 can2;
run;
quit;

