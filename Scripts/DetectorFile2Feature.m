function DetectorFile2Feature(cut_folders,class_labels,OutIndex,window,stride)

SetEnvironment
SetPath

path_arff=strcat(g_str_pathbase_radar,'/IIITDemo/Arff/',getenv('USERNAME'));

if(size(cut_folders,2) ~= size(class_labels,2))
    fprintf('Error : Length of array cut_folders (%d) is not equal to length of class_labels (%d)\n',size(cut_folders,2),size(class_labels,2));
    return;
end

f_set = [];
for y = 1:size(cut_folders,2)
    y;
    cell2mat(class_labels(y));
    cd(cell2mat(cut_folders(y)));
    fileFullNames=dir; %get all files in current folder
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
    
    
    for i=1:length(Files) % take every file from the set 'Files'
        f = [];
        if mod(i,40)==0
            sprintf('%dth file is processing out of %d\n',i,length(Files)) % Report every 10 files-the i-th file is processing
        end
        %sprintf('Human - %dth file is processing\n',i)
        fileName=Files{i};
        %[~, f_file] = File2Feature(fileName, 'Human', ifScaled, featureClass, feature_min, scalingFactors,[]);
        [f] = computeDetectorFeatures(fileName);
        f = [f class_labels(y)];
        f_set = [f_set;f];
    end
end  
f_set;


%feature scaling
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
f_set_temp = cell2mat(f_set(:,1:size(f_set,2)-1));
f_set_scaled = zeros(size(f_set,1),size(f_set,2));
%for each column
for i = 1:size(f_set,2)-1
    f_set_scaled(:,i) = (f_set_temp(:,i)-feature_min(i))*scalingFactors(i);
end

f_set_scaled = num2cell(f_set_scaled);

%add class label to scaled features
for i = 1:size(f_set_scaled,1)
    f_set_scaled(i,size(f_set_scaled,2)) = f_set(i,size(f_set,2));
end

f_set_scaled;




%standardization
f_set_scaled_temp = cell2mat(f_set_scaled(:,1:size(f_set_scaled,2)-1));
f_set_scaled_std = zeros(size(f_set_scaled,1),size(f_set_scaled,2));
feature_mean = mean(cell2mat(f_set_scaled(:,1:size(f_set_scaled,2)-1)));
feature_std = std(cell2mat(f_set_scaled(:,1:size(f_set_scaled,2)-1)));
%for each column
for i = 1:size(f_set_scaled,2)-1
    f_set_scaled_std(:,i) = (f_set_scaled_temp(:,i)-feature_mean(i))/feature_std(i);
end
f_set_scaled_std;
f_set_scaled_std(f_set_scaled_std < 0.00001) = 1;

f_set_scaled_std = num2cell(f_set_scaled_std);

%add class label to scaled features
for i = 1:size(f_set_scaled_std,1)
    f_set_scaled_std(i,size(f_set_scaled_std,2)) = f_set_scaled(i,size(f_set_scaled,2));
end

f_set_scaled_std;

% Weka Related
% featureNames is f1 f2 f3 ...., give these name to the n columns of f_set
nColumn=size(f_set,2);
featureNames=cell(1,nColumn);
for i=1:nColumn
    featureNames{i}= sprintf('f%d',i);
end
featureNames;


%create weka instances from features and save instances as arff file
ifReg=0;
cur_datetime = string(datetime);
instances = matlab2weka(sprintf('detector_%d_features_%d',OutIndex,nColumn-1),featureNames,f_set,nColumn,ifReg);
instances_scaled = matlab2weka(sprintf('detector_%d_features_scaled_%d',OutIndex,nColumn-1),featureNames,f_set_scaled,nColumn,ifReg);
instances_scaled_std = matlab2weka(sprintf('detector_%d_features_scaled_%d_std',OutIndex,nColumn-1),featureNames,f_set_scaled_std,nColumn,ifReg);

%save features/instances to arff file
cd(path_arff);
if exist(path_arff, 'dir') ~= 7
    mkdir(path_arff);
    fprintf('INFO: created directory %s\n', path_arff);
end

saveARFF(sprintf('detector_%d_%d_features_%d_instances_window_%d_stride_%d.arff',OutIndex,nColumn-1,size(f_set,1),window,stride),instances);
saveARFF(sprintf('detector_%d_%d_features_%d_instances_window_%d_stride_%d_scaled.arff',OutIndex,nColumn-1,size(f_set,1),window,stride),instances_scaled);
saveARFF(sprintf('detector_%d_%d_features_%d_instances_window_%d_stride_%d_scaled_std.arff',OutIndex,nColumn-1,size(f_set,1),window,stride),instances_scaled_std);

end