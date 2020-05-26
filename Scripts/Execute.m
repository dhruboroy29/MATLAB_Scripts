
% clc; close all; clear all

% gamma bigger, the exp(-gamma*x) curve is more curly,otherwise more
% straight

SetEnvironment
SetPath

%path_data_human = strcat(g_str_pathbase_data,'\training\test_human_onedata'); %REPLACE: human - 406
%path_data_dog   = strcat(g_str_pathbase_data,'\training\test_dog_onedata'); %REPLACE: ball - 408

% Index = [17,18,19,20]; %205 246
% data_human = {'\IPSNdata\loc_17','\IPSNdata\AveryPark_18','\IPSNdata\NearForest_19','NIL'};
% data_dog = {'NIL','NIL','NIL','\IPSNdata\RadarPendulumData-ParkingLot_20'};



% Index = [3]; %205 246
% data_human = {'\IPSNdata\kh_3\Human'};
% data_dog = {'\IPSNdata\kh_3\Dog'};

% Index = [6,7,8,9,10,11];
% data_human = {'\IPSNdata\9603_6','\IPSNdata\Glacier_Ridge_7','\IPSNdata\Ballantrae_8','\IPSNdata\Coffman_9','\IPSNdata\ceiling_238_10\Human','NIL'};
% data_dog =   {'NIL',             'NIL',                      'NIL',                   'NIL',                '\IPSNdata\ceiling_238_10\Dog',  '\IPSNdata\dog_cut_11'};

% Index = [11,10,9,8,7,6];
% data_human = {'NIL',                 '\IPSNdata\ceiling_238_10\Human','\IPSNdata\Coffman_9','\IPSNdata\Ballantrae_8','\IPSNdata\Glacier_Ridge_7','\IPSNdata\9603_6'};
% data_dog =   {'\IPSNdata\dog_cut_11','\IPSNdata\ceiling_238_10\Dog',  'NIL',                'NIL',                   'NIL',                      'NIL'};

% Index = [12,13,14,15,16,17,18,19,20];
% data_human = { 'NIL'                , '\IPSNdata\kwon_milling_13', '\IPSNdata\r012_14', 'NIL'                      , '\IPSNdata\BryanPark_16', '\IPSNdata\loc_17', '\IPSNdata\AveryPark_18', '\IPSNdata\NearForest_19', 'NIL'};
% data_dog =   { '\IPSNdata\gudiya_12', 'NIL'                      , 'NIL'              , '\IPSNdata\rambling_rmc_15', 'NIL'                   , 'NIL'             , 'NIL'                   , 'NIL'                    , '\IPSNdata\RadarPendulumData-ParkingLot_20'};

%Index = [13,14,15,16,17,18,19,20];
%data_human = { '\IPSNdata\kwon_milling_13', '\IPSNdata\r012_14', 'NIL'                      , '\IPSNdata\BryanPark_16', '\IPSNdata\loc_17', '\IPSNdata\AveryPark_18', '\IPSNdata\NearForest_19', 'NIL'};
%data_dog =   { 'NIL'                      , 'NIL'              , '\IPSNdata\rambling_rmc_15', 'NIL'                   , 'NIL'             , 'NIL'                   , 'NIL'                    , '\IPSNdata\RadarPendulumData-ParkingLot_20'};

% Index = [20,19,18,17,16,15,14,13,12];
% data_human = {  'NIL'                                     , '\IPSNdata\NearForest_19', '\IPSNdata\AveryPark_18', '\IPSNdata\loc_17', '\IPSNdata\BryanPark_16', 'NIL'                      , '\IPSNdata\r012_14', '\IPSNdata\kwon_milling_13', 'NIL' };
% data_dog =   { '\IPSNdata\RadarPendulumData-ParkingLot_20', 'NIL'                    , 'NIL'                   , 'NIL'             , 'NIL'                   , '\IPSNdata\rambling_rmc_15', 'NIL'              , 'NIL'                      , '\IPSNdata\gudiya_12' };

%% Final set - uncomment block when not running a test extraction
% Index = [11302011,4,9,10,11,19,18,17,16,15,14,13,12,5,1,2,3,8,5152011,5162011];
% data_human = { '\IPSNdata\11-30-2011\Human\cut' , '\IPSNdata\bv_4\Human', '\IPSNdata\Coffman_9', '\IPSNdata\ceiling_238_10\Human', 'NIL',                  '\IPSNdata\NearForest_19', '\IPSNdata\AveryPark_18', '\IPSNdata\loc_17', '\IPSNdata\BryanPark_16', 'NIL' ,                      'NIL',               '\IPSNdata\kwon_milling_13', 'NIL',                 '\IPSNdata\combined_5\Human', '\IPSNdata\arc_1\Human', '\IPSNdata\prb_2\Human', '\IPSNdata\kh_3\Human', '\IPSNdata\Ballantrae_8', '\IPSNdata\5-15-2011\Human\cut', 'NIL'};
% data_dog =   { 'NIL',                             '\IPSNdata\bv_4\Dog',   'NIL',                 '\IPSNdata\ceiling_238_10\Dog',   '\IPSNdata\dog_cut_11', 'NIL',                     'NIL',                    'NIL',              'NIL',                    '\IPSNdata\rambling_rmc_15', '\IPSNdata\r012_14', 'NIL',                       '\IPSNdata\gudiya_12', '\IPSNdata\combined_5\Dog',   '\IPSNdata\arc_1\Dog',   '\IPSNdata\prb_2\Dog',   '\IPSNdata\kh_3\Dog',   'NIL',                    '\IPSNdata\5-15-2011\Car\cut',   '\IPSNdata\5-16-2011\Car\cut'};

%% Test folder - comment block when not running a test extraction
% Index = [999]; %205 246
% data_human = {'\FeatureTest'};
% data_dog = {'NIL'};

%% Cow datasets
% Index = [0220161, 0220162, 0524163];
% data_human = {'NIL', 'NIL', 'NIL'};
% data_dog = {'/IPSNdata/Baltimore_cattle_Feb_20_2016/Radar_site_1_hilltop/cut', '/IPSNdata/Baltimore_cattle_Feb_20_2016/Radar_site_2_creamery/cut',...
%     '/IPSNdata/Waterman_cattle_May_24_2016/osu_farm_meadow_may24-28_2016/cut'};

%% OSU Wetlands human data
% Index = [112016];
% data_dog = {'NIL'};
% data_human = {'/IPSNdata/Wetlands_radar_data/cut'};

%% Darree Fields human and group data, and Sandeep's parking garage data
%Index = [09102016, 03232010, 03292010];
%data_dog = {'NIL', 'NIL', 'NIL'};
%data_human = {'/Darree_Fields/cut', '/Parking garage radial ortho (Sandeep)/radial/cut' , '/Parking garage radial ortho (Sandeep)/ortho/cut'};

% Index = [09102016];
% data_dog = {'NIL'};
% data_human = {'/Darree_Fields/cut'};

%% 2014.08 Bike data
% Index = [201408];
% data_dog = {'/Bike data/cut'};
% data_human = {'NIL'};

%% Anomalous data
% Index = [03202017, 030230670]
% data_dog = {'/Anomalous_WLN/3-2 30670 overnight cold/cut', '/Anomalous_WLN/close zoom/cut'};
% data_human = {'NIL', 'NIL'};

% Index=[03022018]
% data_dog={'/Close zoom/Anomaly'};
% data_human={'/Close zoom/Human'};

%% Any test data, such as a single walk cut
%Index = [2468];
%data_dog = {'NIL'};
%data_human = {'/FeatureTest/Human'};

%% MSRI: Windowed Bumblebee data: winlen=384, stride=128    [UNBALANCED]
% Index=[041019]
% data_dog={'/Targets_full_windowed_bkp/winlen_384_stride_384/Nonhuman'}
% data_human={'/Targets_full_windowed_bkp/winlen_384_stride_384/Human'}

%% MSRI: Bumblebee cut arffs
%Index=[0411191, 0411192, 0411193, 0411194, 0411195, 0411196, 0411197, 0411198, 0411199]
%data_dog={'/msr_radar2/arc_1 (Humans_Gym balls)/Ball/',...
% '/msr_radar2/bv_4 (Humans_Cars)/Car/',...
% '/msr_radar2/ceiling_238_10 (Humans_Gym balls)/Ball/',...
% '/msr_radar2/combined_5 (Humans_Dogs)/Dog/',...
% '/msr_radar2/kh_3 (Humans_Gym balls)/Dog/',...
% '/msr_radar2/prb_2 (Humans_Gym balls)/Dog/',...
% '/msr_radar2/osu_farm_meadow_may24-28_2016 (Cattle)/',...
% '/msr_radar2/Radar_site1_hilltop (Cattle)/',...
% '/msr_radar2/Radar_site2_creamery (Cattle)/'}
% 
% data_human={'/msr_radar2/arc_1 (Humans_Gym balls)/Human/',...
% '/msr_radar2/bv_4 (Humans_Cars)/Human/',...
% '/msr_radar2/ceiling_238_10 (Humans_Gym balls)/Human/',...
% '/msr_radar2/combined_5 (Humans_Dogs)/11-30-2011/Human',...
% '/msr_radar2/combined_5 (Humans_Dogs)/Human/',...
% '/msr_radar2/kh_3 (Humans_Gym balls)/Human/',...
% '/msr_radar2/prb_2 (Humans_Gym balls)/Human/',...
% '/msr_radar2/Parking garage orthogonal (Humans)/',...
% '/msr_radar2/Parking garage radial (Humans)/'}

%% MSRI: 1st window only: Windowed Bumblebee data: winlen=384, stride=128    [UNBALANCED]
%Index=[041219]
%data_dog={'/Targets_full_windowed_bkp/winlen_384_stride_384_winindex_1/Nonhuman'}
%data_human={'/Targets_full_windowed_bkp/winlen_384_stride_384_winindex_1/Human'}

%% MSRI: 1st window only, last window only, all windows: Windowed Bumblebee data: winlen=384, stride=384    [BALANCED]
%Index=[051019, 051319, 051419]
%data_dog={'/Targets_balanced/winlen_384_winindex_0/Nonhuman', '/Targets_balanced/winlen_384_winindex_-1/Nonhuman', '/Targets_balanced/winlen_384_winindex_all/Nonhuman'}
%data_human={'/Targets_balanced/winlen_384_winindex_0/Human', '/Targets_balanced/winlen_384_winindex_-1/Human', '/Targets_balanced/winlen_384_winindex_all/Human'}

%% MSRI: all windows: Windowed Bumblebee data: winlen=[256, 512, 640, 768, 896, 1024, 1152]    [BALANCED]
%Index=[256, 512, 640, 768, 896, 1024, 1152]
%data_dog={'/Targets_balanced/winlen_256_winindex_all/Nonhuman', '/Targets_balanced/winlen_512_winindex_all/Nonhuman', '/Targets_balanced/winlen_640_winindex_all/Nonhuman', '/Targets_balanced/winlen_768_winindex_all/Nonhuman', '/Targets_balanced/winlen_896_winindex_all/Nonhuman', '/Targets_balanced/winlen_1024_winindex_all/Nonhuman', '/Targets_balanced/winlen_1152_winindex_all/Nonhuman'}
%data_human={'/Targets_balanced/winlen_256_winindex_all/Human', '/Targets_balanced/winlen_512_winindex_all/Human', '/Targets_balanced/winlen_640_winindex_all/Human', '/Targets_balanced/winlen_768_winindex_all/Human', '/Targets_balanced/winlen_896_winindex_all/Human', '/Targets_balanced/winlen_1024_winindex_all/Human', '/Targets_balanced/winlen_1152_winindex_all/Human'}

%% MSRI: Train(1)-Val(2)-Test(3): Windowed Bumblebee data: winlen=[256, 384, 512, 640, 768]    [BALANCED]
Index=[2561, 2562, 2563, 3841, 3842, 3843, 5121, 5122, 5123];%, 6401, 6402, 6403, 7681, 7682, 7683];
data_dog={'/Targets_balanced/bb_3class_winlen_256_winindex_all/bb_3class_winlen_256_winindex_all_train/Nonhuman', '/Targets_balanced/bb_3class_winlen_256_winindex_all/bb_3class_winlen_256_winindex_all_val/Nonhuman', '/Targets_balanced/bb_3class_winlen_256_winindex_all/bb_3class_winlen_256_winindex_all_test/Nonhuman',...
    '/Targets_balanced/bb_3class_winlen_384_winindex_all/bb_3class_winlen_384_winindex_all_train/Nonhuman', '/Targets_balanced/bb_3class_winlen_384_winindex_all/bb_3class_winlen_384_winindex_all_val/Nonhuman', '/Targets_balanced/bb_3class_winlen_384_winindex_all/bb_3class_winlen_384_winindex_all_test/Nonhuman',...
    '/Targets_balanced/bb_3class_winlen_512_winindex_all/bb_3class_winlen_512_winindex_all_train/Nonhuman', '/Targets_balanced/bb_3class_winlen_512_winindex_all/bb_3class_winlen_512_winindex_all_val/Nonhuman', '/Targets_balanced/bb_3class_winlen_512_winindex_all/bb_3class_winlen_512_winindex_all_test/Nonhuman'};
%    '/Targets_balanced/bb_3class_winlen_640_winindex_all/bb_3class_winlen_640_winindex_all_train/Nonhuman', '/Targets_balanced/bb_3class_winlen_640_winindex_all/bb_3class_winlen_640_winindex_all_val/Nonhuman', '/Targets_balanced/bb_3class_winlen_640_winindex_all/bb_3class_winlen_640_winindex_all_test/Nonhuman',...
%    '/Targets_balanced/bb_3class_winlen_768_winindex_all/bb_3class_winlen_768_winindex_all_train/Nonhuman', '/Targets_balanced/bb_3class_winlen_768_winindex_all/bb_3class_winlen_768_winindex_all_val/Nonhuman', '/Targets_balanced/bb_3class_winlen_768_winindex_all/bb_3class_winlen_768_winindex_all_test/Nonhuman'};

data_human={'/Targets_balanced/bb_3class_winlen_256_winindex_all/bb_3class_winlen_256_winindex_all_train/Human', '/Targets_balanced/bb_3class_winlen_256_winindex_all/bb_3class_winlen_256_winindex_all_val/Human', '/Targets_balanced/bb_3class_winlen_256_winindex_all/bb_3class_winlen_256_winindex_all_test/Human',...
    '/Targets_balanced/bb_3class_winlen_384_winindex_all/bb_3class_winlen_384_winindex_all_train/Human', '/Targets_balanced/bb_3class_winlen_384_winindex_all/bb_3class_winlen_384_winindex_all_val/Human', '/Targets_balanced/bb_3class_winlen_384_winindex_all/bb_3class_winlen_384_winindex_all_test/Human',...
    '/Targets_balanced/bb_3class_winlen_512_winindex_all/bb_3class_winlen_512_winindex_all_train/Human', '/Targets_balanced/bb_3class_winlen_512_winindex_all/bb_3class_winlen_512_winindex_all_val/Human', '/Targets_balanced/bb_3class_winlen_512_winindex_all/bb_3class_winlen_512_winindex_all_test/Human'};
%    '/Targets_balanced/bb_3class_winlen_640_winindex_all/bb_3class_winlen_640_winindex_all_train/Human', '/Targets_balanced/bb_3class_winlen_640_winindex_all/bb_3class_winlen_640_winindex_all_val/Human', '/Targets_balanced/bb_3class_winlen_640_winindex_all/bb_3class_winlen_640_winindex_all_test/Human',...
%    '/Targets_balanced/bb_3class_winlen_768_winindex_all/bb_3class_winlen_768_winindex_all_train/Human', '/Targets_balanced/bb_3class_winlen_768_winindex_all/bb_3class_winlen_768_winindex_all_val/Human', '/Targets_balanced/bb_3class_winlen_768_winindex_all/bb_3class_winlen_768_winindex_all_test/Human'};

%% MSRI: Bumblebee regression data labels    [BALANCED]
%Index=[27681, 27682, 27683];
%data_dog={'/Targets_balanced/bb_3class_winlen_768_winindex_all/bb_3class_winlen_768_winindex_all_train/Nonhuman', '/Targets_balanced/bb_3class_winlen_768_winindex_all/bb_3class_winlen_768_winindex_all_val/Nonhuman', '/Targets_balanced/bb_3class_winlen_768_winindex_all/bb_3class_winlen_768_winindex_all_test/Nonhuman'};
%data_human={'/Targets_balanced/bb_3class_winlen_768_winindex_all/bb_3class_winlen_768_winindex_all_train/Human', '/Targets_balanced/bb_3class_winlen_768_winindex_all/bb_3class_winlen_768_winindex_all_val/Human', '/Targets_balanced/bb_3class_winlen_768_winindex_all/bb_3class_winlen_768_winindex_all_test/Human'};

%% Execute.m
featureClass = 0;

%
% these two lines put here because when the below two lines are commented
% out, without these two lines the program does not run
% nFeatures = 18;
% feature_min = zeros(1,nFeatures);
% scalingFactors=zeros(1,nFeatures);

% Comment these two lines if doing feature collection instead of data
% collection (which means build the arff file manually), for example create
% a radar77.arff in text editor and record the feature values there using
% real time classifier and display the feature value in MFDeploy

for i=1:length(Index)
    OutIndex = Index(i);
    fprintf('Processing OutIndex=%d...\n', OutIndex);
    if strcmp(data_human{i},'NIL')==1
        [feature_min, scalingFactors] = Build_arff_dog(OutIndex,0,featureClass, 0, 0, data_dog{i}); %Compute unscaled features
        %Build_arff_dog(OutIndex,1,featureClass, feature_min, scalingFactors, data_dog{i}); %Compute scaled features, cross-validate (suppressed, refer to RunResultScript_IoTDI.m)
    elseif strcmp(data_dog{i},'NIL')==1
        [feature_min, scalingFactors] = Build_arff_human(OutIndex,0,featureClass, 0, 0, data_human{i}); %Compute unscaled features (suppressed, refer to RunResultScript_IoTDI.m)
        %Build_arff_human(OutIndex,1,featureClass, feature_min, scalingFactors, data_human{i}); %Compute scaled features, cross-validate (suppressed, refer to RunResultScript_IoTDI.m)
    else
        [feature_min, scalingFactors] = Build_arff(OutIndex,0,featureClass, 0, 0, data_human{i}, data_dog{i}); %Compute unscaled features (suppressed, refer to RunResultScript_IoTDI.m)
        %Build_arff(OutIndex,1,featureClass, feature_min, scalingFactors, data_human{i}, data_dog{i}); %Compute scaled features, cross-validate (suppressed, refer to RunResultScript_IoTDI.m)
    end
    
    %% Uncomment this block to train a model
%         fileName=[g_str_pathbase_radar,'\IIITDemo\Models\human_dog_model',int2str(OutIndex),'.txt'];%,int2str(OutIndex)
%         [SV_matlab, param, gamma, rho, nRow]=Model2Matrix(fileName,length(feature_min));
%     
%         % for j=1:size(SV_matlab,1)
%         %     GenerateArrInCsharp(SV_matlab(j,:),['sv',int2str(j-1)]);
%         % end
%         Generate2DArrInCsharp(OutIndex,SV_matlab,param,gamma,rho,feature_min,scalingFactors);
%         nSV = nRow;
%     
%         % save model parameters MATLAB variables
%         str_fftsource = strcat('_',getenv('USERNAME'),'_eMote');
%     
%         str_pathbase_modelparameters = strcat(g_str_pathbase_radar,'\IIITDemo\Models\ModelParameters');
%         if exist(str_pathbase_modelparameters, 'dir') ~= 7
%             mkdir(str_pathbase_modelparameters);
%             printf('INFO: created directory %s\n', str_pathbase_modelparameters);
%         end
%         fname_modelparameter = [str_pathbase_modelparameters,'\ModelParameter',str_fftsource,num2str(OutIndex)];
%         save(fname_modelparameter,'SV_matlab','param','gamma','rho','feature_min','scalingFactors');
end

fprintf('All done!\n');
% param = GenerateArrInCsharp(param)
% feature_min = GenerateArrInCsharp(feature_min)
% scalingFactors = GenerateArrInCsharp(scalingFactors)

% DistributionOnFeature
% pause;
% FrameAndTestFiles