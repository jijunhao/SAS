
title ' "Ӧ�ö�Ԫͳ�Ʒ���"  p255:��6.6.1';
/*----yydy661.sas  */



data d661;
  input age weight @@;
  cards;
1 9.3 2 1.8 3 1.9  4 1.7  5 1.5  6 1.3
7 1.4 8 2.0 9 1.9 10 2.3 11 2.1
;
title;
goptions  ftext="����";
proc gplot data=d661;
  plot weight*age / vaxis=axis1 haxis=axis2;
  symbol1 v=.  h=3  i=join l=1 font=swissb;
  axis1 label=('����/kg')  order=(0 to 10 by 2);
  axis2 label=('����/��')  order=(0 to 11 by 1);
  title  '�к�ÿ�����ص�����������ı仯';
run;
quit;