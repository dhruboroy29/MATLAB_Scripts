function Freq = FftFreq(N, Rate)

RelFreq = mod((0:N-1)/N + 0.5, 1) - 0.5;
Freq = RelFreq * Rate;