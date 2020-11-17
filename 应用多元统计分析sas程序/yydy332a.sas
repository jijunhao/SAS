
title ' "应用多元统计分析"   p83-P85 : 例3.3.2 ---- 解法一 ';
/* ---- yydy332a.sas ---- */

data d332;
  input x1-x4 group @@;
  cards;
260  75 40 18 1 200  72 34 17 1 240  87 45 18 1 170  65 39 17 1
270 110 39 24 1 205 130 34 23 1 190  69 27 15 1 200  46 45 15 1
250 117 21 20 1 200 107 28 20 1 225 130 36 11 1 210 125 26 17 1
170  64 31 14 1 270  76 33 13 1 190  60 34 16 1 280  81 20 18 1
310 119 25 15 1 270  57 31  8 1 250  67 31 14 1 260 135 39 29 1
310 122 30 21 2 310  60 35 18 2 190  40 27 15 2 225  65 34 16 2
170  65 37 16 2 210  82 31 17 2 280  67 37 18 2 210  38 36 17 2
280  65 30 23 2 200  76 40 17 2 200  76 39 20 2 280  94 26 11 2
190  60 33 17 2 295  55 30 16 2 270 125 24 21 2 280 120 32 18 2
240  62 32 20 2 280  69 29 20 2 370  70 30 20 2 280  40 37 17 2
320  64 39 17 3 260  59 37 11 3 360  88 28 26 3 295 100 36 12 3
270  65 32 21 3 380 114 36 21 3 240  55 42 10 3 260  55 34 20 3
260 110 29 20 3 295  73 33 21 3 240 114 38 18 3 310 103 32 18 3
330 112 21 11 3 345 127 24 20 3 250  62 22 16 3 260  59 21 19 3
225 100 34 30 3 345 120 36 18 3 360 107 25 23 3 250 117 36 16 3
;
run;
proc sort data=d332;
  by group;

proc corr data=d332 outp=a332 csscp ;
  by group;
  var x1-x4;

proc corr data=d332 outp=a332t csscp;
  var x1-x4;
run;

data aa332;
  set a332;
  if _type_='CSSCP';
run;

data at332;
  set a332t;
  group=0;
  if _type_='CSSCP';
run;

data ta332;
  set aa332 at332;
run;

proc print data=ta332;
run;

  proc iml;
   n1=20;n2=20;n3=20;
   n=n1+n2+n3;k=3; p=4;
   use ta332(obs=4);
   xx={x1 x2 x3 x4};
   read all  var xx into a1; print a1;
   use ta332(firstobs=5 obs=8);
   read all  var xx into a2; print a2;
   use ta332(firstobs=9 obs=12);
   read all  var xx into a3; print a3;
   use ta332(firstobs=13 obs=16);
   read all  var xx into tt; print tt;
   a=a1+a2+a3;
   print a;
   da=det(a);
   dt=det(tt); a0=da/dt;
   print da dt a0;
   b=sqrt(a0);
   f=(n-k-p+1)*(1-b)/(b*p);
   df1=2*p;df2=2*(n-k-p+1);
   p0=1-probf(f,df1,df2);
   print f p0;
   f1=(tt[1,1]-a[1,1])*(n-k)/((k-1)*a[1,1]);
   p1=1-probf(f1,k-1,n-k);
   fa1=finv(0.99,k-1,n-k); fa5=finv(0.95,k-1,n-k);
   print fa1 fa5 f1 p1;
quit;
