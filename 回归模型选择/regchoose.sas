proc reg data=WORK.REG1;
    title 'full model';
    reg_full: model y=x1-x3
                    /selection=rsquare adjrsq cp;
    /*选择adjrsq高的模型 且cp<=p的模型，根据需求多选几组*/
    title 'step model';
    forward:   model y=x1-x3
                    /selection=forward;
    backward:  model y=x1-x3
                    /selection=backward;
    stepwise:  model y=x1-x3
                    /selection=stepwise;
run;
