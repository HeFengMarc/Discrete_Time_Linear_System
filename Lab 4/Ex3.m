% He Feng

% We built an music equalizer in this exercise. We initially build a
% function and we based on this function to break the sound file, weight
% and reconstruct the signals by summing.

clear all;
close all;

% Part 2
% Download the music.wav file, and comparing the output between two
% situations.
[y,Fs] = audioread('music.wav');
sound(y,Fs);
pause(20);
equalized_sound_1 = equalizer(y,1,1,1);
sound(equalized_sound_1,Fs);
audiowrite('equalized_sound_1.wav',equalized_sound_1,Fs);

% Part 3
% Change to different sets of gains to do the same procedure mentioned
% above again.
equalized_sound_2 = equalizer(y,0,0,1);
sound(equalized_sound_2,Fs);
audiowrite('equalized_sound_2.wav',equalized_sound_2,Fs);
pause(20);
equalized_sound_3 = equalizer(y,1,0,0);
sound(equalized_sound_3,Fs);
audiowrite('equalized_sound_3.wav',equalized_sound_3,Fs);

% Testing to make sure that they have the same length.
% This is a personal testing, and it is not required in the spec.
length(y)
length(equalized_sound_1)
length(equalized_sound_2)
length(equalized_sound_3)

