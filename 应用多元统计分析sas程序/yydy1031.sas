
title ' "应用多元统计分析"  p362-P365:例10.3.1';
/*----yydy1031.sas  */



title '康复俱乐部数据的典型相关分析';
data d1031;
   input weight waist pulse chins situps jumps @@;
   label  weight='体重'      waist='腰围'
          pulse='脉博'       chins='单杠'
          situps='仰卧起坐'  jumps='跳高';
   cards;
191 36 50  5 162  60  189 37 52  2 110  60
193 38 58 12 101 101  162 35 62 12 105  37
189 35 46 13 155  58  182 36 56  4 101  42
211 38 56  8 101  38  167 34 60  6 125  40
176 31 74 15 200  40  154 33 56 17 251 250
169 34 50 17 120  38  166 33 52 13 210 115
154 34 64 14 215 105  247 46 50  1  50  50
193 36 46  6  70  31  202 37 62 12 210 120
176 37 54  4  60  25  157 32 52 11 230  80
156 33 54 15 225  73  138 33 68  2 110  43
;
run;
proc cancorr data=d1031 all vprefix=PHYS wprefix=EXER
               vname='生理指标'   wname='训练指标';
     var weight waist pulse;
     with chins situps jumps;
run;
quit;