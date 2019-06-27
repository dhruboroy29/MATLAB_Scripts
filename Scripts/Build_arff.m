function [feature_min, scalingFactors] = Build_arff(OutIndex, ifScaled, featureClass, feature_min, scalingFactors, data_human, data_dog)

%OutIndex = 5;
%ifScaled = 1;

SetEnvironment
SetPath

%path_data_human = strcat(g_str_pathbase_data,'\training\test_human_onedata'); %REPLACE: human - 406
%path_data_dog   = strcat(g_str_pathbase_data,'\training\test_dog_onedata'); %REPLACE: ball - 408


path_data_human = strcat(g_str_pathbase_data,data_human);
path_data_dog = strcat(g_str_pathbase_data,data_dog);

%Initialize path to ARFF files
path_arff=strcat(g_str_pathbase_radar,'/IIITDemo/Arff/',getenv('USERNAME'));
if exist(path_arff, 'dir') ~= 7
    mkdir(path_arff);
    fprintf('INFO: created directory %s\n', path_arff);
end

%Initialize paths to FFT images
% path_images_human=strcat(path_arff,'\',sprintf('Images_%d',OutIndex),'\Human');
% if exist(path_images_human, 'dir') ~= 7
%     mkdir(path_images_human);
% end
%
% path_images_dog=strcat(path_arff,'\',sprintf('Images_%d',OutIndex),'\Dog');
% if exist(path_images_dog, 'dir') ~= 7
%     mkdir(path_images_dog);
% end

%%%%%%%%%%%%%%%%%%%%%%%%%%% build f_sets %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
f_set=[]; % f_set will eventually contain the complete list of feature vectors for all target and non-target files (Human/Dog etc.)
% f_set_nr=[]; % Extracting the non-robust subset of features: indices 1,5,9,12,21,22,24,25,32,54,61 from f_set
% f_set_r=[]; % Extracting the robust subset of features: indices 1,5,9,12,21,22,24,25,32 from f_set
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% human
cd(path_data_human);
fileFullNames=dir;
file_order = {};
Files={};  % first 2 file is '.' and '..'
i=1;
for j=1:length(fileFullNames)
    s=fileFullNames(j).name;
    k=strfind(s,'.data');
    if ~isempty(k) && k>=2 && k+4==length(s) % k+4==length(s) to avoid .data.emf file
        Files{i}=s(1:k-1);
        i=i+1;
    end
end
num_of_humans = num2str(length(Files));
for i=1:length(Files) % take every file from the set 'Files'
    if mod(i,10)==0
        sprintf('Human - %dth file is processing\n',i) % Report every 10 files-the i-th file is processing
    end
    %sprintf('Human - %dth file is processing\n',i)
    fileName=Files{i};
    file_order = [file_order string(fileName)];
    [~, f_file] = File2Feature(fileName, 'Human', ifScaled, featureClass, feature_min, scalingFactors,[]);
    %     if ifScaled==0
    %         [imghuman, f_file] = File2Feature(fileName, 'Human', ifScaled, featureClass, feature_min, scalingFactors,[]);
    %         dlmwrite(strcat(path_images_human,'\',fileName,'.fft'),imghuman);
    %     else
    %         imghuman_path = strcat(path_images_human,'\',fileName,'.fft');
    %         [~, f_file] = File2Feature(fileName, 'Human', ifScaled, featureClass, feature_min, scalingFactors,imghuman_path);
    %     end
    %     if length(f_file)==60
    f_set=[f_set;f_file];
    % f_set_nr=[f_set_nr;[num2cell(f_file{1}),num2cell(f_file{5}),num2cell(f_file{9}),num2cell(f_file{12}),num2cell(f_file{21}),num2cell(f_file{22}),num2cell(f_file{24}),num2cell(f_file{25}),num2cell(f_file{32}),num2cell(f_file{54}),num2cell(f_file{63}),f_file{length(f_file)}]];
    % f_set_r=[f_set_r;[num2cell(f_file{1}),num2cell(f_file{5}),num2cell(f_file{9}),num2cell(f_file{12}),num2cell(f_file{21}),num2cell(f_file{22}),num2cell(f_file{24}),num2cell(f_file{25}),num2cell(f_file{32}),f_file{length(f_file)}]];
    %     end
end

% sprintf('the total num of files is: %d',length(Files))
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% dog
cd(path_data_dog);
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
num_of_dogs = num2str(length(Files));
for i=1:length(Files) % take every file from the set 'Files'
    if mod(i,10)==0
        sprintf('Dog - %dth file is processing\n',i) % Report every 10 files-the i-th file is processing
    end
    %sprintf('Dog - %dth file is processing\n',i)
    fileName=Files{i};
    file_order = [file_order string(fileName)];
    [~, f_file] = File2Feature(fileName, 'Dog', ifScaled, featureClass, feature_min, scalingFactors,[]);
    %     if ifScaled==0
    %         [imgdog, f_file] = File2Feature(fileName, 'Dog', ifScaled, featureClass, feature_min, scalingFactors,[]);
    %         dlmwrite(strcat(path_images_dog,'\',fileName,'.fft'),imgdog);
    %     else
    %         imgdog_path = strcat(path_images_dog,'\',fileName,'.fft');
    %         [~, f_file] = File2Feature(fileName, 'Dog', ifScaled, featureClass, feature_min, scalingFactors,imgdog_path);
    %     end
    %     if length(f_file)==60
    f_set=[f_set;f_file];
    % f_set_nr=[f_set_nr;[num2cell(f_file{1}),num2cell(f_file{5}),num2cell(f_file{9}),num2cell(f_file{12}),num2cell(f_file{21}),num2cell(f_file{22}),num2cell(f_file{24}),num2cell(f_file{25}),num2cell(f_file{32}),num2cell(f_file{54}),num2cell(f_file{63}),f_file{length(f_file)}]];
    % f_set_r=[f_set_r;[num2cell(f_file{1}),num2cell(f_file{5}),num2cell(f_file{9}),num2cell(f_file{12}),num2cell(f_file{21}),num2cell(f_file{22}),num2cell(f_file{24}),num2cell(f_file{25}),num2cell(f_file{32}),f_file{length(f_file)}]];
    %     end
end
% sprintf('the total num of files is: %d',length(Files))
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% noise
% cd(path_data_noise);
% fileFullNames=dir;
% Files={};  % first 2 file is '.' and '..'
% i=1;
% for j=1:length(fileFullNames)
%     s=fileFullNames(j).name;
%     k=strfind(s,'.data');
%     if k>=2
%         Files{i}=s(1:k-1);
%         i=i+1;
%     end
% end
% for i=1:length(Files) % take every file from the set 'Files'
%     sprintf('%dth file is processing\n',i) % the i-th file is processing
%     fileName=Files{i};
%     f_file=File2Feature(fileName, 'Noise', ifScaled);
%     f_set=[f_set;f_file];
% end

% sprintf('the total num of files is: %d',length(Files))
% sprintf('the total num of features is: %d',size(f_set,2)-1)

%Compute feature scaling

if (ifScaled==0)
    format shortg
    feature_max = max(cell2mat(f_set(:,1:size(f_set,2)-1)));
    feature_min = min(cell2mat(f_set(:,1:size(f_set,2)-1)));
    
    scalingFactors = zeros(1,length(feature_max));
    for j=1:length(feature_max)
        if feature_max(j)~=feature_min(j)
            scalingFactors(j) = 1/(feature_max(j)-feature_min(j));
        else
            scalingFactors(j) = 0;
        end
    end
    %save('..\tmp');
end

%load('..\tmp');
% Weka Related
% featureNames is f1 f2 f3 ...., give these name to the n columns of f_set
nColumn=size(f_set,2);
featureNames=cell(1,nColumn);
for i=1:nColumn
    featureNames{i}= sprintf('f%d',i);
end

ifReg=0;
instances=matlab2weka(sprintf('radar%d',OutIndex),featureNames,f_set,nColumn,ifReg);

%% Commented by Dhrubo - f_set_nr and f_set_r not needed
% nColumn=size(f_set_nr,2);
% featureNames=cell(1,nColumn);
% for i=1:nColumn
%     featureNames{i}= sprintf('f%d',i);
% end
% 
% instances_nr=matlab2weka(sprintf('radar%d_nr',OutIndex),featureNames,f_set_nr,nColumn,ifReg);
% 
% nColumn=size(f_set_r,2);
% featureNames=cell(1,nColumn);
% for i=1:nColumn
%     featureNames{i}= sprintf('f%d',i);
% end
% 
% instances_r=matlab2weka(sprintf('radar%d_r',OutIndex),featureNames,f_set_r,nColumn,ifReg);

%% save the wekaOBJ to arff file
cd(path_arff);
file_order_file = sprintf('file_order_radar%d.txt',OutIndex)
fd = fopen(file_order_file,'w');
for i=1:length(file_order)
    fileName = file_order{i};
    fprintf(fd,'%s\n',fileName);
end
fclose(fd);

if ifScaled == 0
    saveARFF(sprintf('radar%d.arff',OutIndex),instances);
%    saveARFF(sprintf('radar%d_nr.arff',OutIndex),instances_nr);
%    saveARFF(sprintf('radar%d_r.arff',OutIndex),instances_r);
else
    saveARFF(sprintf('radar%d_scaled.arff',OutIndex),instances);
%    saveARFF(sprintf('radar%d_scaled_nr.arff',OutIndex),instances_nr);
%    saveARFF(sprintf('radar%d_scaled_r.arff',OutIndex),instances_r);
end

%c=100000;
%gamma=0.1;

% cross validation
% OutIndex=33;

%% Commented by Dhrubo
% totalNumInstances = size(f_set,1); % 52;
% accuracy_max = 0;
% c_max=0;
% gamma_max=0;
% if ifScaled == 1
%     for c=[0.001 0.01 0.1 1 10 100 1000 100000 1000000] %[1 2 3 4 5 6 7 8 9 10 20 30 40 50 60 70 80 90 100]
%         for gamma=[0.001 0.01 0.05 0.1 0.5 1 5 10] %[0.01 0.02 0.03 0.04 0.05 0.06 0.07 0.08 0.09 0.1]
%             [result, confusionmatrix] = Crossval_new(OutIndex,c, gamma);
%             accuracy = (confusionmatrix(1,1) + confusionmatrix(2,2))/totalNumInstances;
%             if (accuracy > accuracy_max)
%                 accuracy_max = accuracy;
%                 c_max = c;
%                 gamma_max =gamma;
%             end
%         end
%     end
%     [result, confusionmatrix] = Crossval_new(OutIndex,c_max, gamma_max); % renew the model txt file
% %     confusionmatrix
% 
%     accuracy_max
%     c_max
%     gamma_max
% end


