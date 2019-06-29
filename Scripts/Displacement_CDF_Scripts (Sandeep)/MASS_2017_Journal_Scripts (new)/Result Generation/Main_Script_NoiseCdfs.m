close all
% Set default font size
set(0,'defaultAxesFontSize',20);

IQRejectionParam = 0.9;
N = 1;

out_cornfield = ComputeNoiseCDFs_MASS('/mnt/6b93b438-a3d4-40d2-9f3d-d8cdbb850183/Research/Robust_Learning/Data_Repository/Parking garage radial ortho (Sandeep)/SenSys10_data_scripts/data/1-CornField-Snow/snow-no-targets.data', ...
    '/mnt/6b93b438-a3d4-40d2-9f3d-d8cdbb850183/Research/Robust_Learning/Results/Displacement_Graphs/Noise_CDFs/','snow-no-targets', 256, 0.5, IQRejectionParam,N);
out_garage = ComputeNoiseCDFs_MASS('/mnt/6b93b438-a3d4-40d2-9f3d-d8cdbb850183/Research/Robust_Learning/Data_Repository/Parking garage radial ortho (Sandeep)/SenSys10_data_scripts/data/4-OSU-Garage/r46-garage.data', ...
    '/mnt/6b93b438-a3d4-40d2-9f3d-d8cdbb850183/Research/Robust_Learning/Results/Displacement_Graphs/Noise_CDFs/', 'r46-garage', 256, 0.5, IQRejectionParam,N);
out_trees = ComputeNoiseCDFs_MASS('/mnt/6b93b438-a3d4-40d2-9f3d-d8cdbb850183/Research/Robust_Learning/Data_Repository/Parking garage radial ortho (Sandeep)/SenSys10_data_scripts/data/3-AveryPark-2trees/r46-2trees-3m.data', ...
    '/mnt/6b93b438-a3d4-40d2-9f3d-d8cdbb850183/Research/Robust_Learning/Results/Displacement_Graphs/Noise_CDFs/', 'r46-2trees-3m', 256, 0.5, IQRejectionParam,N);
out_bushes = ComputeNoiseCDFs_MASS('/mnt/6b93b438-a3d4-40d2-9f3d-d8cdbb850183/Research/Robust_Learning/Data_Repository/Parking garage radial ortho (Sandeep)/SenSys10_data_scripts/data/2-CoffmanPark-Tree/Coffman-tree-2m.data', ...
    '/mnt/6b93b438-a3d4-40d2-9f3d-d8cdbb850183/Research/Robust_Learning/Results/Displacement_Graphs/Noise_CDFs/', 'Coffman-tree-2m', 256, 0.5, IQRejectionParam,N);
out_grass = ComputeNoiseCDFs_MASS('/mnt/6b93b438-a3d4-40d2-9f3d-d8cdbb850183/Research/Robust_Learning/Data_Repository/Nathan_grass_outside_Samraksh/wednesday_noise.bbs', ...
    '/mnt/6b93b438-a3d4-40d2-9f3d-d8cdbb850183/Research/Robust_Learning/Results/Displacement_Graphs/Noise_CDFs/', 'Chris-indoors-WLN', 256, 0.5, IQRejectionParam,N);
%out_indoors = ComputeNoiseCDFs_MASS('/mnt/6b93b438-a3d4-40d2-9f3d-d8cdbb850183/Research/Robust_Learning/Data_Repository/wln data/30670 indoor 2.bbs', ...
%    '/mnt/6b93b438-a3d4-40d2-9f3d-d8cdbb850183/Research/Robust_Learning/Results/Displacement_Graphs/Noise_CDFs/', 'Chris-indoors-WLN', 256, 0.5, IQRejectionParam,N);

h1=PlotCdfs_MASS(out_cornfield,'-');
h2=PlotCdfs_MASS(out_garage,'-');
h3=PlotCdfs_MASS(out_trees,'-');
h4=PlotCdfs_MASS(out_bushes,'-');
h5=PlotCdfs_MASS(out_grass,'-');
%h6=PlotCdfs_MASS(out_indoors,'-');

%% 3-second window thresholds
% fplot(@(x) -12.25,[0 0.5],'-k') % 1 false alarm per week
% fplot(@(x) -13.75,[0 0.5],'-k') % 1 false alarm per month
% fplot(@(x) -16.25,[0 0.5],'-k') % 1 false alarm per year

%% 3 1/2-second window thresholds
fplot(@(x) -12.9,[0 1],'-k'); % 1 false alarm per week
fplot(@(x) -14.37,[0 1],'--k'); % 1 false alarm per month
% fplot(@(x) -16.86,[0 1],':k'); % 1 false alarm per year

annotation('textbox',...
    [0.753571428571429 0.339523808711155 0.162500002904046 0.0642857150983691],...
    'String','1 FA/week',...
    'LineStyle','none');%,'Interpreter','latex');
annotation('textbox',...
    [0.751785714285714 0.235238094425441 0.17678571747658 0.0642857150983691],...
    'String','1 FA/month',...
    'LineStyle','none');%,'Interpreter','latex');
%annotation('textbox',...
%    [0.753571428571429 0.133333332520679 0.153571431296212 0.0642857150983691],...
%    'String','1 FA/year',...
%    'LineStyle','none','Interpreter','latex');

h = gca;
%l=cell(1,8);
%l{1}='Empty Mowed Field'; l{2}='Parking Garage'; l{3}='Trees (High Wind)'; l{4}='Bushes (light Wind)';
%legend(l,'interpreter','latex','Location','NorthEast');
legend([h1 h2 h3 h4 h5],{'Empty Mowed Field','Parking Garage','Trees (High Wind)','Bushes (light Wind)', 'Grass'});%,'interpreter','latex');
%legend([h1 h2 h3 h4],{'Empty Mowed Field','Parking Garage','Trees (High Wind)','Bushes (light Wind)'});
xlim([0 0.7]);

%h.TickLabelInterpreter='latex';
%h.FontWeight = 'bold';
%h.FontSize = 20;
h.XLabel.String = 'Distance (meters)';
%h.XLabel.Interpreter='latex';
%h.XLabel.FontSize = 30;
%h.XLabel.FontWeight = 'bold';

h.YLabel.String = 'log(False Alarm Probability)';
%h.YLabel.Interpreter='latex';
%h.YLabel.FontSize = 30;
%h.YLabel.FontWeight = 'bold';
%title(sprintf('Noise CDFs and Thresholds for\n%d 1/2-second Windows(IQR Parameter=%0.2f)',N,IQRejectionParam),'FontWeight','normal');

saveas(h,strcat('/mnt/6b93b438-a3d4-40d2-9f3d-d8cdbb850183/Research/Robust_Learning/Results/Displacement_Graphs/Graphs/NoiseCDFs_N=',num2str(N),'_IQR=',num2str(IQRejectionParam),'.fig'));
saveas(h,strcat('/mnt/6b93b438-a3d4-40d2-9f3d-d8cdbb850183/Research/Robust_Learning/Results/Displacement_Graphs/Graphs/NoiseCDFs_N=',num2str(N),'_IQR=',num2str(IQRejectionParam),'.eps'),'eps2c');