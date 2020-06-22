%% Grenzfrequenzen der Filter
%
%
function [fg] = fcut(tau, n)
%
for i=1:n;
fg(i) = 1/(2*pi*tau(i));
end;