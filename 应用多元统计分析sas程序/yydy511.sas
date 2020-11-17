
title ' "应用多元统计分析"  p181-P183:例5.1.1';
/*----yydy511.sas  */


data d511;
   input x1-x4 group $;
   cards;
13.85 2.79  7.80 49.60 A
22.31 4.67 12.31 47.80 A
28.82 4.63 16.18 62.15 A
15.29 3.54  7.50 43.20 A
28.79 4.90 16.12 58.10 A
 2.18 1.06  1.22 20.60 B
 3.85 0.80  4.06 47.10 B
11.40 0.00  3.50  0.00 B
 3.66 2.42  2.14 15.10 B
12.10 0.00  5.68  0.00 B
 8.85 3.38  5.17 26.10 .
28.60 2.40  1.20 127.0 .
20.70 6.70  7.60 30.20 .
 7.90 2.40  4.30 33.20 .
 3.19 3.20  1.43  9.90 .
12.40 5.10  4.43 24.60 .
16.80 3.40  2.31 31.30 .
15.00 2.70  5.02 64.00 .
;

options ps=60 ls=75;
proc print data=d511;
run;
proc discrim data=d511 simple wcov pcov
             wsscp psscp distance list;
   class group;
   var x1-x4;
run;


/* 解法二 */

data ds511;
   input x1-x4 group $;
   cards;
13.85 2.79  7.80 49.60 A
22.31 4.67 12.31 47.80 A
28.82 4.63 16.18 62.15 A
15.29 3.54  7.50 43.20 A
28.79 4.90 16.12 58.10 A
 2.18 1.06  1.22 20.60 B
 3.85 0.80  4.06 47.10 B
11.40 0.00  3.50  0.00 B
 3.66 2.42  2.14 15.10 B
12.10 0.00  5.68  0.00 B
;
data d511test;
   input x1-x4 group $;
   cards;
 8.85 3.38  5.17 26.10 .
28.60 2.40  1.20 127.0 .
20.70 6.70  7.60 30.20 .
 7.90 2.40  4.30 33.20 .
 3.19 3.20  1.43  9.90 .
12.40 5.10  4.43 24.60 .
16.80 3.40  2.31 31.30 .
15.00 2.70  5.02 64.00 .
;
proc discrim data=ds511 testdata=d511test list testlist;
   class group;
   var x1-x4;
run;
quit;