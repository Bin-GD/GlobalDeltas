%% ========================================================================
% Classification of Inundation Area and Population Susceptibility in Coastal 
% and Inland Delta Zones
%% ========================================================================
clear;
clc;
addpath Lib\

%% ========================================================================
disp('Normal 2000-2024')
OpenPath    =   'Data\Class_Popu_Area\Class_Normal_Popu_AreaT_2000-2024.mat';
[N_ClassTable,....
                N_ClassSubTable]=AnalysisClass_PopArea(OpenPath)


%% ------------------------------------
disp('Extreme 2000-2024')
OpenPath    =   'Data\Class_Popu_Area\Class_Extreme_Popu_AreaT_2000-2024.mat';
[E_ClassTable,....
                E_ClassSubTable]=AnalysisClass_PopArea(OpenPath)


%% ========================================================================
disp('Normal 2000-2012')
OpenPath    =   'Data\Class_Popu_Area\Class_Normal_Popu_AreaT_2000-2012.mat';
[N_ClassTable_2000_2012,....
                N_ClassSubTable_2000_2012]=AnalysisClass_PopArea(OpenPath)

%% ------------------------------------
disp('Extreme 2000-2012')
OpenPath    =   'Data\Class_Popu_Area\Class_Extreme_Popu_AreaT_2000-2012.mat';
[E_ClassTable_2000_2012,....
                E_ClassSubTable_2000_2012]=AnalysisClass_PopArea(OpenPath)

%% ========================================================================
disp('Normal 2012-2024')
OpenPath    =   'Data\Class_Popu_Area\Class_Normal_Popu_AreaT_2012-2024.mat';
[N_ClassTable_2012_2024,....
                N_ClassSubTable_2012_2024]=AnalysisClass_PopArea(OpenPath)

%% ------------------------------------
disp('Extreme 2012-2024')
OpenPath    =   'Data\Class_Popu_Area\Class_Extreme_Popu_AreaT_2012-2024.mat';
[E_ClassTable_2012_2024,....
                E_ClassSubTable_2012_2024]=AnalysisClass_PopArea(OpenPath)


