%% Berechnung DC-Gain G
%
%
function [G] = DC_gain(g, y)

G = g * (1/y);