% He Feng

% This script based on Ex2, and we used overlapping to make
% the sound quality even better.

% Clear all variables and close all windows.
clear all;
close all;

% Define the sampling frequency and its belonging period.
Fs = 8000;
Ts = 1/8000;

% To define the time vectors.
t1 = 0:(1/Fs):(0.5-1/Fs);
t2 = 0:(1/Fs):(1-1/Fs);
t4 = 0:(1/Fs):(2-1/Fs);

% Set the frequency of each node.
fa = 220;
fb = 220 * 2^(2/12);
fc = 220 * 2^(3/12);
fe = 220 * 2^(7/12);

% Use a function to define pause, which means there
% is an empty period after each movement.
pause = zeros(1, 0.02 * Fs);

% Build the sinusodal waveform of each node.
A2 = cos(2 * pi * fa * t2);
A1 = cos(2 * pi * fa * t1);
E1 = cos(2 * pi * fe * t1);
B1 = cos(2 * pi * fb * t1);
C1 = cos(2 * pi * fc * t1);
A4 = cos(2 * pi * fa * t4);

% Apply ADSR to each node.
new_A2 = window(A2);
new_A1 = window(A1);
new_E1 = window(E1);
new_B1 = window(B1);
new_C1 = window(C1);
new_A4 = window(A4);

% Define each node of the music.
node_0 = [new_A2,zeros(1,44000)];
node_1 = [zeros(1,7000),new_A1,zeros(1,41000)];
node_2 = [zeros(1,7000+3500),new_E1,zeros(1,37500)];
node_3 = [zeros(1,7000+3500*2),new_E1,zeros(1,34000)];
node_4 = [zeros(1,7000+3500*3),new_E1,zeros(1,30500)];
node_5 = [zeros(1,7000+3500*4),new_B1,zeros(1,27000)];
node_6 = [zeros(1,7000+3500*5),new_C1,zeros(1,23500)];
node_7 = [zeros(1,7000+3500*6),new_B1,zeros(1,20000)];
node_8 = [zeros(1,7000+3500*7),new_A4,zeros(1,4500)];

%size(ex_0)
%size(ex_1)
%size(ex_2)
%size(ex_3)
%size(ex_4)
%size(ex_5)
%size(ex_6)
%size(ex_7)
%size(ex_8)

% Summation the overlap song signal by adding the defined nodes above.
music = node_0+node_1+node_2+node_3+node_4+node_5+node_6+node_7+node_8;


%size(music)

% Play the final signal
sound(music,Fs);

