
title '  "应用多元统计分析" 习题十(p366): 10-4 ';
/*----yyexa1004.sas  */


data data1004;
   input x1-x4;
   cards;
191    155    179    145
195    149    201    152
181    148    185    149
183    153    188    149
176    144    171    142
208    157    192    152
189    150    190    149
197    159    189    152
188    152    197    159
192    150    187    151
179    158    186    148
183    147    174    147
174    150    185    152
190    159    195    157
188    151    187    158
163    137    161    130
195    155    183    158
186    153    173    148
181    145    182    146
175    140    165    137
192    154    185    152
174    143    178    147
176    139    176    143
197    167    200    158
190    163    187    150
;
proc print data=data1004;
run;

proc cancorr data=data1004;
  var x1 x2;
  with x3 x4;
run;
quit;