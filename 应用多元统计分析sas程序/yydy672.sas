
title ' "Ӧ�ö�Ԫͳ�Ʒ���"  p261:��6.7.2';
/*----yydy672.sas  */


data d672(type=corr);
   title '����ѧ���в����˸�����ָ������ϵ��';
   label x1='���'    x2='�ֱ۳�'    x3='��֫��'
         x4='���ȳ�'  x5='����'      x6='��Χ'
         x7='��Χ'    x8='�ؿ�';
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