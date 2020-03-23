%% Berechnung des normalisierten Jitters M
%
%
function [M] = normJit (A, n)
%
M = 4*(1-(2^-n))*(2^(-n/(2^n-1)))*(A^(1/((2^n)-1)));
% S. 608 Gleichung (35)
