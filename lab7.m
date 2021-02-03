clear all;
close all;
clc;

% =============== Task 1 =========== %
 
% N = 1024; % no. of data points 
% f = 50;
% fs = 1000;
% t = [0:N-1]/fs;
% x = sin(2*pi*t*f) + rand(size(t));
% % [x,t] = sig_noise(250, -14, N); % this file is not available; add 250 db noise to a data of length N, the SNR = -14

% figure(1);
% plot(t,x);
% title("Noisy signal in time domain");
% xlabel("Time");
% ylabel("Amplitude");

% Xf = fft(x); % transform to freq domain
% mag = abs(Xf);
% f = (1:N)*fs/N;
% figure(2);
% plot(f,mag);
% title("Noisy signal in Frequency domain");
% xlabel("Frequency (Hz)");
% ylabel("Amplitude");

% =============== Task 2 =========== %

load("ecg.dat");
fs = 200;
N = length(ecg);
ts = 1/fs; % sampling interval
t = 0:ts:(N/fs)-ts;

figure(1);
plot(t, ecg);
title("ECG signal in time domain");
xlabel("Time");
ylabel("Amplitude");

Xf = fft(ecg);
mag = abs(Xf);
freq = (1:N)*fs/N;
figure(2);
plot(freq, mag);
title("ECG signal in Frequency domain");
xlabel("Frequency (Hz)");
ylabel("Amplitude");
