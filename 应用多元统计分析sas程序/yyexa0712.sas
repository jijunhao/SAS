
title '  "应用多元统计分析" 习题七(p292): 7-12 ';
/*----yyexa0712.sas  */


title;
goptions  ftext="宋体";
data d641;
  input group $ x1-x6;
  cards;
北京   190.33  43.77   9.73  60.54  49.01  9.04
天津   135.20  36.40  10.47  44.16  36.49  3.94
河北    95.21  22.83   9.30  22.44  22.81  2.80
山西   104.78  25.11   6.40   9.89  18.17  3.25
内蒙   128.41  27.63   8.94  12.58  23.99  3.27
辽宁   145.68  32.83  17.79  27.29  39.09  3.47
吉林   159.37  33.38  18.37  11.81  25.29  5.22
黑龙江 116.22  29.57  13.24  13.76  21.75  6.04
上海   221.11  38.64  12.53 115.65  50.82  5.89
江苏   144.98  29.12  11.67  42.60  27.30  5.74
浙江   169.92  32.75  12.72  47.12  34.35  5.00
安徽   153.11  23.09  15.62  23.54  18.18  6.39
福建   144.92  21.26  16.96  19.52  21.75  6.73
江西   140.54  21.50  17.64  19.19  15.97  4.94
山东   115.84  30.26  12.20  33.61  33.77  3.85
河南   101.18  23.26   8.46  20.20  20.50  4.30
;
proc print data=d641;
run;

 proc princomp data=d641 n=2 out=o712;
   var x1-x6;
 run;

 proc sort data=o712;
    by prin1;
 run;
 proc print data=o712;
   var  prin1 prin2 x1-x6;
 run;


 proc cluster data=o712 method=ave outtree=b712;
   var prin1 prin2;
   id group;
 run;
 proc tree data=b712 horizontal graphics;
   title  '使用类平均法的谱系聚类图(由主成分得分)';
 run;

 proc cluster data=d641 method=ave outtree=c712;
   var x1-x6;
   id group;
 run;
 proc tree data=c712 horizontal graphics;
   title  '使用类平均法的谱系聚类图(由原始数据)';
 run;
quit;
