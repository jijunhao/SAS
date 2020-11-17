
title ' "应用多元统计分析"  p335-P339:例9.3.1';
/*----yydy931.sas  */


data  d931;
    input science $12.  y1973-y1978;
    label  y1973='1973' y1974='1974'
           y1975='1975' y1976='1976'
           y1977='1977' y1978='1978';
   cards;
L(生命科学)   4489  4303  4402  4350  4266  4361
P(物理学)     4101  3800  3749  3572  3410  3234
S(社会学)     3354  3286  3344  3278  3137  3008
B(行为科学)   2444  2587  2749  2878  2960  3049
E(工程学)   3338  3144  2959  2791  2641  2432
M(数学)       1222  1196  1149  1003   959   959
;
proc  corresp  data=d931    out=results   observed
                       rp   short;
    var y1973-y1978;
    id science;
run;

data results;
    set results;
          /* SAS函数SUBSTR取年数的最后一位作为年图  */
   if  _type_='VAR' then science=substr(science,4,1);
run;
options ps=40 ls=90;
proc plot data=results;
   plot dim1*dim2=science /box  vspace=15  hspace=27 href=0 vref=0
            haxis=-.15 to .15 by .15 vaxis=-.15 to .15 by .15;
run;
quit;
