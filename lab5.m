clear all;
close all;
clc;

% TASK 1

% N=500; % no of data points
% T = 1; % time period of signals
% fs= N/T; % sampling freq
% t = [0:N-1]/fs; % Time vector

% x=sin(2*pi*t); % 1 Hz sine wave
% y=cos(2*pi*t); % 1 Hz cosine wave 
% z = square(2*pi*t); % 1 Hz square wave 

% % plotting all 3 signals
% figure(1);
% plot(t,x);
% hold on;
% plot(t,y);
% plot(t,z);
% title("1 Hz Sine, Cosine and Square signals")
% xlabel("Time");
% ylabel("Amplitude");
% legend(["Sin", "Cos", "Square"])
% hold off;

% % Calcuate corr among all signals
% D = zeros(N,3); % matrix having all signals
% D(:,1) = x; % signals in columns
% D(:,2) = y;
% D(:,3) = z;

% r = corrcoef(D); % corr using this func
% disp(r)


% ============================ Task 2 =================

% load eeg_data;
% N = length(eeg);
% fs = 50; 
% t = [0:N-1]/fs;

% figure(1);
% plot(t,eeg);
% title("EEG signal");
% xlabel("Time");
% ylabel("Amplitude");

% % create a set of sin waves (1 to 25 Hz)
% for i = 1:25
%     f(i) = i; % used for plotting
%     x = sin(2*pi*i*t);
%     rxy = xcorr(x, eeg,"coeff");
%     rmax(i) = max(rxy); % max corr with current sine wave
% end

% figure(2);
% stem(f,rmax); % plot max corr with each sin wave
% title("Max corr with Sine waves");
% xlabel("Frequency (Hz)")
% ylabel("Corr coef");


% ===================== Post lab task ============ 

load Subject00_1_edfm

D = zeros(2,5000);
val = val';
D = val(:, 1:3); % correlation between 3 EEG leads
r = corrcoef(D); % corr using this func
disp(r)
