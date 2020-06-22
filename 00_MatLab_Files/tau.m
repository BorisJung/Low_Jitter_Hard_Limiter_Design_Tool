%% Berechnung der Zeitkonstanten Tau der einzelnen Stufen
%
% 
function [tau] = taus(V, SR, roh_in, g, n)

SR=SR./1e-6;

for i=1:n;
Tr(i) = V/SR(2*i-1);
tau(i) = Tr(i)/(2*g(i)); % S. 604 Gleichung (15)
end;