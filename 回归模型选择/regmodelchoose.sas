proc reg data=WORK.REG1;
    title 'full model';
    reg_full: model y=x1-x3
                    /selection=rsquare adjrsq cp;
    /*ѡ��adjrsq�ߵ�ģ�� ��cp<=p��ģ�ͣ����������ѡ����*/
    title 'step model';
    forward:   model y=x1-x3
                    /selection=forward;
    backward:  model y=x1-x3
                    /selection=backward;
    stepwise:  model y=x1-x3
                    /selection=stepwise;
run;
