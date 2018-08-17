% He Feng

% This script multiply the sinusoid waveform with the window function
% which will be used as the new signal.

function mod = window(x)

% Length of the sinusoidal function.
n = length(x)

% Define each state of the window function
A = linspace(0,9.2,n/10);
D = linspace(9.2,6.9,n/10);
S = linspace(6.9,6.9,7*n/15);
R = linspace(6.9,0,n/3+1);

% Define the window function
ADSR = [A,D,S,R]

%size(A)
%size(D)
%size(S)
%size(E)
%size(x)
%size(ADSR)

% Times the sinusoidal function with the window function
mod = x.*ADSR
