% He Feng

% We want to experience a moving average filter in this case. We initially
% plot the data from the file on website. Then we implement a filter and
% get the new graph of the signal passed through the filter. Finally we
% plot the DTFT magnitude of h[n] to verify that the system correspond to a
% low pass filter.

clear all;
close all;

% Load the data
data_loaded = load('microsoft_stock.txt');
figure(1);
% Plot the original dataset
plot(data_loaded);
xlabel('index');
ylabel('value');
title('microsoft stock data');

% Implement the filter
h = 1/30*ones(1,30);
conv_y = conv(data_loaded,h);
b = ones(1,30);
a = 30;
filtered_y = filter(b,a,data_loaded);
hold on;
% Plot the new signal after convolution with color red.
plot(conv_y,'r');
xlabel('index');
ylabel('value');
title('signal after convolution');
hold on;
% Plot the new signal after passing through the filter with color green.
plot(filtered_y,'g');
xlabel('index');
ylabel('value');
title('signal after passing through the filter');


% Plot the DTFT magnitude of h[n] within another figure.
figure(2);
N = 30;
w = (-N/2:N/2-1)*(1/N);
H = fft(h);
H_shift = fftshift(H);
H_shift_magnitude = abs(H_shift);
plot(w,H_shift_magnitude);
xlabel('frequency');
ylabel('magnitude');
title('DTFT magnitude of h[n]');
