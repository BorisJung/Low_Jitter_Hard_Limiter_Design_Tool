%% Gain Distribution
%
% beliebige Anzahl von Stufen
%
function [g] = gain_dist(A, n)
for i=1:n
g(i) = 2 * (2^((-n)*((2^(i-1))/((2^n)-1)))) * (A^((2^(i-1))/((2^n)-1)));
% S.607 Gleichung (31)
end