%% ========================================================================
% Population exposure in potential seawater inundation areas
%% ========================================================================
clear;
clc;
close all;
addpath Lib\
addpath AddLib\


load('Data\DeltaAreaRisk.mat');
load('Data\PopS.mat');
load('Data\PopSlopeInfo.mat');

DeltaContentsInfo       =   table2array( DeltaAreaRisk(1).ClassDelta(:,end) );


%% ========================================================================

%% ========================================================================
% Population slope & R2 info analysis results 
PopSlopeR2              =   table2array( PopSlopeInfo(3).PopSlopeInfoTable(:,2:3) );

%% ========================================================================
% Population slope & R2 info analysis results (2000-2012)
PopSlopeR2_2000_2012                          =   table2array( PopSlopeInfo(1).PopSlopeInfoTable(:,2:3) );


%% ========================================================================
% Population slope & R2 info analysis results (2012-2024)
PopSlopeR2_2012_2024                          =   table2array( PopSlopeInfo(2).PopSlopeInfoTable(:,2:3) );

%% ========================================================================
BothMore0_log   =   PopSlopeR2_2000_2012(:,1)>0 & PopSlopeR2_2012_2024(:,1)>0;
BothL_M_log     =   PopSlopeR2_2000_2012(:,1)<=0 & PopSlopeR2_2012_2024(:,1)>0;
BothM_L_log     =   PopSlopeR2_2000_2012(:,1)>0 & PopSlopeR2_2012_2024(:,1)<=0;
BothLess0_log   =   PopSlopeR2_2000_2012(:,1)<=0 & PopSlopeR2_2012_2024(:,1)<=0;

length(BothMore0_log(BothMore0_log))/length(BothMore0_log)*100
length(BothL_M_log(BothL_M_log))/length(BothL_M_log)*100
length(BothM_L_log(BothM_L_log))/length(BothM_L_log)*100
length(BothLess0_log(BothLess0_log))/length(BothLess0_log)*100



%% ========================disp++++++++++++++++++++++++++++++++++++++++++++

disp('2000-2024')
PopS.EachCsPerTable                 
PopS.CorVDifWaterTable              
PopS.PopSlopeTable                  

PopS.PopPerTable                    
PopS.Normal_SPopPerTable            
PopS.Extreme_SPopPerTable           
PopS.SlopeM1_R2Table           

% ------------------------
disp('2000-2012')
PopS.PopSlopeTable_2000_2012        
PopS.PopPerTable_2000_2012          
PopS.Normal_SPopPerTable_2000_2012  
PopS.Extreme_SPopPerTable_2000_2012 
PopS.SlopeM1_R2Table_2000_2012      

% ------------------------
disp('2012-2024')
PopS.PopSlopeTable_2012_2024        
PopS.PopPerTable_2012_2024          
PopS.Normal_SPopPerTable_2012_2024  
PopS.Extreme_SPopPerTable_2012_2024 
PopS.SlopeM1_R2Table_2012_2024      


