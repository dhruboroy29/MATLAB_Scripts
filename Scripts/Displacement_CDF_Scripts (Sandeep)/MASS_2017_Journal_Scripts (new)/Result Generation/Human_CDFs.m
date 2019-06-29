N=1;
IQRejectionParam=0.9;

% New figure
figure1=figure;

h0=WalkCdfs_Individual_MASS("/mnt/6b93b438-a3d4-40d2-9f3d-d8cdbb850183/Research/Robust_Learning/Data_Repository/IPSNdata/arc_1/Human",'/mnt/6b93b438-a3d4-40d2-9f3d-d8cdbb850183/Research/Robust_Learning/Results/Displacement_Graphs/Walk_CDFs/','PRB',256,0.9,N);
h1=WalkCdfs_Individual_MASS("/mnt/6b93b438-a3d4-40d2-9f3d-d8cdbb850183/Research/Robust_Learning/Data_Repository/IPSNdata/prb_2/Human",'/mnt/6b93b438-a3d4-40d2-9f3d-d8cdbb850183/Research/Robust_Learning/Results/Displacement_Graphs/Walk_CDFs/','PRB',256,0.9,N);
h2=WalkCdfs_Individual_MASS("/mnt/6b93b438-a3d4-40d2-9f3d-d8cdbb850183/Research/Robust_Learning/Data_Repository/Parking garage radial ortho (Sandeep)/SenSys10_data_scripts/data/0-amplitude (walks)/ortho/cut",'/mnt/6b93b438-a3d4-40d2-9f3d-d8cdbb850183/Research/Robust_Learning/Results/Displacement_Graphs/Walk_CDFs/','ortho_7m',256,0.9,N);
h3=WalkCdfs_Individual_MASS("/mnt/6b93b438-a3d4-40d2-9f3d-d8cdbb850183/Research/Robust_Learning/Data_Repository/Parking garage radial ortho (Sandeep)/SenSys10_data_scripts/data/0-amplitude (walks)/radial/runs/cut",'/mnt/6b93b438-a3d4-40d2-9f3d-d8cdbb850183/Research/Robust_Learning/Results/Displacement_Graphs/Walk_CDFs/','radial_7m',256,0.9,N);
%h4=WalkCdfs_Individual_MASS('/mnt/6b93b438-a3d4-40d2-9f3d-d8cdbb850183/Research/Robust_Learning/Data_Repository/Darree_Fields/cut','/mnt/6b93b438-a3d4-40d2-9f3d-d8cdbb850183/Research/Robust_Learning/Results/Displacement_Graphs/Walk_CDFs/','Darree_fields',250,0.9,N);

%% 1/2-second window thresholds
yL = get(gca,'YLim');
line([0.33 0.33],yL,'Color', 'k');
line([0.35 0.35],yL,'Color', 'k', 'LineStyle', '--');

% Create textbox
annotation(figure1,'textbox',...
    [0.314129072681706 0.818942694909706 0.162500002904046 0.0642857150983689],...
    'String',{'1 FA/week','(IQR=0.9)'},...
    'LineStyle','none',...
    'FitBoxToText','off');
    %'Interpreter','latex',...

% Create arrow
annotation(figure1,'arrow',[0.4515664160401 0.491228070175439],...
    [0.83172800645682 0.782082324455206]);

% Create arrow
annotation(figure1,'arrow',[0.596961152882206 0.525031328320803],...
    [0.62575544794189 0.663075060532689]);

% Create textbox
annotation(figure1,'textbox',...
    [0.601127819548874 0.593510895071126 0.17678571747658 0.064285715098369],...
    'String',{'1 FA/month','(IQR=0.9)'},...
    'LineStyle','none',...
    'FitBoxToText','off');
    %'Interpreter','latex',...

% Create line
annotation(figure1,'line',[0.496491228070175 0.129824561403509],...
    [0.360774818401937 0.360774818401937], 'Color', 'r');

% Create line
annotation(figure1,'line',[0.515789473684211 0.124561403508772],...
    [0.276029055690073 0.276029055690073],'LineStyle','--', 'Color', 'r');

%%
h=gca;
h.XLabel.String = 'Distance (meters)';
h.YLabel.String = 'CCDF';
%h.XLabel.Interpreter='latex';
%h.YLabel.Interpreter='latex';
legend([h0 h1 h2 h3],{'Gymnasium','Building foyer','Garage (orthogonal)','Garage (radial)','Forest'});%,'interpreter','latex');
%title(sprintf('Human CDFs for\n%d 1/2-second Windows(IQR Parameter=%0.2f)',N,IQRejectionParam),'FontWeight','normal');
xlim([0 0.7]);

saveas(h,strcat('/mnt/6b93b438-a3d4-40d2-9f3d-d8cdbb850183/Research/Robust_Learning/Results/Displacement_Graphs/Graphs/Human_CDFs_N=',num2str(N),'_IQR=',num2str(IQRejectionParam),'.fig'));
saveas(h,strcat('/mnt/6b93b438-a3d4-40d2-9f3d-d8cdbb850183/Research/Robust_Learning/Results/Displacement_Graphs/Graphs/Human_CDFs_N=',num2str(N),'_IQR=',num2str(IQRejectionParam),'.eps'),'eps2c');
