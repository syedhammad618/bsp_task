close all;
clear all;
clc;

% ============= Activity 1 ============= $
N = 1024;                                % Number of data points 
fs = 1000;          	                 % The sample frequency of data is 1 kHz.
freq = (0:N-1)*fs/(N-1);                 % Frequency vector for plotting

t = [1:N]/fs;
x = sin(2*pi*t*5)+ cos(2*pi*t*6)+ 0.8*rand(1,N);
% [x,t] = sig_noise (250,-14,N);
Xf = fft(x);		                     
Mf = abs(Xf).^2; 
figure(1)  
plot(freq,10*log10(Mf),'k');                      
hold on; 

xlim([0 500])
title('Spectrum','FontSize',14);
xlabel('Frequency (Hz)','FontSize',14); 
ylabel('Magnitude','FontSize',14);

[pyy1,f1]=pwelch(x ,[],[],4096,fs);
figure(2)
plot(f1,10*log10(pyy1));

% =============== Activity 2 ============== %
% load ecg1.dat;
% fs=200;
% N=length(ecg1);
% t=(1:N)/fs;
% figure(1);
% plot(t,ecg1);
% xlabel('Time');
% ylabel('ECG');

% Xf=fft(ecg1);
% Mag=abs(Xf);
% PSD=Mag.^2;
% F=(1:N)*fs/N;
% figure(2);
% plot(F,PSD);
% xlabel('Frequency');
% ylabel('PSD');
% title('PSD of UNfiltered ECG');

% [b,a]=butter(5,[55/100  65/100],'stop');
% fil_ecg=filter(b,a,ecg1);
% XF1=fft(fil_ecg);
% Mag1=abs(XF1);
% PSD2=Mag1.^2;
% Freq=(1:N)*fs/N;
% figure(3);
% plot(Freq, PSD2);
% xlabel('Frequency');
% ylabel('PSD');
% title('PSD of Filtered ECG');
% figure(4);
% plot(t,fil_ecg);
