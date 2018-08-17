% He Feng

% We used FFT to compute two signals, and draw the shifted, 
% unshifted, and frequency scaling version of each signal 
% in one figure.

clear all;
close all;

% Define the domain of n.
n = 0:1:127;
N = 128;
% We have two signal frequency rate here.
f = [0.25, 0.5];
Fs = 10000;
w = 2*pi*(0:N-1)*(1/N);
% This is the frequency which will shown as the x-axis.
w_shift = 2*pi*(-N/2:N/2-1)*(1/N);
% The frequency shown on x-axis after scaling.
w_scale = (-N/2:N/2-1)*(Fs/N);

% Two signals.
x1 = 1+cos(2*pi*f(1)*n);
x2 = 1+cos(2*pi*f(2)*n);
% Define the FFT functions which computes the signals above.
X1 = fft(x1);
X2 = fft(x2);
% The magnitude of two FFT functions.
X1_magnitude = abs(X1);
X2_magnitude = abs(X2);
% Shift the FFT functions.
X1_shift = fftshift(X1);
X2_shift = fftshift(X2);
% The magnitude of the shifted FFT functions
X1_shift_magnitude = abs(X1_shift);
X2_shift_magnitude = abs(X2_shift);

% We show the result in one 2x3 figure
% This subplot plots the unshifted DFT for f=0.25
figure(1);
subplot(2,3,1);
plot(w,X1_magnitude);
xlabel('frequency');
ylabel('magnitude');
title('X1_FFT');

% This subplot plots the shifted DFT for f=0.25
subplot(2,3,4);
plot(w_shift,X1_shift_magnitude);
xlabel('frequency');
ylabel('magnitude');
title('X1_shift');

% This subplot plots the unshifted DFT for f=0.5
subplot(2,3,2);
plot(w,X2_magnitude);
xlabel('frequency');
ylabel('magnitude');
title('X2_FFT');

% This subplot plots the shifted DFT for f=0.5
subplot(2,3,5);
plot(w_shift,X2_shift_magnitude);
xlabel('frequency');
ylabel('magnitude');
title('X2_shift');

% This subplot plots the shifted DFT with a 10kHz frequency scale
% for f=0.25
subplot(2,3,3);
plot(w_scale,X1_shift_magnitude);
xlabel('frequency');
ylabel('magnitude');
title('X1_scale');

% This subplot plots the shifted DFT with a 10kHz frequency scale
% for f=0.5
subplot(2,3,6);
plot(w_scale,X2_shift_magnitude);
xlabel('frequency');
ylabel('magnitude');
title('X2_scale');

