%% Optimum Gain Distribution of a cascaded stages hard limiter (Collins)
%
function [g2_1, g2_2, g3_1, g3_2, g3_3, g4_1, g4_2, g4_3, g4_4, gx_x, gx_1, g1_x, g2_x, g3_x, g4_x]...
    = gain_distr(g);
%% 2 Stages
% g1=sqrt(2*g2) , g1*g2 = g
g2_1 = 1.26 * (g^(1/3));
g2_2 = 0.79 * (g^(2/3));
%
%
%% 3 Stages
% g2=sqrt(2*g3) , g1=sqrt(2*sqrt(2*g3)) , g1*g2*g3=A
g3_1 = 1.49 * g^(1/7);
g3_2 = 1.10 * g^(2/7);
g3_3 = 0.61 * g^(4/7);
%
%
%% 4 Stages
% g3=sqrt(2*g4) , g2=sqrt(2*sqrt(2*g4)) , g1=sqrt(2*sqrt(2*sqrt(2*g4))) , g1*g2*g3*g4=A
g4_1 = 1.66 * g^(1/15);
g4_2 = 1.38 * g^(2/15);
g4_3 = 0.95 * g^(4/15);
g4_4 = 0.46 * g^(8/15);
%
%
%% Zusammenfassung in Vektoren
gx_x = [g 0 0 0 ; g2_1 g2_2 0 0 ; g3_1 g3_2 g3_3 0 ; g4_1 g4_2 g4_3 g4_4];
gx_1 = [g g2_1 g3_1 g4_1];
g1_x = [g];
g2_x = [g2_1 ; g2_2];
g3_x = [g3_1 ; g3_2 ; g3_3];
g4_x = [g4_1 ; g4_2 ; g4_3 ; g4_4];