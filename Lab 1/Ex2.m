% He Feng

% This script based on Ex1, and we used the method of volume
% variation to improve the sound quality.

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
A2 = sin(2 * pi * fa * t2);
A1 = sin(2 * pi * fa * t1);
E1 = sin(2 * pi * fe * t1);
B1 = sin(2 * pi * fb * t1);
C1 = sin(2 * pi * fc * t1);
A4 = sin(2 * pi * fa * t4);

% Apply ADSR to each node.
new_A2 = window(A2);
new_A1 = window(A1);
new_E1 = window(E1);
new_B1 = window(B1);
new_C1 = window(C1);
new_A4 = window(A4);

% Define the series of nodes one by one with a pause between each two
% nodes.
music = [new_A2, pause, new_A1, pause, new_E1, pause, new_E1, pause, new_E1, pause, new_B1, pause, new_C1, pause, new_B1, pause, new_A4];

% Play the music.
sound(music, Fs);

