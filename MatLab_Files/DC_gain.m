%% Berechnung DC-Gain G
%
%
function [G] = DC_gain(gx_x, y)

G = gx_x * (1/y);