% plot data, spectrogram, histogram, features
% display the data I Q in C# format

function Visualize(fileName,sampRate,FftWindow)

close all;
% figure;

SetEnvironment
SetPath

%% INPUT:
%path_data='C:\Users\he\Documents\Dropbox\MyC#Work\emote4jin\Data Collector 1.2\Data Collector Host 1.2\Data Collector Host\bin\Debug';
% path_data = strcat(g_str_pathbase_data,'\training\ball - 408');
% fileName='1';%


%cd(path_data);

fft_num = num2str(FftWindow);
%path_amp = strcat(string(FftWindow),'_fft/amplitude/');
path_amp = strcat(fft_num,'_fft/amplitude/');
if exist(path_amp, 'dir') ~= 7
    mkdir(path_amp);
    fprintf('INFO: created directory %s\n', path_amp);
end

%path_phase = strcat(string(FftWindow),'_fft/phase/');
path_phase = strcat(fft_num,'_fft/phase/');
if exist(path_phase, 'dir') ~= 7
    mkdir(path_phase);
    fprintf('INFO: created directory %s\n', path_phase);
end

%path_spec = strcat(string(FftWindow),'_fft/spectrogram/');
path_spec = strcat(fft_num,'_fft/spectrogram/');
if exist(path_spec, 'dir') ~= 7
    mkdir(path_spec);
    fprintf('INFO: created directory %s\n', path_spec);
end

%% COMPUTE:
%sampRate = 256;
%sampRate = 250; %for new data -> Neel
%step=64;
frameSeconds=60;

%added by neel
bandwidth = round(sampRate/2);
%FftWindow = 2^nextpow2(round(sampRate/4)) %take as argument to Visualize
%function
NFFT = 2^nextpow2(FftWindow);
%NFFT = 500;
FftStep = round(1/8*FftWindow);
step = FftStep;

ifBackground=1;  % 1 to save background hist,0 not
PLOTFRAMES=0; % 1 if display frames, 0 if display the whole file 
DISPALL=0; % 1 if diplay all the frames, 0 if display a single frame
frameIndex=1;
nFigure=1;
%%%%%%%%%%%%%%%%%%%%%%%%%%% plot
% m=ceil(nFigure^0.5);


if PLOTFRAMES==0
    plotData(fileName,sampRate,frameSeconds,0,0); %300
else % PLOTFRAMES=1
    if DISPALL==1
        nFigure=floor(nSample*2/(2*sampRate*frameSeconds));
        for i=1:nFigure
             m=ceil(nFigure^0.5);
             subplot(m,m,i);
             plotData(fileName,sampRate,frameSeconds,(2*sampRate*frameSeconds)*(i-1),1); 
        end
    else
        plotData(fileName,sampRate,frameSeconds,(2*sampRate*frameSeconds)*(frameIndex-1),1);
    end
end
print('-dbitmap', [path_amp,fileName,'.data.emf']);


if PLOTFRAMES==0
    plotPhase(fileName,sampRate,frameSeconds,0,0); 
else % PLOTFRAMES=1
    if DISPALL==1
        nFigure=floor(nSample*2/(2*sampRate*frameSeconds));
        for i=1:nFigure
             m=ceil(nFigure^0.5);
             subplot(m,m,i);
             plotPhase(fileName,sampRate,frameSeconds,(2*sampRate*frameSeconds)*(i-1),1); 
        end
    else
        plotPhase(fileName,sampRate,frameSeconds,(2*sampRate*frameSeconds)*(frameIndex-1),1);
    end
end
print('-dbitmap', [path_phase,fileName,'.phase.emf']);


if PLOTFRAMES==0
    %plotSpect(fileName, sampRate,sampRate-step,sampRate,sampRate,frameSeconds,0,0);
    plotSpect(fileName, FftWindow,FftWindow-FftStep,NFFT,sampRate,frameSeconds,0,0,bandwidth); %added by neel

%     figure;imagesc(T,F,bw1);colormap(gray);axis xy;

else % PLOTFRAMES=1
    if DISPALL==1
        nFigure=floor(nSample*2/(2*sampRate*frameSeconds));
        for i=1:nFigure
             m=ceil(nFigure^0.5);
             subplot(m,m,i);
             %plotSpect(fileName, sampRate,sampRate-step,sampRate,sampRate,frameSeconds,(2*sampRate*frameSeconds)*(i-1),1); 
             plotSpect(fileName, FftWindow,FftWindow-FftStep,NFFT,sampRate,frameSeconds,(2*sampRate*frameSeconds)*(i-1),1,bandwidth);
        end
    else
        %plotSpect(fileName, sampRate,sampRate-step,sampRate,sampRate,frameSeconds,(2*sampRate*frameSeconds)*(frameIndex-1),1);
        plotSpect(fileName, FftWindow,FftWindow-FftStep,NFFT,sampRate,frameSeconds,(2*sampRate*frameSeconds)*(frameIndex-1),1,bandwidth);
    end
end
print('-dbitmap', [path_spec,fileName,'.spect.emf']);
set(gca,'FontSize',20)
xlabel('Time (s)', 'FontSize', 30);
ylabel('Frequency (Hz)', 'FontSize', 30);
fig = gcf;
fig.PaperPositionMode = 'auto';
fig_pos = fig.PaperPosition;
fig.PaperSize = [fig_pos(3) fig_pos(4)];
print(fig,[path_spec,fileName,'_spect.pdf'],'-dpdf');


