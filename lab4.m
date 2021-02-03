clear all;
close all;
clc;

load ver; % load visual evoked signal (ver) data
fs = 1/0.005; % sampling freq
[r, c] = size(ver);
if r>c % do as per dim of vector
    ver = ver';
    t = (1:r)/fs; % time scale
else
    t = (1:c)/fs;
end

avg100 = mean(ver); % ensemble average of 100 samples
avg25 = mean(ver(1:25,:)); % ensemble avg of 25 samples

% plot differently avg and non-avg signals
subplot(3,1,1);
plot(t,ver(1,:)); % first sample
title("First Sample");
xlabel("Time");
ylabel("EEG amplitude")

subplot(3,1,2);
plot(t,avg100); % 100 avg ensemble
title("Ensemble Average over 100 samples");
xlabel("Time");
ylabel("EEG amplitude")

subplot(3,1,3);
plot(t,avg25); % avg 25 samples
title("Ensemble Average over 25 samples");
xlabel("Time");
ylabel("EEG amplitude")

% find how much noise is present in a signal
ver_noise = ver(1,:) - actual_ver; % actual_ver is in file ver.m 
avg100_noise = avg100 - actual_ver; % noise in 100 avg signal
avg25_noise = avg25 - actual_ver;

% some statistics of noise
ver_noise_std = std(ver_noise);
avg100_noise_std = std(avg100_noise);
avg25_noise_std = std(avg25_noise);

% display
fprintf("Std of average ensemble data %f",ver_noise_std);
disp(" ");
fprintf("Std of 100 average samples %f",avg100_noise_std);
disp(" ");
fprintf("Std of 25 average samples %f",avg25_noise_std);

%disp("Std of average ensemble data "ver_noise_std);