clear all;
close all;
clc;

% ============== Activity 1 ========== %
% fs = 2000;
% n = 8; % order of filter
% wn = 200*2/fs; % normalized cutoff freq (200)
% rp = 3; % passband ripples
% rs = 60; % stopband ripples

% % butterworth filter has no ripple in pass/stop band
% [b, a] = butter(n,wn, "low"); % 2nd stage IIR filter: Since we know n, wn
% % b and a are coef of filter

% [H, f1] = freqz(b, a, 512, fs); % freq response of filter, 
% % no. of points in output spectrum  = 512

% H = 20*log10(abs(H)); % plot freq response ROR
% subplot(221);
% plot(f1,H, "k");
% ylim([-80 0]);
% title("Butterworth filter response");

% % chebyshev type 1 filter has ripple in passband
% [b,a] = cheby1(n,rp,wn);
% [H, f2] = freqz(b,a,512, fs);
% H = 20*log10(abs(H));
% subplot(222);
% plot(f2, H,"k");
% title("Chebyshev type 1 filter response");
% ylim([-80 0]);

% % chebyshev type 2 filter has ripples in stopband
% % also called equiripple filter
% [b,a] = cheby2(n,rs,wn);
% [H, f3] = freqz(b,a,512, fs);
% H = 20*log10(abs(H));
% subplot(223);
% plot(f3, H,"k");
% title("Chebyshev type 2 filter response");
% ylim([-80 0]);

% % Elliptic filter has ripples in both pass and stopband
% % fastest ROR (transition from pass to stop band)
% [b,a] = ellip(n,rp, rs,wn);
% [H, f4] = freqz(b,a,512, fs);
% H = 20*log10(abs(H));
% subplot(224);
% plot(f4, H,"k");
% title("Elliptic filter response");
% ylim([-80 0]);


% ============== Activity 2 ========== %
load ecg.dat;

fs = 200;
n = 8;
wp = 58*2/fs;
wn = 62*2/fs;

[b,a] = butter(n, [wp, wn],'stop'); % notch filter for 60Hz noise
[H, f1] = freqz(b,a,512, fs);
H = 20*log10(abs(H));
figure(1);
plot(f1,H, "k");
ylim([-80 0]);
ylabel("dB")
xlabel("Frequency")
title("Butterworth Notch filter response");

ecg_freq = abs(fft(ecg));
ecg_PSD = ecg_freq.^2;
ecg_filtered = filter(b,a,ecg);
ecg_filtered_PSD = abs(fft(ecg_filtered)).^2;

freq_scale = [1:length(ecg_filtered)]*200./length(ecg_filtered);

figure(2);
subplot(211);
plot(freq_scale, ecg_PSD);
xlabel("Frequency")
title("ECG frequency response");
subplot(212);
plot(freq_scale, ecg_filtered_PSD);
xlabel("Frequency")
title("Filtered ECG frequency response");

% ========== Post Lab tasks ========== 
% fs = 2000;
% n = 8; % order of filter
% wn = 200*2/fs; % normalized cutoff freq (200)
% rp = 3; % passband ripples
% rs = 60; % stopband ripples

% [b,a] = ellip(n,rp, rs,wn);
% [H, f4] = freqz(b,a,512, fs);
% H = 20*log10(abs(H));
% figure(1);
% subplot(211);
% plot(f4, H,"k");
% title("Elliptic filter response");
% ylim([-80 0]);

% [b, a] = butter(n,wn, "low"); % 2nd stage IIR filter: Since we know n, wn
% [H, f1] = freqz(b, a, 512, fs); % freq response of filter, 
% H = 20*log10(abs(H)); % plot freq response ROR
% subplot(212);
% plot(f1,H, "k");
% ylim([-80 0]);
% title("Butterworth filter response");
