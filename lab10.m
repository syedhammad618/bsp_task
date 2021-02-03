clear all;
close all;
clc;

% ============= Task 1 ========= %
% % filter design
% fs = 100;
% order = 128;
% wn1 = 5*2/fs; % normalized bandwidth (omega 1)
% wn2 = 15*2/fs;
% wn = [wn1 wn2]; % cut-off freqs for band pass/stop filters
% b = fir1(order, wn, "bandpass"); % default window = hamming (input: N = order +1)

% [h, freq] = freqz(b, 1, 512, fs); % check mag and freq response of filter
% plot(freq, abs(h));
% title("Frequency response of bandpass filter");
% xlabel("Frequency (Hz");
% ylabel("H(f)")

% ============= Task 2 ========= %
% fs = 100;
% order = 128; % higher order --> greater roll of rate
% wn = [6*2/fs 12*2/fs];
% [b, a] = fir1(order, wn, "bandpass",hamming(order+1));
% [h, freq] = freqz(b,a, 512, fs);

% figure(1);
% plot(freq, abs(h), "k");
% xlabel("Frequency (Hz");
% ylabel("H(f)")
% title("Frequency Response of Bandpass filter 6Hz to 12Hz")

% % apply on eeg data
% load EEG_data
% N = length(eeg);
% t = (1:N)/fs;
% filtered_eeg = filter(b,a, eeg); % apply designed filter to eeg
% figure(2);
% subplot(211);
% plot(t, eeg);
% title("Original EEG signal");
% xlabel("Time");
% ylabel("Amplitude");
% subplot(212);
% plot(t, filtered_eeg);
% title("Filtered EEG signal");
% xlabel("Time");
% ylabel("Amplitude");

% % freq response of filter
% figure(3);
% fscale = (1:N)*fs/N; 
% plot(fscale, abs(fft(filtered_eeg).^2));
% xlim([0 20]);
% xlabel("Frequency (Hz)");
% ylabel("Amplitude");
% title("Frequency response of filtered EEG signal");

% =============== Post Lab Task =========== %
f = 20;
fs = 100;
N = 513;
t = [1:N-1]/fs;
sig = sin(2*pi*t*f); % 20 hz sin wave
sig = sig + rand(size(sig)).*5; % add noise

figure(1);
subplot(211);
plot(t, sig);
title("Noisy signal (20 Hz Sine wave + Random noise)");
xlabel("Time");
ylabel("Amplitude");
xlim([0 5]);

freq = (1:N-1)*fs/N;
subplot(212);
plot(freq, abs(fft(sig).^2));
xlim([0 fs/2]);
title("Frequency response of noisy signal");
xlabel("Frequency");
ylabel("Amplitude");
ylim([0 50000])

order = 128; % higher order --> greater roll of rate
f_low = 18;
f_high = 22;
wn = [f_low*2/fs f_high*2/fs];
[b, a] = fir1(order, wn, "bandpass",hamming(order+1));
[h, freq] = freqz(b,a, N-1, fs*2);

filtered_sig = filter(b,a, sig); % apply designed filter to signal
figure(2);
subplot(211);
plot(t, filtered_sig)
title("Filtered signal");
xlabel("Time");
ylabel("Amplitude");
xlim([0 5]);

subplot(212);
plot(freq, abs(fft(filtered_sig).^2))
title("Filtered spectrum of filtered signal");
xlabel("Frequency (Hz)");
ylabel("Amplitude");
xlim([0 fs/2]);
