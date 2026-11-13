function [CorrcoefV,...
                CStruct]    =   CacCorrcoefV(Data)
% Correlation coefficients between other distance-based
% zones and the first distance-based zones

%% 
    CorrcoefV               =   zeros(length(Data(1,:))-1,1);
    CStruct                 =   repmat(struct('DataR',[]),[length(Data(1,:))-1,1]);
    IndexV                  =   (1:1:length(Data(:,1)))';
    k                       =   1;
    for sl=2:1:length(Data(1,:))
        log                 =   ~isnan(Data(:,sl));

        CStruct(k).DataR    =   Data(log,1);
        CStruct(k).DataC    =   Data(log,sl);
        CStruct(k).IndexV   =   IndexV(log);

        k                   =   k+1;
        V                   =   corrcoef(Data(log,1),Data(log,sl));
        CorrcoefV(sl-1)     =   V(1,2);
    end

end