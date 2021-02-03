close all;
clear all;
clc;

f1 = 10;
f2 = 15;
fs = 1000;
t = 0:1/fs:3;
sig1 = cos(2*pi*f1*t);
sig2 = cos(2*pi*f2*t);
sig_summed = sig1 + sig2;

% figure(1);
% subplot(311);
% plot(t, sig1);
% xlabel("Time");
% ylabel("Amplitude");
% title("10 Hz cosine wave");

% subplot(312);
% plot(t, sig2);
% xlabel("Time");
% ylabel("Amplitude");
% title("15 Hz cosine wave");

% subplot(313);
% plot(t, sig_summed);
% xlabel("Time");
% ylabel("Amplitude");
% title("Sum of cosine wave (10Hz + 15Hz)");

% create window
N = 250;
rect_win = rectwin(N);
rect_win = ([zeros(1,25), rect_win', zeros(1,25)]); % zeros padding (outside window)

hann_win = hann(N);
hann_win = ([zeros(1,25), hann_win', zeros(1,25)]);

% figure(2);
% plot(hann_win, "r");
% hold on;
% plot(rect_win, "g");
% legend(["Hanning Window", "Rectangular Window"]);

% freq domain
hann_fft = fftshift(fft(hann_win)); % fftshift shifts scale to -fs/2 to fs/2
rect_fft = fftshift(fft(rect_win));

freq = (-150:150-1)*fs/300; % samples =  25 + 250 + 25 = 300
hann_ss = 10*log10(abs(hann_fft));
rect_ss = 10*log10(abs(rect_fft));

% figure(3);
% plot(freq, hann_ss,"b");
% hold on;
% plot(freq, rect_ss, "r");
% legend(["FFT of hanning window", "FFT of rectangular window"])
% xlabel("Frequency");
% ylabel("Amplitude");


% % lets apply window
% % apply rect window of size 2000
% M = 2001; % window size
% Rect_win = rectwin(M);
% signal_rect = sig_summed(1:M).*Rect_win'; % dot product
% figure(4);
% plot(signal_rect);
% title("windowed function");
% xlabel("Time");
% ylabel("Amplitude");
% fft1_mag = abs(fft(signal_rect));
% ps1 = (fft1_mag).^2;
% freq_axis = (1:M)*fs/M;
% figure(5);
% plot(freq_axis, 10*log10(ps1));
% title("Power spectrum of Rectangular windowed function with N = 2000");
% xlabel("Frequency");
% ylabel("db");
% xlim([0 100]);


% % apply hamm window of size 2000
% M = 2001; % window size
% hamm_win = hamming(M);
% signal_hamm = sig_summed(1:M).*hamm_win'; % dot product
% figure(6);
% plot(signal_hamm);
% title("windowed function");
% xlabel("Time");
% ylabel("Amplitude");
% fft1_mag = abs(fft(signal_hamm));
% ps1 = (fft1_mag).^2;
% freq_axis = (1:M)*fs/M;
% figure(7);
% plot(freq_axis, 10*log10(ps1));
% title("Power spectrum of Hamming windowed function with N = 2000");
% xlabel("Frequency");
% ylabel("db");
% xlim([0 100]);


% % apply rect window of size 3000
% M = 3000; % window size
% Rect_win = rectwin(M);
% signal_rect = sig_summed(1:M).*Rect_win'; % dot product
% figure(8);
% plot(signal_rect);
% title("windowed function");
% xlabel("Time");
% ylabel("Amplitude");
% fft1_mag = abs(fft(signal_rect));
% ps1 = (fft1_mag).^2;
% freq_axis = (1:M)*fs/M;
% figure(9);
% plot(freq_axis, 10*log10(ps1));
% title("Power spectrum of Rectangular windowed function with N = 2000");
% xlabel("Frequency");
% ylabel("db");
% xlim([0 100]);


% % apply hamm window of size 3000
% M = 3000; % window size
% hamm_win = hamming(M);
% signal_hamm = sig_summed(1:M).*hamm_win'; % dot product
% figure(10);
% plot(signal_hamm);
% title("windowed function");
% xlabel("Time");
% ylabel("Amplitude");
% fft1_mag = abs(fft(signal_hamm));
% ps1 = (fft1_mag).^2;
% freq_axis = (1:M)*fs/M;
% figure(11);
% plot(freq_axis, 10*log10(ps1));
% title("Power spectrum of Hamming windowed function with N = 2000");
% xlabel("Frequency");
% ylabel("db");
% xlim([0 100]);


% ================== PLT ========== 

load ecg.dat

t = 0:length(ecg)-1;
figure(1);
plot(t, ecg);
xlabel("Samples");
ylabel("Amplitude");
title("ECG waveform");

M = 200; % window size
hamm_win = hamming(M);
ecg_hamm = ecg(1:M).*hamm_win'; % dot product
figure(2);
plot(ecg_hamm);
title("Hamming window applied on ECG");
xlabel("Time");
ylabel("Amplitude");

M = 200; % window size
rect_win = rectwin(M);
ecg_rect = ecg(1:M).*rect_win'; % dot product
figure(3);
plot(ecg_rect);
title("Rectangular window applied on ECG");
xlabel("Time");
ylabel("Amplitude");