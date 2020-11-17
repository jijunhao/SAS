
title '  "应用多元统计分析"习题三(p104):3-12 ';
/*----yyexa0312.sas  */


 proc iml;
   n1=5;n2=4; n3=4;
   p=3; k=3;
   n=n1+n2+n3;
   xa={ 47.22 5.06 0.10 ,
        47.45 4.35 0.15 ,
        47.52 6.85 0.12 ,
        47.86 4.19 0.17 ,
        47.31 7.57 0.18 };
   xb={ 54.33 6.22 0.12 ,
        56.17 3.31 0.15 ,
        54.40 2.43 0.22 ,
        52.62 5.92 0.12 };
   xc={ 43.12 10.33 0.05 ,
        42.05  9.67 0.08 ,
        42.50  9.62 0.02 ,
        40.77  9.68 0.04 };
   xx=xa//xb//xc;
   ln1={[5] 1} ; ln2={[4] 1};
   lnn= {[13] 1};
   xa0=(ln1*xa)/n1; print xa0;
   xb0=(ln2*xb)/n2; print xb0;
   xc0=(ln2*xc)/n3; print xc0;
   xx0=(lnn*xx)/n; print xx0;
   mm1=i(n1)-j(n1,n1,1)/n1;
   mm2=i(n2)-j(n2,n2,1)/n2;
   mm=i(n)-j(n,n,1)/n;
   a1=xa`*mm1*xa; print a1;
   a2=xb`*mm2*xb; print a2;
   a3=xc`*mm2*xc; print a3;
   tt=xx`*mm*xx;  print tt;
   a=a1+a2+a3;   print a;

/* 3-12(1)   */
   sa=det(a/(n-k));
   sa1=det(a1/(n1-1));
   sa2=det(a2/(n2-1));
   sa3=det(a3/(n3-1));
   m=(n-k)*log(sa)-(n1-1)*log(sa1)-(n2-1)*log(sa2)-(n3-1)*log(sa3);
   dd=(2*p*p+3*p-1)*(1/(n1-1)+1/(n2-1)+1/(n3-1)-1/(n-k))/(6*(p+1)*(k-1));
   df=p*(p+1)*(k-1)/2;
   kc=(1-dd)*m;
   print sa sa1 sa2 sa3;
   print m dd df ;
   p1=1-probchi(kc,df);
   print kc p1;

/* 3-12(2)  */
   aa=a1+a2; xy=xa0-xb0;
   aai=inv(aa); print aa aai;
   dd=xy*aai*xy`; d2=(n1+n2-2)*dd;
   t2=n1*n2*d2/(n1+n2) ;
   f2=(n1+n2-1-p)*t2/((n1+n2-2)*p);
   print  d2 t2 f2;
   p2=1-probf(f2,p,n1+n2-p-1);
   print p2;


/* 3-12(3) */
   da=det(a);
   dt=det(tt); a0=da/dt;
   print da dt a0;
   b=sqrt(a0);
   f3=(n-k-p+1)*(1-b)/(b*p);
   df1=2*p;  df2=2*(n-k-p+1);
   print df1 df2;
   p3=1-probf(f3,df1,df2);
   print f3 p3;

/*  3-12(4)  */
   a0=det(a); print a0;
   a1=a[1,1]*a[2,2]*a[3,3];
   v=a0/a1; print v;
   b=n-1.5-(p*p*p-3)/(3*p*p-3*3);
   df=0.5*(p*(p+1)-2*3);
   kc=-b*log(v);
   print b df kc;
   p4=1-probchi(kc,df);
   print p4;
 run;
 quit;
