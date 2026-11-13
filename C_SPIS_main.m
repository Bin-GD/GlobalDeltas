%% ========================================================================
% Classification of global major river deltas into four subtypes of population inundation sensitivity
%% ========================================================================
addpath Lib\
clear
clc

load('Data\FuturePopAreaVariable\MFutureAreaVariableTable.mat');
load('Data\FuturePopAreaVariable\MFuturePopVariableTable.mat');
load('Data\FuturePopAreaVariable\MFutureClassDetailTable.mat');

%% ========================================================================
Class_2050_ssp245_SSP2          =   table2array( MFutureClassDetailTable(:,12) );
Class_2100_ssp245_SSP2          =   table2array( MFutureClassDetailTable(:,27) );
% -------------------------------------
Class_U2050_N                   =   table2array( MFutureClassDetailTable(:,2) );
Class_U2100_N                   =   table2array( MFutureClassDetailTable(:,3) );
Class_U2050_2100_N              =   table2array( MFutureClassDetailTable(:,4) );


% -------------------------------------
[ClassTable_2050_ssp245_SSP2,....
             MultipeSceneClassTable_2050]           =   GetClassTable(Class_2050_ssp245_SSP2,...
                                                                        Class_U2050_N);


%% ------------------------------------------------------------------------------------

% -------------------------------------
[ClassTable_2100_ssp245_SSP2,....
             MultipeSceneClassTable_2100]           =   GetClassTable(Class_2100_ssp245_SSP2,...
                                                                        Class_U2100_N);


%% ------------------------------------------------------------------------------------
% -------------------------------------
[~,....
             MultipeSceneClassTable_2050_2100]      =   GetClassTable(Class_2100_ssp245_SSP2,...
                                                                        Class_U2050_2100_N);



%% ========================================================================

ClassTable_2050_ssp245_SSP2
ClassTable_2100_ssp245_SSP2

MultipeSceneClassTable_2050
MultipeSceneClassTable_2100
MultipeSceneClassTable_2050_2100


