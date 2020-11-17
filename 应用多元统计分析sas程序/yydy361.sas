
title ' "应用多元统计分析"   p99 : 例3.6.1 ';
/* ---- yydy341b.sas ---- */



data d361(keep=x4 x5);
  input num x1-x5;
  cards;
1 99 94 93 100 100
2 99 88 96  99  97
3 100 98 81 96 100
4 93 88 88  99  96
5 100 91 72 96  78
6 90 78 82  75  97
7 75 73 88  97  89
8 93 84 83  68  88
9 87 73 60  76  84
10 95 82 90 62  39
11 76 72 43 67  78
12 85 75 50 34  37
;

 proc iml;
   n=12;p=2;
   use d361;
   xx={x4 x5};
   read all  var xx into x; print x;
   ln={[12] 1} ;
   x0=(ln*x)/n; print x0;
   mm=i(n)-j(n,n,1)/n;
   a=x`*mm*x; print a;
   s=a/(n-1);
   si=inv(s); print s si;
   m=0;
   do i=1 to n;
     xx0=x[i,]-x0;
     dd=xx0*si*xx0`;
     print i dd;
     if dd<=1.386  then m=m+1;
  end;
  pp=m/n; print m pp;
 quit;
