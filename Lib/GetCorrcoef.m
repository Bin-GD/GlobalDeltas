function [CorV]=GetCorrcoef(MartixA,MartixB)
   
        CorV    =   zeros(length(MartixA(1,:)),1);
        for sl  =   1:1:length(MartixA(1,:))
        
           VectorA  =   MartixA(:,sl);
           VectorB  =   MartixB(:,sl);

           MV           =   corrcoef([VectorA,VectorB]);
           CorV(sl)     =   MV(1,2); 

        
        end

end