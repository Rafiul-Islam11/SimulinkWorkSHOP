clearvars; clc;

%% IMPORT SOUND
[fileN, pathN] = uigetfile('*');
filePath = convertCharsToStrings(pathN) + convertCharsToStrings(fileN);
[inSound, inFs] = audioread(filePath);


%% FILTER DATA
outSound = filter(lowPassF, inSound);


%% OUTPUT SIGNAL
audiowrite('out1.wav', outSound, inFs);


%% Clear tmp variables
clear fileN pathN filePath


%% DISPLAY | Time Domain
figure
subplot(211)
plot(inSound)
title("INPUT | Time Domain");
xlabel("Fre (Hz)");
ylabel("Amplitude");

subplot(212)
plot(outSound)
title("OUTPUT | Time Domain");
xlabel("Fre (Hz)");
ylabel("Amplitude");


%% FUNCTIONS
function Hd = lowPassF
    % All frequency values are in Hz.
    Fs = 44100;  % Sampling Frequency

    N  = 100;   % Order
    Fc = 300;  % Cutoff Frequency

    % Construct an FDESIGN object and call its BUTTER method.
    h  = fdesign.lowpass('N,F3dB', N, Fc, Fs);
    Hd = design(h, 'butter');
end