
title '  "应用多元统计分析" 习题九(p341): 9-1 ';
/*----yyexa0901.sas  */


data data901;
  input a b c d e f;
  n=_n_;
  cards;
0.056    0.084    0.031    0.038    0.0081    0.0220
0.049    0.055    0.100    0.110    0.0220    0.0073
0.038    0.130    0.079    0.170    0.0580    0.0430
0.034    0.095    0.058    0.160    0.2000    0.0290
0.084    0.066    0.029    0.320    0.0120    0.0410
0.064    0.072    0.100    0.210    0.0280    1.3800
0.048    0.089    0.062    0.260    0.0380    0.0360
0.069    0.087    0.027    0.050    0.0890    0.0210
;
* 9-1(1);
proc  corresp  data=data901    out=out901   observed
                       rp   short;
    var a b c d e f;
    id  n;
run;

proc print data=out901;
run;
options ps=35 ls=80;

proc plot data=out901;
   plot dim1*dim2=n /box  href=0 vref=0 ;
run;

* 9-1(2);
proc factor data=data901 method=prin rotate=promax p=0.8
          n=4  score out=o901 ;
  var a b c d e f;
run;

proc plot data=o901;
  plot factor2*factor2 $ n='+';
run;

* 9-1(3);
data d91(type=corr);
  array q(8) q1-q8;
  array x(6) a b c d e f ;
  array xi(6) xi1-xi6;
  array xj(6) xj1-xj6;
  _type_='corr' ;

  do row=1 to 8;
     set data901 point=row;
     do i=1 to 6;
        xi(i)=x(i);
     end;
     do col=1 to row;
       set data901 point=col;
       do j=1 to 6;
         xj(j)=x(j);
       end;
       qij=0;qi2=0;qj2=0;
       do k=1 to 6;
         qij=qij+xi(k)*xj(k);
         qi2=qi2+xi(k)*xi(k);
         qj2=qj2+xj(k)*xj(k);
       end;
       q(col)=qij/sqrt(qi2*qj2);
     end;
     output;
   end;
   stop;
   keep _type_ q1-q8;
run;

proc print data=d91;
run;

options ps=60;
proc factor data=d91(type=corr)
               rotate=varimax  n=3;
  var q1-q8;
run;
quit;


