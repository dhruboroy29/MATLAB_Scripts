function handle=WalkCdfs_Individual_MASS(inDir,outPath,outName,SampRate,IQRejectionParam,N)
cd(inDir);
fileFullNames=dir('*.data');
UnRots=[];
for j=1:length(fileFullNames)
    CompTrim=ReadRadar(fileFullNames(j).name);
    
    % Do Drift
    NTrim = length(CompTrim);
    if SampRate > 250
        N = length(CompTrim);
        TimeOrigSamp = [0 : N-1] / SampRate;
        TimeReSamp = [0 : 1/250 : NTrim/SampRate];
        CompReSamp = interp1(TimeOrigSamp,CompTrim, TimeReSamp);
    else
        TimeReSamp = [0 : NTrim - 1]' / SampRate;
        CompReSamp = CompTrim;
    end
    
    UnRots = [UnRots, (UnWrap(angle(CompReSamp)/2/pi, -0.5, 0.5))'];
end

[cumData,~]=NoiseCdf_MASS(UnRots,outPath,outName,250,0.5,IQRejectionParam,N);

Data=cumData;
BumbleBee;
Data = Data * lambda/2;
%Data=abs(diff(Data)); %Is this necessary?
N = length(Data);

I = [1:N] / N;
I(N) = (N-1)/N;

Data = sort(Data);
handle=plot(Data,(1-I));
hold on