%% ========================================================================
% Comparison of seawater inundation sensitivity between deltaic nearshore and inland areas
%% ========================================================================
clear;
clc;
addpath Lib\
addpath AddLib\
load('Data\DeltaAreaRisk.mat');
DeltaContentsInfo       =   table2array( DeltaAreaRisk(1).ClassDelta(:,end) );

load('Data\Nearshore_Or_Inland_inundationT.mat');



Normal_RSubmergenceR                =   table2array (Nearshore_Or_Inland_inundationT(:,8));
Extreme_RSubmergenceR               =   table2array (Nearshore_Or_Inland_inundationT(:,9));
DeltaC                              =   table2array (Nearshore_Or_Inland_inundationT(:,4));

ClassV                              =   table2array (Nearshore_Or_Inland_inundationT(:,5));

Normal_RSubmergenceCmpMedian_log    =   table2array (Nearshore_Or_Inland_inundationT(:,6));
Extreme_RSubmergenceCmpMedian_log   =   table2array (Nearshore_Or_Inland_inundationT(:,7));
%% ========================================================================
NoNaN_log               =   DeltaC>=2;

Normal_Nearshore_log    =   Normal_RSubmergenceR(:,1)>Normal_RSubmergenceR(:,2) & NoNaN_log;
Extreme_Nearshore_log   =   Extreme_RSubmergenceR(:,1)>Extreme_RSubmergenceR(:,2) & NoNaN_log;

NearshoreNumTable       =   table(length(Normal_Nearshore_log(Normal_Nearshore_log)),...
                                    length(Extreme_Nearshore_log(Extreme_Nearshore_log)),...
                                    length(Normal_Nearshore_log(~Normal_Nearshore_log & NoNaN_log)),...
                                    length(Extreme_Nearshore_log(~Extreme_Nearshore_log  & NoNaN_log)),...
                                    'VariableNames',{'Norma nearshore num','Extreme nearshore num',...
                                                    'Normal inland num','Extreme inland num'});

%% ========================================================================

BothMore2_log           =   Normal_RSubmergenceR(:,1)./Normal_RSubmergenceR(:,2)>2 & ....
                                Extreme_RSubmergenceR(:,1)./Extreme_RSubmergenceR(:,2)>2;



%% ========================================================================

Avector                 =   [-0.2,-0.1,0,0.1,0.2];
Change_DSStruct         =   GetDataStatisticsS(Extreme_RSubmergenceR(:,1)./Extreme_RSubmergenceR(:,2)-...
                                                Normal_RSubmergenceR(:,1)./Normal_RSubmergenceR(:,2),....
                                                Avector);

PerTable                =   GetPer([Change_DSStruct(:).Num],{Change_DSStruct(:).Label});

TPer                    =   table2array(PerTable(:,2));


%% ========================================================================
L                       =   length(NoNaN_log(NoNaN_log));

C1_log                  =   ClassV==1;
C2_log                  =   ClassV==2;
C3_log                  =   ClassV==3;
C4_log                  =   ClassV==4;

ClassTable              =   table(length(C1_log(C1_log))/L*100,...
                                    length(C2_log(C2_log))/L*100,...
                                    length(C3_log(C3_log))/L*100,...
                                    length(C4_log(C4_log))/L*100,...
                                    'VariableNames',{'C1','C2','C3','C4'});

% -------------------------------------
L2                      =   length(C1_log(C1_log));
Both_Low_log            =   C1_log & ~Normal_RSubmergenceCmpMedian_log & ~Extreme_RSubmergenceCmpMedian_log;
Only_Normal_High_log    =   C1_log & Normal_RSubmergenceCmpMedian_log & ~Extreme_RSubmergenceCmpMedian_log;
Only_Extreme_High_log   =   C1_log & ~Normal_RSubmergenceCmpMedian_log & Extreme_RSubmergenceCmpMedian_log;
Both_High_log           =   C1_log & Normal_RSubmergenceCmpMedian_log & Extreme_RSubmergenceCmpMedian_log;

C1_ClassTable           =   table(length(Both_Low_log(Both_Low_log))/L2*100,...
                                    length(Only_Normal_High_log(Only_Normal_High_log))/L2*100,...
                                    length(Only_Extreme_High_log(Only_Extreme_High_log))/L2*100,...
                                    length(Both_High_log(Both_High_log))/L2*100,...
                                    'VariableNames',{'Both_Low','Only_Normal_High','Only_Extreme_High','Both_High'});

C1_log | C2_log |C3_log|C4_log;
%% ===========================Supplementary information (Table 4)
M_log                       =   [Both_Low_log,....         
                                    Only_Normal_High_log,... 
                                    Only_Extreme_High_log,...
                                    Both_High_log,...        
                                    C2_log,...
                                    C3_log,...
                                    C4_log];

NIClassStr                  =   {'Nearshore(<=Median)',...
                                    'Nearshore(N>Median & E<=Median)',...
                                    'Nearshore(N<=Median & E>Median)',...
                                    'Nearshore(>Median)',...
                                    'Inland',...
                                    'Nearshore(Normal)-Inland(Extreme)',....
                                    'Inland(Normal)-Nearshore(Extreme)'};







%% ===========================disp+++++++++++++++++++++++++++++++++++++++++
NearshoreNumTable

disp(['Both NID>2:',32,num2str(length(BothMore2_log(BothMore2_log)))]);

disp(['CNID -0.1 0.1:',32,num2str( Change_DSStruct(3).Num+Change_DSStruct(4).Num) ,32,...
                            num2str(TPer(3)+TPer(4)),'%']);


ClassTable

C1_ClassTable