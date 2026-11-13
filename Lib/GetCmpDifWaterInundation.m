function [MedianTable,...
            More2PerTable,...
            More4PerTable]  =   GetCmpDifWaterInundation(DeltaContentsInfo,...
                                                            Normal_T_All_LowPerL,....
                                                            Extreme_T_All_LowPerL)
% Statistical results of comparison between different water inundation
% fraction


%% ========================================================================
    d_T_All_LowPerL         =   Extreme_T_All_LowPerL-Normal_T_All_LowPerL;
    
    Overall_d_LowPerL       =   zeros(length(d_T_All_LowPerL(:,1)),1);
    Normal_Overall_LowPerL  =   zeros(length(d_T_All_LowPerL(:,1)),1);
    Extreme_Overall_LowPerL =   zeros(length(d_T_All_LowPerL(:,1)),1);
    
    Cidx                    =   1:1:length(Normal_T_All_LowPerL(1,:));
    for sl=1:1:length(d_T_All_LowPerL(:,1))
        
        log                             =   ~isnan(d_T_All_LowPerL(sl,:));    
        fCidx                           =   Cidx(log);
        Overall_d_LowPerL(sl)           =   d_T_All_LowPerL(sl,fCidx(end));
    
        Normal_Overall_LowPerL(sl)      =   Normal_T_All_LowPerL(sl,fCidx(end));
        Extreme_Overall_LowPerL(sl)     =   Extreme_T_All_LowPerL(sl,fCidx(end));
    
    end
    
    First_d_LowPerL             =   d_T_All_LowPerL(:,1);
    
    Normal_First_LowPerL        =   Normal_T_All_LowPerL(:,1);
    Extreme_First_LowPerL       =   Extreme_T_All_LowPerL(:,1);
    
    %% 
    Ratio_Fist_LowPerL          =   Extreme_First_LowPerL./Normal_First_LowPerL;
    Ratio_Overall_LowPerL       =   Extreme_Overall_LowPerL./Normal_Overall_LowPerL;
    
    % ----------------------------------
    More2_Fist_DeltaCInfo           =   DeltaContentsInfo(Ratio_Fist_LowPerL>=2);
    
    More2_Overall_DeltaCInfo        =   DeltaContentsInfo(Ratio_Overall_LowPerL>=2);
    
    % ----------------------------------
    More4_Fist_DeltaCInfo           =   DeltaContentsInfo(Ratio_Fist_LowPerL>=4);
    
    More4_Overall_DeltaCInfo        =   DeltaContentsInfo(Ratio_Overall_LowPerL>=4);
    
    % -------------------------------------------------------------------------
    
    UCell                   =   unique(DeltaContentsInfo);
    FirstMedian             =   zeros(length(UCell),1);
    OverallMedian           =   zeros(length(UCell),1);
    
    FistMore2Per            =   zeros(length(UCell),1);
    OverallMore2Per         =   zeros(length(UCell),1);
    
    FistMore4Per            =   zeros(length(UCell),1);
    OverallMore4Per         =   zeros(length(UCell),1);
    
    for sl=1:1:length(UCell)
        log                 =   strcmp(DeltaContentsInfo,UCell{sl});    
        FirstMedian(sl)     =   median(First_d_LowPerL(log));
        OverallMedian(sl)   =   median(Overall_d_LowPerL(log));
    
        logS                =   strcmp(More2_Fist_DeltaCInfo,UCell{sl});
        FistMore2Per(sl)    =   length(More2_Fist_DeltaCInfo(logS))./...
                                            length(log(log));
    
        logS                =   strcmp(More4_Fist_DeltaCInfo,UCell{sl});
        FistMore4Per(sl)    =   length(More4_Fist_DeltaCInfo(logS))./...
                                            length(log(log));
    
        logS                =   strcmp(More2_Overall_DeltaCInfo,UCell{sl});
        OverallMore2Per(sl) =   length(More2_Overall_DeltaCInfo(logS))./...
                                            length(log(log));
        
        logS                =   strcmp(More4_Overall_DeltaCInfo,UCell{sl});
        OverallMore4Per(sl) =   length(More4_Overall_DeltaCInfo(logS))./...
                                            length(log(log));
    
    end
    
    MedianTable             =   table(UCell,FirstMedian,OverallMedian);
    
    More2PerTable           =   table(UCell,FistMore2Per,OverallMore2Per);
    More4PerTable           =   table(UCell,FistMore4Per,OverallMore4Per);

end