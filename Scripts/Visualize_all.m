% clear all;
function Visualize_all(path_data,sampRate,FftWindow)
clc;close all

SetEnvironment
SetPath

% path_data='C:\Users\he\Documents\Dropbox\MyC#Work\emote4jin\Data Collector 1.2\Data Collector Host 1.2\Data Collector Host\bin\Debug';
% path_data = strcat(g_str_pathbase_data,'training\ball - 408');
% path_data = strrep('C:\Users\royd\Desktop\Temp\osu_farm_nearshed_may24_2016\cut','\','/');
% path_data = 'C:\Users\royd\Documents\WIP\Darree_Fields\cut';
%path_data = 'C:\Users\roy.174\Documents\HornNet Data (radar,network)\Darree_humans_and_groups_Oct_2016\Darree_Fields_light_foliage_17_Oct_2016\cut';
%path_data = '/home/neel/box.com/All_programs_data_IPSN_2016/Simulation/toDhruboMichael/Data_Repository/Bike data/Aug 9 2017/Detect_begs_and_ends/param0.9/cut/bikes humans radar x/';

cd(path_data);
fileFullNames=dir;
Files={};  % first 2 file is '.' and '..'
i=1;
for j=1:length(fileFullNames)
    s=fileFullNames(j).name;
    k=strfind(s,'.data');
    if ~isempty(k) && k>=2 && k+4==length(s)
        Files{i}=s(1:k-1);
        i=i+1;
    end
end

for i=1:length(Files) % take every file from the set 'Files'
    sprintf('%dth file is processing: %s\n',i,char(Files{i})) % the i-th file is processing
    fileName=Files{i};
    Visualize(fileName,sampRate,FftWindow);
%     pause;
end