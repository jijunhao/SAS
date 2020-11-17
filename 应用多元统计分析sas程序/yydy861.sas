
title ' "应用多元统计分析"  p319-P321:例8.6.1';
/*----yydy861.sas  */



 data d831;
   input x1-x7;
   cards;
 11.835    0.480    14.360    25.210     25.21    0.810    0.98
 45.596    0.526    13.850    24.040     26.01    0.910    0.96
  3.525    0.086    24.400    49.300     11.30    6.820    0.85
  3.681    0.370    13.570    25.120     26.00    0.820    1.01
 48.287    0.386    14.500    25.900     23.32    2.180    0.93
 17.956    0.280     9.750    17.050     37.20    0.464    0.98
  7.370    0.506    13.600    34.280     10.69    8.800    0.56
  4.223    0.340     3.800     7.100     88.20    1.110    0.97
  6.442    0.190     4.700     9.100     73.20    0.740    1.03
 16.234    0.390     3.100     5.400    121.50    0.420    1.00
 10.585    0.420     2.400     4.700    135.60    0.870    0.98
 23.535    0.230     2.600     4.600    141.80    0.310    1.02
  5.398    0.120     2.800     6.200    111.20    1.140    1.07
283.149    0.148     1.763     2.968    215.86    0.140    0.98
316.604    0.317     1.453     2.432    263.41    0.249    0.98
307.310    0.173     1.627     2.729    235.70    0.214    0.99
322.515    0.312     1.382     2.320    282.21    0.024    1.00
254.580    0.297     0.899     1.476    410.30    0.239    0.93
304.092    0.283     0.789     1.357    438.36    0.193    1.01
202.446    0.042     0.741     1.266    309.77    0.290    0.99
;

data d861(type=corr);
  array q(20) q1-q20;
  array x(7) x1-x7 ;
  array xi(7) xi1-xi7;
  array xj(7) xj1-xj7;
  _type_='corr' ;

  do row=1 to 20;
     set d831 point=row;
     do i=1 to 7;
        xi(i)=x(i);
     end;
     do col=1 to row;
       set d831 point=col;
       do j=1 to 7;
         xj(j)=x(j);
       end;
       qij=0;qi2=0;qj2=0;
       do k=1 to 7;
         qij=qij+xi(k)*xj(k);
         qi2=qi2+xi(k)*xi(k);
         qj2=qj2+xj(k)*xj(k);
       end;
       q(col)=qij/sqrt(qi2*qj2);
     end;
     output;
   end;
   stop;
   keep _type_ q1-q20;
run;

proc print data=d861;
run;

options ps=60;
proc factor data=d861(type=corr)
               rotate=varimax  n=3;
  var q1-q20;
run;
quit;
