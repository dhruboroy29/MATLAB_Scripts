function MASS_2017_RandomSplits_MAD_Training(arff_folderlist, inrnd, seed)

SetEnvironment
SetPath

path_to_all_arffs = strcat(g_str_pathbase_radar,'/IIITDemo/Arff/Datasets_MASS_2017');

fid = fopen('env_vars.txt','wt');
fprintf(fid,'%s\n',g_str_pathbase_radar);
fprintf(fid,'%s\n',g_str_pathbase_model);
fprintf(fid,'%s',path_to_all_arffs);
fclose(fid);

rnd = inrnd*10; % Convention: for random splits, use round indices 10, 20, 30, ..., 60

for fld=1:length(arff_folderlist)
    path_temp = strcat(g_str_pathbase_radar,'/IIITDemo/Arff/Randseed',num2str(seed),'/Round',num2str(rnd),'/',char(arff_folderlist{fld}), '/single_envs');
    
    if exist(path_temp, 'dir') ~= 7
        mkdir(path_temp); % Includes path_to_topk_arffs_scaled
        fprintf('INFO: created directory %s\n', path_temp);
    end
    
    s = char(arff_folderlist{fld});
    remain = s;
    
    while true
        [str, remain] = strtok(remain, '_');
        if isempty(str),  break;  end
        env = sprintf('%s', str);
        copyfile(strcat(path_to_all_arffs,'/radar',env,'_scaled.arff'),path_temp);
    end
end

for fld=1:length(arff_folderlist)
    path_to_training_arffs = strcat(g_str_pathbase_radar,'/IIITDemo/Arff/Randseed',num2str(seed),'/Round',num2str(rnd),'/',char(arff_folderlist{fld}), '/single_envs');
    cd(path_to_training_arffs);
    fileFullNames=dir('*.arff');
    
    i=1;
    trainFiles={};
    for j=1:length(fileFullNames)
        s=fileFullNames(j).name;
        k=strfind(s,'.arff');
        if ~isempty(k) && k>=2 && k+4==length(s)
            trainFiles{i}=s(1:k-1);
            i=i+1;
        end
    end
    
    cd(path_to_all_arffs);
    fileFullNames=dir('*.arff');
    
    i=1;
    allFiles={};
    for j=1:length(fileFullNames)
        s=fileFullNames(j).name;
        k=strfind(s,'.arff');
        if ~isempty(k) && k>=2 && k+4==length(s)
            allFiles{i}=s(1:k-1);
            i=i+1;
        end
    end
    
    testFiles = setdiff(allFiles,trainFiles);
    
    path_to_test_arffs = strcat(g_str_pathbase_radar,'/IIITDemo/Arff/Randseed',num2str(seed),'/Round',num2str(rnd),'/',char(arff_folderlist{fld}), '/test');
    
    if exist(path_to_test_arffs, 'dir') ~= 7
        mkdir(path_to_test_arffs); % Includes path_to_topk_arffs_scaled
        fprintf('INFO: created directory %s\n', path_to_test_arffs);
    end
    
    for f=1:length(testFiles)
        copyfile(strcat(path_to_all_arffs,'/',testFiles{f},'.arff'),path_to_test_arffs);
    end
    
    path_to_combined_arffs = strcat(g_str_pathbase_radar,'/IIITDemo/Arff/Randseed',num2str(seed),'/Round',num2str(rnd),'/',char(arff_folderlist{fld}), '/combined');
    
    if exist(path_to_combined_arffs, 'dir') ~= 7
        mkdir(path_to_combined_arffs); % Includes path_to_topk_arffs_scaled
        fprintf('INFO: created directory %s\n', path_to_combined_arffs);
    end
    
    path_to_temp_all=strcat(g_str_pathbase_radar,'/IIITDemo/Arff/temp-all');
    
    if exist(path_to_temp_all, 'dir') ~= 7
        mkdir(path_to_temp_all); % Includes path_to_topk_arffs_scaled
        fprintf('INFO: created directory %s\n', path_to_temp_all);
    end
    
    cd(path_to_temp_all);
    delete('*.arff');
    
    
    path_to_temp_comb=strcat(g_str_pathbase_radar,'/IIITDemo/Arff/combined');
    
    if exist(path_to_temp_comb, 'dir') ~= 7
        mkdir(path_to_temp_comb); % Includes path_to_topk_arffs_scaled
        fprintf('INFO: created directory %s\n', path_to_temp_comb);
    end
    
    cd(path_to_temp_comb);
    delete('*.arff');
    
    for f=1:length(trainFiles)
        copyfile(strcat(path_to_all_arffs,'/',trainFiles{f},'.arff'),path_to_temp_all);
    end
    
    Combine_arff_doit_v2;
    movefile(strcat(g_str_pathbase_radar,'/IIITDemo/Arff/combined/*.arff'),path_to_combined_arffs);
    
    % Create random single-environment splits
    combined_ARFF = dir(strcat(path_to_combined_arffs,'/*.arff'));
    data = loadARFF(strcat(path_to_combined_arffs,'/',combined_ARFF.name));
    CreateRandomSplits(data,seed,inrnd,path_to_training_arffs);
    
    % Delete original single environment files
    delete(strcat(path_to_training_arffs,'/radar*.arff'));
end

% Write order of processing of environments
writetable(cell2table(arff_folderlist'),strcat(g_str_pathbase_radar,'/IIITDemo/Arff/Randseed',num2str(seed),'/Round',num2str(rnd),'/env_processing_order.csv'),'WriteVariableNames',0);

for fld=1:length(arff_folderlist)
    for cur_rnd={'10' '15' '20' '25' '30' '35' '40'}
        arff_folder = char(arff_folderlist{fld});
        top_k = str2num(char(cur_rnd));
        
        % Train with InfoGainMAD filter
        RunTrainingScript_RandomSplits_InfoGainMAD(arff_folder, 0.25, seed, rnd, top_k, 's');
        RunTrainingScript_RandomSplits_InfoGainMAD(arff_folder, 0.5, seed, rnd, top_k, 's');
        RunTrainingScript_RandomSplits_InfoGainMAD(arff_folder, 0.75, seed, rnd, top_k, 's');
        RunTrainingScript_RandomSplits_InfoGainMAD(arff_folder, 1.0, seed, rnd, top_k, 's');
        RunTrainingScript_RandomSplits_InfoGainMAD(arff_folder, 5.0, seed, rnd, top_k, 's');
        RunTrainingScript_RandomSplits_InfoGainMAD(arff_folder, 10.0, seed, rnd, top_k, 's');
        RunTrainingScript_RandomSplits_InfoGainMAD(arff_folder, 20.0, seed, rnd, top_k, 's');
        RunTrainingScript_RandomSplits_InfoGainMAD(arff_folder, 50.0, seed, rnd, top_k, 's');
        
        % Train with mRMRMAD filter
        RunTrainingScript_RandomSplits_mRMRMAD(arff_folder, 0.25, seed, rnd, top_k, 's');
        RunTrainingScript_RandomSplits_mRMRMAD(arff_folder, 0.5, seed, rnd, top_k, 's');
        RunTrainingScript_RandomSplits_mRMRMAD(arff_folder, 0.75, seed, rnd, top_k, 's');
        RunTrainingScript_RandomSplits_mRMRMAD(arff_folder, 1.0, seed, rnd, top_k, 's');
        RunTrainingScript_RandomSplits_mRMRMAD(arff_folder, 5.0, seed, rnd, top_k, 's');
        RunTrainingScript_RandomSplits_mRMRMAD(arff_folder, 10.0, seed, rnd, top_k, 's');
        RunTrainingScript_RandomSplits_mRMRMAD(arff_folder, 20.0, seed, rnd, top_k, 's');
        RunTrainingScript_RandomSplits_mRMRMAD(arff_folder, 50.0, seed, rnd, top_k, 's');
    end
end


% for cur_rnd={'10' '15' '20' '25' '30' '35' '40'}
% %for cur_rnd={'15'}
%     fldr = char(arff_folderlist{1});
%     evalstr = strcat('crossval_str_',char(cur_rnd),'=crossval_',fldr,'_r1_top',char(cur_rnd),';');
%     eval([evalstr]);
% end
% 
% 
% for fld=2:length(arff_folderlist)
%     for cur_rnd={'10' '15' '20' '25' '30' '35' '40'}
%     %for cur_rnd={'15'}
%         fldr = char(arff_folderlist{fld});
%         evalstr = strcat('crossval_str_',char(cur_rnd),'=[crossval_str_',char(cur_rnd),'; crossval_',fldr,'_r1_top',char(cur_rnd),'];');
%         eval([evalstr]);
%     end
% end
% 
% %dlmwrite(strcat(g_str_pathbase_radar,'/IIITDemo/Arff/BigEnvs/Round',num2str(rnd),'/crossenv_',list_features{f},'_humans.csv'),results_per_sheet);
% 
% for cur_rnd={'10' '15' '20' '25' '30' '35' '40'}
% %for cur_rnd={'15'}
%     eval(['crossval=crossval_str_' char(cur_rnd)]);
%     eval(['dlmwrite(strcat(g_str_pathbase_radar,''/IIITDemo/Arff/BigEnvs/Round'',num2str(rnd),''/crossval_str_'',char(cur_rnd),''.csv''),crossval);']);
% end