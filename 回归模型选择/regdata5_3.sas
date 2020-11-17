PROC IMPORT OUT= WORK.REG1 
            DATAFILE= "D:\SAS\回归模型选择\5.3.xlsx" 
            DBMS=EXCEL REPLACE;
     RANGE="Sheet1$"; 
     GETNAMES=YES;
     MIXED=NO;
     SCANTEXT=YES;
     USEDATE=YES;
     SCANTIME=YES;
RUN;
