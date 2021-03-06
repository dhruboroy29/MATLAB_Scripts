function OutDataFile=ComputeNoiseCDFs_MASS(inFile, outPath, outName, SampRate, deltaT, IQRejectionParam,N)
Comp = ReadRadar(inFile);
UnRots=GetRawUnrots(Comp,SampRate,IQRejectionParam);
[~,OutDataFile]=NoiseCdf_MASS(UnRots, outPath, outName, SampRate, deltaT, IQRejectionParam,N);