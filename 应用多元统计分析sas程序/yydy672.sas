
title ' "应用多元统计分析"  p261:例6.7.2';
/*----yydy672.sas  */


data d672(type=corr);
   title '在中学生中测量八个体型指标的相关系数';
   label x1='身高'    x2='手臂长'    x3='上肢长'
         x4='下腿长'  x5='体重'      x6='颈围'
         x7='胸围'    x8='胸宽';
   input  _name_ $ x1-x8;
   _type_='corr';
   cards;
x1 1.000  .846  .805  .859  .473  .398  .301  .382
x2  .846 1.000  .881  .826  .376  .326  .277  .415
x3  .805  .881 1.000  .801  .380  .319  .237  .345
x4  .859  .826  .801 1.000  .436  .329  .327  .365
x5  .473  .376  .380  .436 1.000  .762  .730  .629
x6  .398  .326  .319  .329  .762 1.000  .583  .577
x7  .301  .277  .237  .327  .730  .583 1.000  .539
x8  .382  .415  .345  .365  .629  .577  .539 1.000
;
proc print;
title;
proc varclus data=d672;
run;
proc varclus data=d672 centroid;
run;
proc varclus data=d672 maxc=8 summary outtree=o672;
run;
proc tree  data=o672  horizontal graphics ;
run;
quit;