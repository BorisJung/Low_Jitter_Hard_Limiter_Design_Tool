%% Jitterberechnung
% 
% J: RMS Jitter
% J2: squared jitter [s^2]
% M: normalized squared jitter [ ]
% N0: Rauschleistungsdichte [W/Hz]
% n0: Rauschspannungsdichte [V/sqrt(Hz)]
% roh_in: Slew Rate des Eingangssignals [V/s]
% th: output half-level crossing time [s]
% k: normalized half-level crossing time [ ]
% tau: Zeitkonstanste [s]
% G: Voltage gain [ ]
% g: slope gain [ ]
% Tr: Rise Time Eingangssignal [s]
% V: Peak-Peak Eingangssignal [V]
% A: total slope gain
% B: Bandbreite [Hz]
% y: Faktor g/G
%
%% Minimum Squared Jitter
%
%
% J2min = N0 * Q * g / (4 * roh_in^2 * T)
%
% Jmin = sqrt(J2min)
%
%
%% Programmstart
%
%% Workspace leeren
%
clc;
clear;
close all;
%
%
%% Parameterabfrage und -aufbereitung
[N0, V, roh_in, A, Q, k, y, n]=user_para;
g=A;
%
%% Berechnung der Slope Verstärkung der einzelnen Stufen
%
%
[g2_1, g2_2, g3_1, g3_2, g3_3, g4_1, g4_2, g4_3, g4_4, gx_x, gx_1, g1_x, g2_x, g3_x, g4_x]...
    = gain_distr(g);
%
%% Berechnung des normalisierten Jitters M  %%
%=============================================%
%
%
A = g;
M(1) = A;
%
%
%% zweistufiger Limiter
%
M(2) = g2_1 + g2_2/g2_1;
%
%
%% dreistufiger Limiter
%
M(3) = g3_1 + g3_2/g3_1 + g3_3/(g3_1*g3_2);
%
%
%% vierstufiger Limiter
%
M(4) = g4_1 + g4_2/g4_1 + g4_3/(g4_1*g4_2) + g4_4/(g4_1*g4_2*g4_3);
%
%%
%
%% Plot
%figure('Name', 'Normalisierter Jitter M','NumberTitle','off','Position',[380,200,1000,500]);
%subplot(1,1,1); stem (M);
%uV=[1e0 ; 1e1 ; 1e2 ; 1e3 ; 1e4 ; 1e5 ; 1e6 ; 1e7];
%set(gca,'yscale','log','YTick',uV,'YTickLabel',num2str(uV));
%grid on;
%%
%
%% Jitterberechnung
%
J2 = (N0/(4*V*roh_in))*Q*M; 
J = sqrt(J2); %Jitter in Sekunden

%% Berechnung der Zeitkonstanten Tau
%
[tau1, tau2, tau3, tau4] = taus(V, roh_in, g1_x, g2_x, g3_x, g4_x);
%
%% Berechnung der Bandbreite B
%
B = gx_1*roh_in/(pi*(2*k-1)*V);
%
%% Berechnung der DC-Verstärkung G
%
[G] = DC_gain(gx_x,y);
%
%% Ergebnisse

f1=figure('Name', 'Jitter J','NumberTitle','off','Position',[450,100,800,600]);
subplot(1,3,3); stem(J,'Basevalue',1e-12,'Linewidth',2);
set(gca,'yscale','log');
set(gca,'XTick',0:4);
ylim([1e-12 1e-5]);
xlabel('Anzahl der Stufen');
ylabel('Jitter in Sekunden');
grid on;
hold on;

Parameter = {'{\bf Parameter}  \newline '...
              '{\bf Rauschspannungsdichte sqrt(N0) [V/sqrt(HZ)]: }' num2str(sqrt(N0)) '\newline '...
              '{\bf Spitze-Spitze-Spannung des Eingangssignals [V]: }' num2str(V) '\newline '...
              '{\bf Slew Rate des Eingagnssignals [V/us]: }' num2str(roh_in*1e-6) '\newline '...
              '{\bf Slope gain [ ]: }' num2str(g) '\newline '...
              '{\bf Design Parameter k [ ]: }' num2str(k) '\newline \newline'...
              };

annotation('textbox', [0.06 0.11 0.25 0.815000000000001],...
           'String', Parameter, 'BackgroundColor', [0.9 0.9 0.9], 'Interpreter','tex');

       
       
Ergebnisse = { '{\bf Ergebnisse} '...
              '{\bf Jitter in Sekunden:} \newline'...
              '{\bf einstufiger Aufbau:}' num2str(J(1))...
              '{\bf zweistufiger Aufbau:}' num2str(J(2))...
              '{\bf dreistufiger Aufbau:}' num2str(J(3))...
              '{\bf vierstufiger Aufbau:}' num2str(J(4)) '\newline \newline'...
              '{\bf Bandbreite in Hz:} \newline'...
              '{\bf einstufiger Aufbau:}' num2str(B(1))...
              '{\bf zweistufiger Aufbau:}' num2str(B(2))...
              '{\bf dreistufiger Aufbau:}' num2str(B(3))...
              '{\bf vierstufiger Aufbau:}' num2str(B(4))...
              };
          
annotation('textbox', [0.35 0.11 0.25 0.815],...
           'String', Ergebnisse , 'BackgroundColor', [1 1 1], 'Interpreter','tex');


       
f2=figure('Name', 'Ergebnisse','NumberTitle','off','Position',[10,400,400,300]);
daten = [J(1)       J(2)        J(3)        J(4);...
         M(1)       M(2)        M(3)        M(4);...
         B(1)       B(2)        B(3)        B(4);...
         g          g2_1        g3_1        g4_1;...
         0          g2_2        g3_2        g4_2;...
         0          0           g3_3        g4_3;...
         0          0           0           g4_4;...
         G(1,1)     G(2,1)      G(3,1)      G(4,1);...  
         0          G(2,2)      G(3,2)      G(4,2);...
         0          0           G(3,3)      G(4,3);...
         0          0           0           G(4,4);...
         tau1       tau2(1)     tau3(1)     tau4(1);...
         0          tau2(2)     tau3(2)     tau4(2);...
         0          0           tau3(3)     tau4(3);...
         0          0           0           tau4(4);...
        ];
rownames = {'J', 'M', 'B',...
            'g1', 'g2', 'g3', 'g4',...
            'G1', 'G2', 'G3', 'G4'...
            'tau 1', 'tau 2', 'tau 3', 'tau 4',...
            };
colnames = {'einstufig' 'zweistufig' 'dreistufig' 'vierstufig'};
t=uitable('Data',daten,'ColumnName',colnames,'RowName',rownames,'Parent',f2,'Units','Normalized','Position',[0 0 1 1]); 


%
%
%% Quelle:
%
% IEEE Transactions on Communications, Vol. 44, no. 5, May 1996
%
% "The Design of Low Jitter Hard Limiters"
% Olicer Collins
