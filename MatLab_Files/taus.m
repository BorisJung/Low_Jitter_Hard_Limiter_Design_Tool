%% Berechnung der Zeitkonstanten Tau der einzelnen Stufen

function [tau1, tau2, tau3, tau4] = taus(V, roh_in, g1_x, g2_x, g3_x, g4_x)

Tr = V/roh_in;
tau1 = Tr/(2*g1_x);
tau2(1) = Tr/(2*g2_x(1));
tau2(2) = Tr/(2*g2_x(2));
tau3(1) = Tr/(2*g3_x(1));
tau3(2) = Tr/(2*g3_x(2));
tau3(3) = Tr/(2*g3_x(3));
tau4(1) = Tr/(2*g4_x(1));
tau4(2) = Tr/(2*g4_x(2));
tau4(3) = Tr/(2*g4_x(3));
tau4(4) = Tr/(2*g4_x(4));