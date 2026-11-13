function AnalysiPopRelativeArea(OpenPath,...
                                    Normal_Avector,....
                                    Extreme_Avector)

    load(OpenPath);
    
    Normal_Pop_Area         =   table2array( PopulationPerT(:,[5,7]) );
    Extreme_Pop_Area        =   table2array( PopulationPerT(:,[6,8]) );
    [Normal_R2,~]           =   GetFit(Normal_Pop_Area(:,1),Normal_Pop_Area(:,2));
    [Extreme_R2,~]          =   GetFit(Extreme_Pop_Area(:,1),Extreme_Pop_Area(:,2));
    
    Normal_Dif_PopArea      =   Normal_Pop_Area(:,1)-Normal_Pop_Area(:,2);
    Extreme_Dif_PopArea     =   Extreme_Pop_Area(:,1)-Extreme_Pop_Area(:,2);
    
    % Normal_Avector          =   [-10:5:10]./100;
    Normal_DSStruct         =   GetDataStatisticsS(Normal_Dif_PopArea,Normal_Avector);
    Normal_Num              =   [Normal_DSStruct(:).Num];
    Normal_PerTable         =   GetPer([Normal_DSStruct(:).Num],...
                                            {Normal_DSStruct(:).Label});
    Normal_Per              =   table2array( Normal_PerTable(:,2) );
    
    
    % Extreme_Avector         =   [-20:10:20]./100;
    Extreme_DSStruct        =   GetDataStatisticsS(Extreme_Dif_PopArea,Extreme_Avector);
    Extreme_Num             =   [Extreme_DSStruct(:).Num];
    Extreme_PerTable        =   GetPer([Extreme_DSStruct(:).Num],...
                                            {Extreme_DSStruct(:).Label});
    Extreme_Per             =   table2array( Extreme_PerTable(:,2) );
    
    % -------------------------------------
    
    
    
    %% =================================disp+++++++++++++++++++++++++++++++++++
    
    disp(['Normal R2:',num2str(Normal_R2)]);
    disp(['Extreme R2:',num2str(Extreme_R2)]);
    disp(['Normal <0:', 32,num2str(sum(Normal_Num(1:3))),32,num2str(sum(Normal_Per(1:3))),'%']);
    disp(['Extreme <0:',32,num2str(sum(Extreme_Num(1:3))),32,num2str(sum(Extreme_Per(1:3))),'%']);

end