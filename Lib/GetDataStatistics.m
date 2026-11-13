function DSStruct=GetDataStatistics(DataV,Avector)
% HistAnalysisResults

%% ========================================================================
    DSStruct        =   repmat(struct('Num',[]),[length(Avector)+1,1]);
    for sl=1:1:length(Avector)+1

        if sl==1
           log                  =   DataV<=Avector(sl);
           DSStruct(sl).Label   =   ['<=',num2str(Avector(sl))]; 
           DSStruct(sl).Num     =   length(log(log));
        elseif sl==length(Avector)+1
           log                  =   DataV>Avector(sl-1);
           DSStruct(sl).Label   =   ['>',num2str(Avector(sl-1))]; 
           DSStruct(sl).Num     =   length(log(log));

        else
           log                  =   DataV>Avector(sl-1) & DataV<=Avector(sl) ;
           DSStruct(sl).Label   =   ['(',num2str(Avector(sl-1)),',',num2str(Avector(sl)),']']; 
           DSStruct(sl).Num     =   length(log(log));

        end

    end

end