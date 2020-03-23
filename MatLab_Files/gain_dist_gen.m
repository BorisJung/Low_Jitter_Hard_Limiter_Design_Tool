%% Gain Distribution
%
% beliebige Anzahl von Stufen
%
%function [g] = gain_dist_gen(A, n, N)
%
%
%
%clear;
%clc;
%close all;
A = 200;
n = 4;
N = [2 2 10 10];
%
for i=2:n
e(i)=N(i)/N(i-1);
end



g(1) = ((2^11*e(2)^7*e(3)^3*e(4)) * A)^(1/15);
g(2) = (g(1)^2)/(2*e(2));
g(3) = (g(2)^2)/(2*e(3));
g(4) = (g(3)^2)/(2*e(4));

gesamt = g(1) * g(2) * g(3) * g(4)







%% Voltage Noise Spectral Density
%
%
% OPA1611 (1.1nV)
% 1.1nV/sqrt(Hz) @ 1 kHz
% 1.2            @ 100 Hz
% 2              @ 10 Hz
% 4              @ 1 Hz
%
%
% THS4031 (1.6nV)
% 1.9nV/sqrt(Hz) @ 1 kHz
% 3.8nV/sqrt(Hz) @ 100 Hz
% 10 nV/sqrt(Hz) @ 10 Hz
% -              @ 1 Hz
%
%
% ADA4899 (1nV)
% 1.5nV/sqrt(Hz) @ 1 kHz
% 3.8nV/sqrt(Hz) @ 100 Hz
% 10 nV/sqrt(Hz) @ 10 Hz
% -              @ 1 Hz