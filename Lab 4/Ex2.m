% He Feng

% We initially create two low pass filters, and we apply the filters to 
% three data-sets and plot the graph and see the difference.

clear all;
close all;

% Part 1
% Filter order
N = 10;
Fc = 0.3;
stock_data = load('microsoft_stock.txt');

% Section a
% Determine the coefficient of the first filter.
[b,a] = fir1(N,Fc,'low');
filter_1 = frevalz01(b,a);

% Section b
% Determine the coefficient of the second filter.
[d,c] = butter(N,Fc,'low');
filter_2 = frevalz01(d,c);

figure(2)
subplot(2,1,1);
plot(filter_1);
subplot(2,1,2);
plot(filter_2);

% Section c
% Apply the two filters to the stock market data, and plot the original
% graph, and the two graphs from the data passed through the filters in my
% figure.
lpf_a_stock = filter(b,a,stock_data);
lpf_b_stock = filter(d,c,stock_data);
figure(3);
plot(stock_data);
hold on;
plot(lpf_a_stock,'r');
hold on;
plot(lpf_b_stock,'y');
title('Data in Stock Market');
xlabel('index');
ylabel('value');

% Apply the two filters to the impulse data, and plot three graphs as
% mentioned above.
pulse_data = [ones(1,20),zeros(1,40)];
lpf_a_pulse = filter(b,a,pulse_data);
lpf_b_pulse = filter(d,c,pulse_data);
figure(4);
plot(pulse_data);
hold on;
plot(lpf_a_pulse,'r');
hold on;
plot(lpf_b_pulse,'y');
title('Data of the pulse');
xlabel('index');
ylabel('value');

% Apply the filters to the music data, and finish drawing by using two
% methods.
[y,Fs] = audioread('music.wav');
lpf_a_music = filter(b,a,y);
lpf_b_music = filter(d,c,y);
figure(5);
plot(y);
hold on;
plot(lpf_a_music,'r');
hold on;
plot(lpf_b_music,'y');
title('Data of music on the website');
xlabel('index');
ylabel('value');
% It is hard to se if we put three graphs together, so I put them
% separately.
figure(6);
subplot(3,1,1);
plot(y);
title('Data of original music on the website');
xlabel('index');
ylabel('value');
subplot(3,1,2);
plot(lpf_a_music);
title('Data of music passed through FIR');
xlabel('index');
ylabel('value');
subplot(3,1,3);
plot(lpf_b_music);
title('Data of music passed through IIR');
xlabel('index');
ylabel('value');



