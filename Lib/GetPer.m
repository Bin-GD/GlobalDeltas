function PerTable=GetPer(NumV,LabelV)

    PerStruct.NumV      =   NumV./sum(NumV)*100;
    PerStruct.LabelV    =   LabelV;
    PerTable            =   table(PerStruct.LabelV',PerStruct.NumV');

end