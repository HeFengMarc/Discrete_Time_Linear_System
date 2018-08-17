% He Feng

% We chose two sound signals from the class websites, and we load each
% sound and play the original signal initially. Then we applied the
% frequency shift and time scaling in the following parts. We implement 
% a high pass filter and at the end of the exercise we determined the
% inverse FFT of the signal passed through the implemented high pass
% filter.

clear all;
close all;

% Load each sound.
[y1,Fs1] = audioread('blm.wav');
[y2,Fs2] = audioread('tiger.wav');
n1 = 0:1:25916;
% Length of y1F
N1 = 25917;
n2 = 0:1:16762;
% Length of y2
N2 = 16763;
new_n1 = transpose(n1);
new_n2 = transpose(n2);

% Play each sound with 2 seconds pause.
soundsc(y1,Fs1);
pause(2);
soundsc(y2,Fs2);
% Length of data in seconds.
info1 = audioinfo('blm.wav')
info2 = audioinfo('tiger.wav')

Y1 = fft(y1);
Y2 = fft(y2);
Y1_magnitude = abs(Y1);
Y2_magnitude = abs(Y2);

% Calculate the time sample
t1 = (0:N1-1)*(1/Fs1); 
t2 = (0:N2-1)*(1/Fs2);
% Calculate the frequency sample
w1 = (-N1/2:N1/2-1)*(1/N1);
w2 = (-N2/2:N2/2-1)*(1/N2);

w1_scale = (-N1/2:N1/2-1)*(Fs1/N1);
w2_scale = (-N2/2:N2/2-1)*(Fs2/N2);

% Plot the time sample plot and frequency sample plot of blm.wav
figure(1);
subplot(2,2,1);
plot(t1, y1);
xlabel('time');
ylabel('y-value');
title('blm.wav time sample');
subplot(2,2,3);
plot(w1,Y1_magnitude);
xlabel('frequency');
ylabel('magnitude');
title('blm.wav frequency sample');
subplot(2,2,2);
plot(t2, y2);
xlabel('time');
ylabel('y-value');
title('tiger.wav time sample');
subplot(2,2,4);
plot(w2,Y2_magnitude);
xlabel('frequency');
ylabel('magnitude');
title('tiger.wav frequency sample');

% Part a
new_y1 = y1 .* (-1).^new_n1;
new_y2 = y2 .* (-1).^new_n2;
new_Y1 = fft(new_y1);
new_Y2 = fft(new_y2);
new_Y1_magnitude = abs(new_Y1);
new_Y2_magnitude = abs(new_Y2);
pause(2);
soundsc(new_y1,Fs1);
pause(2);
soundsc(new_y2,Fs2);

figure(2);
subplot(2,1,1);
plot(w1,new_Y1_magnitude);
xlabel('frequency');
ylabel('magnitude');
title('Frequency content of blm.wav for part a');
subplot(2,1,2);
plot(w2,new_Y2_magnitude);
xlabel('frequency');
ylabel('magnitude');
title('Frequency content of tiger.wav for part a');


% Part b
% We downsample the y1 and y2 functions to speed up.
downsample_y1 = downsample(y1,2);
downsample_y2 = downsample(y2,2);

downsample_Y1 = fft(downsample_y1);
downsample_Y2 = fft(downsample_y2);
down_Y1_magnitude = abs(downsample_Y1);
down_Y2_magnitude = abs(downsample_Y2);
pause(2);
soundsc(downsample_y1,Fs1);
pause(2);
soundsc(downsample_y2,Fs2);

N1_new = length(downsample_y1);
N2_new = length(downsample_y2);
w1_new = (-N1_new/2:N1_new/2-1)*(1/N1_new);
w2_new = (-N2_new/2:N2_new/2-1)*(1/N2_new);

% Plot the frequency content of two signals after scaling.
figure(3);
subplot(2,1,1);
plot(w1_new,down_Y1_magnitude);
xlabel('frequency');
ylabel('magnitude');
title('Frequency content of blm.wav for part b');

subplot(2,1,2);
plot(w2_new,down_Y2_magnitude);
xlabel('frequency');
ylabel('magnitude');
title('Frequency content of tiger.wav for part b');

% Part c
% Create a high pass filter.
[b,a] = butter(20,0.25,'high');
y1_filter = filter(b,a,y1);
y2_filter = filter(b,a,y2);
new_Y1 = fft(y1_filter);
new_Y2 = fft(y2_filter);
inverse_y1_filter = ifft(new_Y1);
inverse_y2_filter = ifft(new_Y2);
pause(2);
soundsc(real(double(inverse_y1_filter)));
pause(2);
soundsc(real(double(inverse_y2_filter)));
new_Y1_magnitude = abs(new_Y1);
new_Y2_magnitude = abs(new_Y2);


figure(4);
subplot(2,2,1);
% blm.wav go through high pass filter
plot(w1,inverse_y1_filter);
xlabel('time');
ylabel('value');
title('blm.wav time plot');
subplot(2,2,2);
% tiger.wav go through high pass filter
plot(w2,inverse_y2_filter);
xlabel('time');
ylabel('value');
title('tiger.wav time plot');

subplot(2,2,3);
plot(w1_scale,new_Y1_magnitude);
xlabel('frequency');
ylabel('magnitude');
title('blm.wav frequency plot');

subplot(2,2,4);
plot(w2_scale,new_Y2_magnitude);
xlabel('frequency');
ylabel('magnitude');
title('tiger.wav frequency plot');



