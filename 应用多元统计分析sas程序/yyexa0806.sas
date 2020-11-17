
title '  "应用多元统计分析" 习题八(p322): 8-6 ';
/*----yyexa0806.sas  */



data data806;
  input x1-x6;
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

proc factor data=data806 method=prin rotate=promax p=0.8
          n=4  score out=o86 ;
  var x1-x6;
run;
options ls=80 ps=35;
proc plot data=o86;
  plot factor2*factor2 $ n='+';
run;


proc princomp data=data806  out=out86;
  var x1-x6;
run;
proc sort data=out86;
  by prin1;
run;
proc print data=out86;
  id n prin1 prin2 x1-x6;
run;

options ps=35 ls=80;
proc plot data=out86;
  plot prin2*prin1 $ n='*';
run;
quit;
