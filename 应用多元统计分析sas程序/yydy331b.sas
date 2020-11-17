
title ' "应用多元统计分析"  p77-p79:例3.3.1 ---- 解法二 ';
/*----yydy331b.sas  */

 proc iml;
   n=10;m=10; p=4;
   x={ 65     35     25     60 ,
       75     50     20     55 ,
       60     45     35     65 ,
       75     40     40     70 ,
       70     30     30     50 ,
       55     40     35     65 ,
       60     45     30     60 ,
       65     40     25     60 ,
       60     50     30     70 ,
       55     55     35     75 } ;
   print x;
   ln={[10] 1} ;
   x0=(ln*x)/n; print x0;
   mx=i(n)-j(n,n,1)/n;
   a1=x`*mx*x; print a1;
   y={ 55     55     40     65 ,
       50     60     45     70 ,
       45     45     35     75 ,
       50     50     50     70 ,
       55     50     30     75 ,
       60     40     45     60 ,
       65     55     45     75 ,
       50     60     35     80 ,
       40     45     30     65 ,
       45     50     45     70 } ;
   print y;
   lm={[10] 1} ;
   y0=(lm*y)/m; print y0;
   my=i(m)-j(m,m,1)/m;
   a2=y`*my*y; print a2;
   a=a1+a2; xy=x0-y0;
   ai=inv(a); print a ai;
   dd=xy*ai*xy`; d2=(m+n-2)*dd;
   t2=n*m*d2/(n+m) ;
   f=(n+m-1-p)*t2/((n+m-2)*p);
   print  d2 t2 f;
   pp=1-probf(f,p,m+n-p-1);
   print pp;
 quit;
