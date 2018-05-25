% SetEnvironment.m
% set up global environment variables for IIITDemo that are user-specific.
% See also SETPATH
% INSTRUCTIONS TO UPDATE THIS SCRIPT FOR A NEW USER:
% 1) figure out your username
% 2) insert appropriate str_pathbase variable
% 3) insert appropriate 'elseif' statement.
% Michael McGrath
% 2015-10-16

%% early return. comment out if something breaks.
%if exist('g_env_is_set','var') == 1
   % if g_env_is_set == true
      %  return
  %  end
%end

%% list all path roots here.  they should mostly be the same.
str_pathbase_radar_jin  = 'C:/Users/he/Documents/Dropbox/MyMatlabWork/radar';
str_pathbase_radar_mike = 'C:/Users/researcher/Box Sync/All_programs_data_IPSN_2016/Simulation/toDhruboMichael';
str_pathbase_radar_dhrubo = '/media/Roy.174/6b93b438-a3d4-40d2-9f3d-d8cdbb850183/Research/Robust_Learning';
str_pathbase_radar_Roy = 'C:/Users/Roy/Box Sync/All_programs_data_IPSN_2016/Simulation/toDhruboMichael';
str_pathbase_radar_Balderdash = '/Users/Balderdash/Box/All_programs_data/Simulation/toDhruboMichael';
str_pathbase_radar_OSC = '/users/PAS1090/osu8577/RobustEnv';
str_pathbase_radar_Neel = '/home/neel/box.com/All_programs_data_IPSN_2016/Simulation/toDhruboMichael';
str_pathbase_radar_dhrubo_Ubuntu = '/home/roy174/Robust_Learning';

str_pathbase_data_jin = 'C:/Users/he/My Research/2015.1/test';
str_pathbase_data_mike = 'C:/Users/researcher/Box Sync/All_programs_data_IPSN_2016/Simulation/toDhruboMichael/data';
%str_pathbase_data_dhrubo = 'C:/Users/roy.174/Box Sync/All_programs_data_IPSN_2016/Simulation/toDhruboMichael/data';
str_pathbase_data_dhrubo = '/media/Roy.174/6b93b438-a3d4-40d2-9f3d-d8cdbb850183/Research/Robust_Learning/Data_Repository';
str_pathbase_data_Roy = 'C:/Users/Roy/Box Sync/All_programs_data_IPSN_2016/Simulation/toDhruboMichael/data';
str_pathbase_data_Balderdash = '/Users/Balderdash/Box/All_programs_data/Simulation/toDhruboMichael/data';
str_pathbase_data_OSC = '';
str_pathbase_data_Neel = '/home/neel/box.com/All_programs_data_IPSN_2016/Simulation/toDhruboMichael/Data_Repository';
str_pathbase_data_dhrubo_Ubuntu = '/home/roy174/Robust_Learning/Data';

str_pathbase_model_mike = 'C:/Users/researcher/Box Sync/All_programs_data_IPSN_2016/Simulation/toDhruboMichael/IIITDemo/Models/researcher';
str_pathbase_model_dhrubo = '/media/Roy.174/6b93b438-a3d4-40d2-9f3d-d8cdbb850183/Research/Robust_Learning/Models';
str_pathbase_model_Roy = 'C:/Users/Roy/Box Sync/All_programs_data_IPSN_2016/Simulation/toDhruboMichael/IIITDemo/Models/Roy';
str_pathbase_model_Balderdash = '/Users/Balderdash/Box/All_programs_data/Simulation/toDhruboMichael/IIITDemo/Models/Balderdash';
str_pathbase_model_OSC = '/users/PAS1090/osu8577/RobustEnv/Models/osu8577';
str_pathbase_model_Neel = '/home/neel/box.com/All_programs_data_IPSN_2016/Simulation/toDhruboMichael/IIITDemo/Models/Neel';
str_pathbase_model_dhrubo_Ubuntu = '/home/roy174/Robust_Learning/Models';

%% assign path roots to global variables.

if strcmp(getenv('USERNAME'),'he')==1 
    g_str_pathbase_radar = str_pathbase_radar_jin;
    g_str_pathbase_data  = str_pathbase_data_jin;
elseif strcmp(getenv('USERNAME'),'researcher')==1
    g_str_pathbase_radar = str_pathbase_radar_mike;
    g_str_pathbase_data  = str_pathbase_data_mike;
    g_str_pathbase_model = str_pathbase_model_mike;
elseif strcmpi(getenv('USER'),'roy.174'      )==1
    g_str_pathbase_radar = str_pathbase_radar_dhrubo;
    g_str_pathbase_data  = str_pathbase_data_dhrubo;
    g_str_pathbase_model = str_pathbase_model_dhrubo;
elseif strcmp(getenv('USER'),'roy174'      )==1
    g_str_pathbase_radar = str_pathbase_radar_dhrubo_Ubuntu;
    g_str_pathbase_data  = str_pathbase_data_dhrubo_Ubuntu;
    g_str_pathbase_model = str_pathbase_model_dhrubo_Ubuntu;
elseif strcmp(getenv('USERNAME'),'Roy'      )==1
    g_str_pathbase_radar = str_pathbase_radar_Roy;
    g_str_pathbase_data  = str_pathbase_data_Roy;
    g_str_pathbase_model = str_pathbase_model_Roy;
elseif strcmp(getenv('USER'),'Balderdash'      )==1
    g_str_pathbase_radar = str_pathbase_radar_Balderdash;
    g_str_pathbase_data  = str_pathbase_data_Balderdash;
    g_str_pathbase_model = str_pathbase_model_Balderdash;
% elseif strcmp(getenv('PBS_O_LOGNAME'),'osu8577')==1
elseif strcmp(getenv('PBS_O_LOGNAME'),'osu8577')==1 % Alternatively: elseif strcmp(getenv('PBS_O_LOGNAME'),'osu8577')==1
    g_str_pathbase_radar = str_pathbase_radar_OSC;
    g_str_pathbase_data  = str_pathbase_data_OSC;
    g_str_pathbase_model = str_pathbase_model_OSC;
elseif strcmp(getenv('USER'),'neel')==1
    g_str_pathbase_radar = str_pathbase_radar_Neel;
    g_str_pathbase_data  = str_pathbase_data_Neel;
    g_str_pathbase_model = str_pathbase_model_Neel;
else
    fprintf('ERROR! no environment defined for user %s\n',getenv('USER'));
end

% see SetPath.m for script that uses these global variables to set the path

g_env_is_set = true;

% cleanup
clear str_pathbase_radar_jin str_pathbase_radar_mike str_pathbase_radar_dhrubo str_pathbase_radar_Roy str_pathbase_radar_Balderdash str_pathbase_radar_OSC str_pathbase_radar_Neel str_pathbase_radar_dhrubo_Ubuntu
clear str_pathbase_data_jin str_pathbase_data_mike str_pathbase_data_dhrubo str_pathbase_data_Roy str_pathbase_data_Balderdash str_pathbase_data_OSC str_pathbase_data_Neel str_pathbase_data_dhrubo_Ubuntu
clear str_pathbase_model_mike str_pathbase_model_dhrubo str_pathbase_model_Roy str_pathbase_model_Balderdash str_pathbase_model_OSC str_pathbase_model_Neel str_pathbase_model_dhrubo_Ubuntu
