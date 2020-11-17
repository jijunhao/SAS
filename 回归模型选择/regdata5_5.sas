PROC IMPORT OUT= WORK.REG2 
            DATAFILE= "D:\SAS\回归模型选择\5.5.xlsx" 
            DBMS=EXCEL REPLACE;
     RANGE="Sheet1$"; 
     GETNAMES=YES;
     MIXED=NO;
     SCANTEXT=YES;
     USEDATE=YES;
     SCANTIME=YES;
RUN;
