% He Feng

%This script will play a piece of music which contain several notes.

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

% Set the frequency of each note.
fa = 220;
fb = 220 * 2^(2/12);
fc = 220 * 2^(3/12);
fe = 220 * 2^(7/12);

% Use a function to define pause, which means there
% is an empty period after each movement.
pause = zeros(1, 0.02 * Fs);

% Build the sinusoidal waveform of each note.
A2 = sin(2 * pi * fa * t2);
A1 = sin(2 * pi * fa * t1);
E1 = sin(2 * pi * fe * t1);
B1 = sin(2 * pi * fb * t1);
C1 = sin(2 * pi * fc * t1);
A4 = sin(2 * pi * fa * t4);

% Define the music with note one by one, and each of them has a 'pause' 
% function between them.
music = [A2, pause, A1, pause, E1, pause, E1, pause, E1, pause, B1, pause, C1, pause, B1, pause, A4];

% Play the music.
sound(music, Fs);
