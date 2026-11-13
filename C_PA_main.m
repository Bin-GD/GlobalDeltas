%% ========================================================================
% Comparison of population and area fractions in potentially inundated areas
% of global deltas over different time periods
%% ========================================================================
clear;
clc;
addpath Lib\

%% ========================================================================

Normal_Avector          =   [-10:5:10]./100;
Extreme_Avector         =   [-20:10:20]./100;

disp('2000-2024');
AnalysiPopRelativeArea('Data\PopulationPerT\PopulationPerT_2000-2024.mat',...
                                    Normal_Avector,....
                                    Extreme_Avector);

% -----------------------------------
disp('2000-2012');
AnalysiPopRelativeArea('Data\PopulationPerT\PopulationPerT_2000-2012.mat',...
                                    Normal_Avector,....
                                    Extreme_Avector);

% -----------------------------------
disp('2012-2024');
AnalysiPopRelativeArea('Data\PopulationPerT\PopulationPerT_2012-2024.mat',...
                                    Normal_Avector,....
                                    Extreme_Avector);
