PROC IMPORT OUT= WORK.REG2 
            DATAFILE= "D:\SAS\�ع�ģ��ѡ��\5.5.xlsx" 
            DBMS=EXCEL REPLACE;
     RANGE="Sheet1$"; 
     GETNAMES=YES;
     MIXED=NO;
     SCANTEXT=YES;
     USEDATE=YES;
     SCANTIME=YES;
RUN;
