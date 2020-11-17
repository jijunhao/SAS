
title ' "应用多元统计分析"  p28 : 例2.2.2 ';

/*  'yydy222.sas */

goptions ftext="黑体";

title2 '相关系数r=0,a1=a2=1';
data normal1;
  a=1;b=1; r=0;
  a2=sqrt(a);b2=sqrt(b); p2=2*3.1415926;
  d=1-r*r;d2=sqrt(d)*a2*b2;
  do x=-3 to 3 by 0.1;
     do y=-3 to 3 by 0.1;
        z1=exp((-x*x/a-y*y/b+2*r*x*y/(a2*b2))/d);
        z=z1/(p2*d2);
        output;
     end;
  end;
  keep x y z;
run;
proc g3d data=normal1;
  plot y*x=z / name='GB0309'  rotate=-30 /* ctop=black cbottom=black */
               xticknum=7 
               yticknum=7;              
run;

proc gcontour data=normal1;
  plot y*x=z;
run;



title2 '相关系数=0.75, a1=a2=1';
data normal3;
  a=1;b=1; r=0.75;
  a2=sqrt(a);b2=sqrt(b); p2=2*3.1415926;
  d=1-r*r;d2=sqrt(d)*a2*b2;
  do x=-3 to 3 by 0.1;
     do y=-3 to 3 by 0.1;
        z1=exp((-x*x/a-y*y/b+2*r*x*y/(a2*b2))/d);
        z=z1/(p2*d2);
        output;
     end;
  end;
  keep x y z;
run;

proc g3d data=normal3;
  plot y*x=z / name='GB0309'  rotate=-30 
               xticknum=7 
               yticknum=7;
run;

proc gcontour data=normal3;
  plot y*x=z;
run;

title2 '相关系数=-0.75, a1=4,a2=1';
data normal2;
  a=4;b=1; r=-0.75;
  a2=sqrt(a);b2=sqrt(b); p2=2*3.1415926;
  d=1-r*r;d2=sqrt(d)*a2*b2;
  do x=-3 to 3 by 0.1;
     do y=-3 to 3 by 0.1;
        z1=exp((-x*x/a-y*y/b+2*r*x*y/(a2*b2))/d);
        z=z1/(p2*d2);
        output;
     end;
  end;
  keep x y z;
proc g3d data=normal2;
  plot y*x=z / name='GB0309'  rotate=-30 
               xticknum=7
               yticknum=7 ;
run;

proc gcontour data=normal2;
  plot y*x=z;
run;

quit;