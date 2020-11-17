
title '  "应用多元统计分析"习题五(p213):5-10 ';
/*----yyexa0510.sas  */


data data510;
    input num x1-x4 type;
    cards;
1     6.0    -11.5    19     90      1
2   -11.0    -18.5    25    -36      3
3    90.2    -17.0    17      3      2
4    -4.0    -15.0    13     54      1
5     0.0    -14.0    20     35      2
6     0.5    -11.5    19     37      3
7   -10.0    -19.0    21    -42      3
8     0.0    -23.0     5    -35      1
9    20.0    -22.0     8    -20      3
10 -100.0    -21.4     7    -15      1
11 -100.0    -21.5    15    -40      2
12   13.0    -17.2    18      2      2
13   -5.0    -18.5    15     18      1
14   10.0    -18.0    14     50      1
15   -8.0    -14.0    16     56      1
16    0.6    -13.0    26     21      3
17  -40.0    -20.0    22    -50      3
1    -8.0    -14.0    16     56      .
2    92.2    -17.0    18      3      .
3   -14.0    -18.5    25    -36      .
;
proc print;
run;

* 5-10(1);

proc  discrim  data=data510 distance list;
  class type;
  var x1-x4;
  id num;
run;

* 5-10(2) ;
proc  discrim  data=data510 pool=test distance list;
  class type;
  priors proportional;
  var x1-x4;
  id num;
run;

proc stepdisc  data=data510 simple sle=0.18 sls=0.18 ;
  class type;
  var x1-x4;
run;
proc discrim data=data510  list;
  class type;
  var x2 x4;
  id num;
run;
/*
proc  stepdisc  data=data510 ;
  class type;
  var x1-x4;
run;
proc discrim data=data510  list;
  class type;
  var x3 x4;
run;
*/
quit;