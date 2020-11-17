
title '  "应用多元统计分析" 习题九(p341): 9-2 ';
/*----yyexa0902.sas  */



title;
goptions  ftext="宋体";
data data902;
  input group $ x1-x6;
  n=_n_;
  cards;
A北京   190.33  43.77   9.73  60.54  49.01  9.04
B天津   135.20  36.40  10.47  44.16  36.49  3.94
C河北    95.21  22.83   9.30  22.44  22.81  2.80
D山西   104.78  25.11   6.40   9.89  18.17  3.25
E内蒙   128.41  27.63   8.94  12.58  23.99  3.27
F辽宁   145.68  32.83  17.79  27.29  39.09  3.47
G吉林   159.37  33.38  18.37  11.81  25.29  5.22
H黑龙江 116.22  29.57  13.24  13.76  21.75  6.04
I上海   221.11  38.64  12.53 115.65  50.82  5.89
J江苏   144.98  29.12  11.67  42.60  27.30  5.74
K浙江   169.92  32.75  12.72  47.12  34.35  5.00
L安徽   153.11  23.09  15.62  23.54  18.18  6.39
M福建   144.92  21.26  16.96  19.52  21.75  6.73
N江西   140.54  21.50  17.64  19.19  15.97  4.94
O山东   115.84  30.26  12.20  33.61  33.77  3.85
P河南   101.18  23.26   8.46  20.20  20.50  4.30
;
proc print data=data902;
run;
* 9-2(1);
proc  corresp  data=data902    out=out902   observed
                       rp   short;
    var x1-x6;
    id  group;
run;

proc print data=out902;
run;
options ps=35 ls=90;
data out902;
    set out902;
    if  _type_='VAR' then group=substr(group,2,2);
run;
proc plot data=out902;
   plot dim1*dim2=group /box  href=0 vref=0 ;
run;

* 9-2(2);
proc factor data=data902 method=prin rotate=promax p=0.8
          n=4  score out=o902 ;
  var x1-x6;
run;

proc plot data=o902;
  plot factor2*factor2 $ n='+';
run;

* 9-2(3);
proc cluster data=data902 method=ave std  pseudo 
             outtree=b902;
   var x1-x6;
   id group;
proc tree data=b902  horizontal graphics ;
  title  '使用类平均法的谱系聚类图';
run;
title;
quit;