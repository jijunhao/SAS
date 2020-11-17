
title ' "应用多元统计分析"  p260:例6.7.1';
/*----yydy671.sas  */


data d671(type=distance);
array x(8) x1-x8;
   title '由八个体型变量的相关系数转化得到的距离';
   label x1='身高'    x2='手臂长'    x3='上肢长'
         x4='下腿长'  x5='体重'      x6='颈围'
         x7='胸围'    x8='胸宽';
   input  _name_ $ x1-x8;
   do i=1 to 8;
     x(i)=1-abs(x(i));
   end;
   drop i;
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
proc print data=d671;
run;
proc cluster data=d671 method=ave  pseudo outtree=o671;
  var x1-x8;
  id  _name_;
run;
quit;