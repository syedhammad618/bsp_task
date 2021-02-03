clear all;
close all;
clc;

% load Hr_pre; %Load normal HR data 
% [c,lags] = xcov(hr_pre,'coeff');
% x=c';

% % Plot and label data.
% plot(lags,x,'k'); 
% hold on
% plot([lags(1), lags(end)], [0 0],'k'); % Plot a zero line 
% xlabel('Lags','FontSize',14); 
% ylabel('Auto-covariance','FontSize',14); 
% axis([0 30 -.2 1.2]);
% title('Auto covariance function of the heart rate under normal resting conditions');
% grid on;


% ============ task ===== 

% N = 100;
% fs = 50;

% t = [1:N-1]/fs;
% x1 = sin(2*pi*t); % 1 hz sin wave
% x2 = cos(2*pi*t); % 1 hz cos wave
% x3 = cos(2*pi*2*t); % 2 hz cos wave
% x4 = sawtooth(2*pi*t); % 1 hz sawtooth wave

% figure(1);
% subplot(2,2,1);
% plot(t, x1);
% xlabel("Time");
% ylabel("Amplitude");
% title("1 Hz Sin wave");

% subplot(2,2,2);
% plot(t, x2);
% xlabel("Time");
% ylabel("Amplitude");
% title("1 Hz Cos wave");

% subplot(2,2,3);
% plot(t, x3);
% xlabel("Time");
% ylabel("Amplitude");
% title("2 Hz Cos wave");

% subplot(2,2,4);
% plot(t, x4);
% xlabel("Time");
% ylabel("Amplitude");
% title("1 Hz Sawtooth wave");

% X = [x1; x2; x3; x4];
% S = cov(X);


% =============== Post Lab Task ======= 

load Hr_med; %Load normal HR data 
[c,lags] = xcov(hr_med,'coeff');
x=c';

% Plot and label data.
plot(lags,x,'k'); 
hold on
plot([lags(1), lags(end)], [0 0],'k'); % Plot a zero line 
xlabel('Lags','FontSize',14); 
ylabel('Auto-covariance','FontSize',14); 
axis([0 900 -1 1]);
title('Auto covariance function of the heart rate under meditative conditions');
grid on;
