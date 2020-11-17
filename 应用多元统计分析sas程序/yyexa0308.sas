
title '  "应用多元统计分析"习题三(p103):3-8 ';
/*----yyexa0308.sas  */



  proc iml;
   n1=6;n2=9; p=3;
   x={
      78 60.6 16.5 ,
      76 58.1 12.5 ,
      92 63.2 14.5 ,
      81 59.0 14.0 ,
      81 60.8 15.5 ,
      84 59.5 14.0 };

   c={1 0 -6,0 1 -4};
   lx={[6] 1} ;
   x0=(lx*x)/n1; print x0;
   xm=c*x0`;  print xm;
   mmx=i(6)-j(6,6,1)/n1;
   ax=x`*mmx*x; print ax;
   ac=c*ax*c`; aci=inv(ac);
   print ac aci;
   dd=xm`*aci*xm; d2=(n1-1)*dd;
   t2=n1*d2;
   f=(n1-p+1)*t2/((n1-1)*(p-1));
   print  d2 t2 f;
   p0=1-probf(f,p-1,n1-p+1);
   print p0;
run;
quit;
