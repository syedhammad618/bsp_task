% BM17058_ Anees-ur-Rehman-Hashmi _BSP_Quiz_1

clear all;
close all;
clc;

load ensemble_data; % load visual evoked signal (ver) data
fs = 1/0.005; % sampling freq
[r, c] = size(data);
if r>c % do as per dim of vector
    data = data';
    t = (1:r)/fs; % time scale
else
    t = (1:c)/fs;
end


ensamble_avg = mean(data);
figure(1);
plot(t,data(1,:)); % first sample
title("First Sample");
xlabel("Time");
ylabel("EEG amplitude")

figure(2);
plot(t,ensamble_avg); % 100 avg ensemble
title("Ensemble Average over 100 samples");
xlabel("Time");
ylabel("EEG amplitude")

disp("The data contains 100 samples of length 250");
disp("Size of data: ");
disp(size(data));

disp("The standard deviation is: ");
disp(std(ensamble_avg));
