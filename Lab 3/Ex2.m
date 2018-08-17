% He Feng

% We used the same method from the last exercise to compute some built-in
% sinc functions, and we use FFT function to determine the magnitude and
% phase plot.

clear all;
close all;

% Ddefine the domain of n.
n = 0:1:255;
N = 256;
f = [0.15 0.2 0.4];
% The frequency which will shown on x-axis.
w = (-N/2:N/2-1)*(1/N);

% Define the functions and use FFT to compute it. 
% Then shift the function and determine the magnitude and angle.
x1 = sinc(f(1)*(n-32));
X1 = fft(x1);
X1_shift = fftshift(X1);
X1_shift_magnitude = abs(X1_shift);
X1_shift_angle = angle(X1_shift);

x2 = sinc(f(1).*(n-32)).*(-1).^n;
X2 = fft(x2);
X2_shift = fftshift(X2);
X2_shift_magnitude = abs(X2_shift);
X2_shift_angle = angle(X2_shift);

x3 = sinc(f(1).*(n-32)).*cos(2*pi*f(2).*n);
X3 = fft(x3);
X3_shift = fftshift(X3);
X3_shift_magnitude = abs(X3_shift);
X3_shift_angle = angle(X3_shift);

x4 = sinc(f(1).*(n-32)).*cos(2*pi*f(3).*n);
X4 = fft(x4);
X4_shift = fftshift(X4);
X4_shift_magnitude = abs(X4_shift);
X4_shift_angle = angle(X4_shift);

% Plot the graphs in two figures. The first figure contains the six graphs
% from the first three functions, and the second figure contains two graphs
% from the last function.
figure(1);
subplot(2,3,1);
plot(w,X1_shift_magnitude);
xlabel('frequency');
ylabel('magnitude');
title('x1[n] magnitude graph');
subplot(2,3,4);
plot(w,X1_shift_angle);
xlabel('frequency');
ylabel('phase angle');
title('x1[n] phase angle graph');

subplot(2,3,2);
plot(w,X2_shift_magnitude);
xlabel('frequency');
ylabel('magnitude');
title('x2[n] magnitude graph');
subplot(2,3,5);
plot(w,X2_shift_angle);
xlabel('frequency');
ylabel('phase angle');
title('x2[n] phase angle graph');

subplot(2,3,3);
plot(w,X3_shift_magnitude);
xlabel('frequency');
ylabel('magnitude');
title('x3[n] magnitude graph');
subplot(2,3,6);
plot(w,X3_shift_angle);
xlabel('frequency');
ylabel('phase angle');
title('x3[n] phase angle graph');

figure(2);
subplot(2,1,1);
plot(w,X4_shift_magnitude);
xlabel('frequency');
ylabel('magnitude');
title('x4[n] magnitude graph');
subplot(2,1,2);
plot(w,X4_shift_angle);
xlabel('frequency');
ylabel('phase angle');
title('x4[n] phase angle graph');
