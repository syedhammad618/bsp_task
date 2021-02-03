clear all;
close all;
clc;

% ======== task 1 =========== 


% Generate sum of two signals of equal magnitude in MATLAB. The frequency of signals should be 30 Hz and 50 Hz. The sampling frequency should be 1000Hz. Plot each of the signal and the resultant sum. Then compute the power spectrum of the sum of signal using above steps. Attach the plots and write your observation.

f1 = 30;
f2 = 50;
fs = 1000;
N = 200;
t = [0:N-1]/fs;

sig1 = sin(2*pi*f1*t);
sig2 = sin(2*pi*f2*t);

figure(1)
subplot(2,1,1);
plot(t, sig1);
title("30 Hz Sine wave")
xlabel("Time");
ylabel("Amplitude");
subplot(2,1,2);
plot(t, sig2);
title("50 Hz Sine wave")
xlabel("Time");
ylabel("Amplitude");

summed_sig = sig1 + sig2;
figure(2);
subplot(2,1,1);
plot(t,summed_sig);
title("Summed Sine wave (30Hz + 50) Hz");
xlabel("Time");
ylabel("Amplitude");
hold on

freq = fft(summed_sig);
freq_pwr = abs(freq(1:N/2)).^2;
freq_pwr_normalized = freq_pwr/max(freq_pwr);
freq_db = log10(freq_pwr_normalized)*10;
freq_scale = (1:N/2)*fs/N;
subplot(2,1,2);
plot(freq_scale,freq_db);
title("Normalized frequency spectrum of summed signal");
xlabel("Frequency");
ylabel("dB");


% ======== task 2 =========== 

% % pre med recording
% xi_pre = ceil(t_pre(1):fs:floor(t_pre(end))); % evenly spaced vector of desired datapoints
% % resampling using interp1
% yi_pre = interp1(t_pre,hr_pre, xi_pre); % linear interpolation (using evenly spaced vectors), t_pre and hr_pre used for interpolation, and xi_pre = desired data points.
% YI_pre = yi_pre - mean(yi_pre); % heart rate - avg_HR
% Y_freq_pre = fft(YI_pre); % step 1 for PSD
% Y_mag_pre = abs(Y_freq_pre);
% PSD_pre = (Y_mag_pre.^2); % step 2 for PSD
% N_pre = length(PSD_pre); % used for plotting
% freq_pre = (1:N_pre)*fs/N_pre;
% figure(1);
% plot(freq_pre, PSD_pre);
% title("Heart Rate PSD pre state")
% xlabel("Frequency");
% ylabel("PSD");

% % post med recording
% xi_med = ceil(t_med(1):fs:floor(t_med(end))); % evenly spaced vector of desired datapoints
% yi_med = interp1(t_med,hr_med, xi_med); % linear interpolation (using evenly spaced vectors), t_pre and % hr_pre used for interpolation, and xi_pre = desired data points.
% YI_med = yi_med - mean(yi_med); % heart rate - avg_HR
% Y_freq_med = fft(YI_med); % step 1 for PSD
% Y_mag_med = abs(Y_freq_med);
% PSD_med = (Y_mag_med.^2); % step 2 for PSD
% N_med = length(PSD_med); % used for plotting
% freq_med = (1:N_med)*fs/N_med;
% figure(2);
% plot(freq_med, PSD_med);
% title("Heart Rate PSD med state")
% xlabel("Frequency");
% ylabel("PSD");



