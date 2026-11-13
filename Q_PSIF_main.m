%% ========================================================================
% Quantification of potential seawater inundation fraction in deltas
%% ========================================================================
clear;
clc;
addpath Lib\
addpath AddLib\
load('Data\DeltaAreaRisk.mat');

Extreme_T_All_LowPerL   =   table2array( DeltaAreaRisk(1).T_All_LowPerL(:,2:end) );
Normal_T_All_LowPerL    =   table2array( DeltaAreaRisk(2).T_All_LowPerL(:,2:end) );

DeltaName               =   table2array( DeltaAreaRisk(2).T_All_LowPerL(:,1) );

DeltaContentsInfo       =   table2array( DeltaAreaRisk(1).ClassDelta(:,end) );


%% ========================================================================
% Hist results of the first distance-based zones

Avector                 =   [0.05:0.05:0.35];
Normal_DSStruct         =   GetDataStatistics(Normal_T_All_LowPerL(:,1),Avector);
Normal_PerTable         =   GetPer([Normal_DSStruct(:).Num],{Normal_DSStruct(:).Label});

Avector                 =   [0.1:0.1:0.8];
Extreme_DSStruct        =   GetDataStatistics(Extreme_T_All_LowPerL(:,1),Avector);
Extreme_PerTabel        =   GetPer([Extreme_DSStruct(:).Num],{Extreme_DSStruct(:).Label});

%% ========================================================================
% Correlation coefficients between other distance-based
% zones and the first distance-based zones

[Normal_CorrcoefV,...
    Normal_CStruct]     =   CacCorrcoefV(Normal_T_All_LowPerL);

[Extreme_CorrcoefV,...
    Extreme_CStruct]    =   CacCorrcoefV(Extreme_T_All_LowPerL);

%% ========================================================================
% Statistical results of comparison between different water inundation
% fraction

[MedianTable,...
            More2PerTable,...
            More4PerTable]  =   GetCmpDifWaterInundation(DeltaContentsInfo,...
                                                            Normal_T_All_LowPerL,....
                                                            Extreme_T_All_LowPerL);



% ====================Disp+++++++++++++++++++++++++++++++++++++++++++++++++

disp(Normal_PerTable)
disp(Extreme_PerTabel)

disp(Normal_CorrcoefV)
disp(Extreme_CorrcoefV)

disp(MedianTable)
disp(More2PerTable)
disp(More4PerTable)
