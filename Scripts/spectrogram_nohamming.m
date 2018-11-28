function [s,s_shift] = spectrogram_nohamming(X,WINDOW,NOVERLAP,NFFT,Fs)
 %length of cut in number of samples
%{
size(X);
X = padSignalWithZeros(X,WINDOW,NOVERLAP,NFFT,Fs);
size(X);
%}
nx = length(X);
ncol = fix((nx-NOVERLAP)/(WINDOW-NOVERLAP));
ncol;
NOVERLAP;
WINDOW;
colindex = 1 + (0:(ncol-1))*(WINDOW-NOVERLAP);
rowindex = (1:WINDOW)';
xin = zeros(WINDOW,ncol);
xin(:) = X(rowindex(:,ones(1,ncol))+colindex(ones(WINDOW,1),:)-1);
%rowindex(:,ones(1,ncol))+colindex(ones(WINDOW,1),:)-1
%size(xin)
%% no hamming !!
% win=hamming(nwind);
% win(:,ones(1,ncol));
% xin = win(:,ones(1,ncol)).*xin;

% tmp1 = xin(:,1);
% GenerateArrInCsharp(tmp1,'fftinput')

%debug
% a=xin(:,1)

%se = fft(xin,NFFT);
%s_shift = fftshift(se,1);

%use mote fft
se = fftemote(xin,NFFT); % need to connect eMote with TinyCLR that has DynamicTestRunner, change COM port number in DynamicTestRunner_ConnectEmote.m, add DynamicTestRunner folder to MATLAB path. - Mike, 2015-09-29
s_shift=NaN; % No need to shift; not using it


size(se);
% se = fftemote(xin,NFFT); % need to connect eMote with TinyCLR that has DynamicTestRunner, change COM port number in DynamicTestRunner_ConnectEmote.m, add DynamicTestRunner folder to MATLAB path. - Mike, 2015-09-29

s = se;

%  b=s(:,1);
% c=(abs(b)).^2/256/256;
% c=c';
% % plot(c);

% plot one column in spectrogram
% input = xin(:,174*4); %174*4
% output = s(:,174*4);
% figure;plot(1:256,10*log10(((abs(output).^2)./25238)));
% figure;plot(1:256,abs(output/256).^2);






% tmp2 =s(:,1);
% GenerateArrInCsharp(tmp2,'fftonput')