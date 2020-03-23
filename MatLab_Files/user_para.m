function [N0, V, f, roh_in, A, Q, k, y, n]=user_para;

%% Parameter Abfrage
%
clear;
clc;
%
prompt = {'Rauschspannungsdichte sqrt(N0) [nV/sqrt(HZ)]:' ,...
          'Spitze-Spitze-Spannung des Eingangssignals [V]:',...
          'Frequenz des Eingangssignals [Hz]: ',...
          'Slope gain [ ]: ',...
          'Design Parameter k [ ]: ',...
          'Anzahl der Stufen: '...
          };
dlg_title = 'Parametereingabe';
defAns = {'' , '' , '' , '' , '' , ''};
options.Interpreter = 'tex';
answer = inputdlg(prompt, dlg_title, 1, defAns, options );

%
user_N0 = str2num(answer{1});
user_V = str2num(answer{2});
user_f = str2num(answer{3});
user_g = str2num(answer{4});
k = str2num(answer{5});
n = str2num(answer{6});
%
%
test = @(y) 1-exp(-((k/(k-(1/2))))*y)-y;
y0=1;
y = fsolve(test,y0); %y=g/G
clc;
Q = (2*(1/y)-1)*(1/(k-(1/2)));
%
%% Parameteraufbereitung/Einheitennormierung
%
%
f = user_f;
A = user_g;
V = user_V;
roh_in = pi*f*V;
N0 = (user_N0 * 1e-9)^2;
%Tr = user_Tr * 1e-6;
%
