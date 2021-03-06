%% Jitterberechnung f�r Hard Limiter nach Collins
% 
% J: RMS Jitter [s]
% J2: squared jitter [s^2]
% M: normalized squared jitter [ ]
% N0: Rauschleistungsdichte [W/Hz]
% n0: Rauschspannungsdichte [V/sqrt(Hz)]
% roh_in: Slew Rate des Eingangssignals [V/s]
% roh_out: Slew Rate des Ausgangssignals [V/s]
% th: output half-level crossing time [s]
% k: normalized half-level crossing time [ ]
% tau: Zeitkonstanste [s]
% G: Voltage gain [ ]
% g: slope gain [ ]
% Tr: Rise Time Eingangssignal [s]
% Vpp: Peak-Peak Eingangssignal [V]
% V: Signalpegel am Ausgang der Limiterstufen, peak-peak [V]
%       (festgelegt durch Diodenspannung)
% A: total slope gain
% B: Bandbreite [Hz]
% y: Faktor g/G
% f: Frequenz des Eingangssignals
%
%
clc;
clear;
close all;
%
%
V = 1.3;
%
%% Parameterabfrage und -aufbereitung
[N0, Vpp, f, roh_in, A, Q, k, y, n]=user_para;
%
%% Berechnung der Slope Verst�rkung der einzelnen Stufen
[g] = gain_dist(A, n);
%
%% Berechnung der DC-Verst�rkung G
[G] = DC_gains(g,y);
%
%% Berechnung der Slew Rates
%
[SR, roh_out] = slew_rates(g, G, n, roh_in);
%
%% Berechnung des normalisierten Jitters M  %%
[M] = normJit (A, n);
%
%% Jitterberechnung
J2 = (N0/(4*V*roh_in))*Q*M; 
J = sqrt(J2); %Jitter in Sekunden
%
%% Berechnung der Zeitkonstanten Tau
[tau] = tau(V, SR, roh_in, g, n);
[fg] = fcut(tau, n);
%
%% Berechnung der Bandbreite B
B = g(1)*roh_in/(pi*(2*k-1)*V); % S.606 Gleichung (24)
%
%% Ergebnisse
% Ergebnisse = {  'Anzahl Limiter Stufen: ' num2str(n)...
%                 ''...
%                 'Slew Rate des Eingangssignals [V/us]: ' num2str(roh_in/1e6) ...
%                 ''...
%                 'Total Slope Gain: ' num2str(A)...
%                 ''...
%                 'Slew Rate des Ausgangssignals [V/us]: ' num2str(roh_out/1e6) ...
%                 ''...
%                 'Normalized squared Jitter M: ' num2str(M)...
%                 ''...
%                 'Total RMS Jitter J: ' num2str(J)...
%                 ''...
%                 'Slope gains g(i): '...
%                 num2str(g')...
%                 ''...
%                 'DC Gains G(i): '...
%                 num2str(G')...
%                 ''...
%                 'Zeitkonstanten tau(i): '...
%                 num2str(tau')...
%                 ''...
%                 'Grenzfrequenzen fg(i): '...
%                 num2str(fg')...
%                 };
% Ergebnispopup=msgbox(Ergebnisse, 'Ergebnisse')
% %
% %
f2=figure('Name', 'Tabelle','NumberTitle','off','Units','Normalized',...
          'Position',[0.4 0.1 0.2 0.8]);
daten = [J;...
         M;...
         B;...
         roh_in*1e-6;...
         A;...
         roh_out*1e-6;...
         g';...
         G';...
         tau';...
         fg';...
         SR';...
         ];
     
         
%      for i=1:n;
%          ind(i) = {num2str(i)}   
%            
%      end;
%           slGain = {'g'}    
%          slopegain = strcat( slGain, ind )
         
rownames = {'J', 'M', 'B',...
            'roh_{in}', 'A' , 'roh_{out}' ,...
            'g', 'g2' , 'g3' , 'g4' ,...
            'G1', 'G2', 'G3', 'G4'...
            'tau 1', 'tau 2', 'tau 3', 'tau 4',...
            'fg1' , 'fg2' , 'fg3' , 'fg4' ,...
            'SR1' , 'SR2' , 'SR3' , 'SR4' , 'SR5' , 'SR6' , 'SR7' , 'SR8' , 'SR9' ,...
            };
     
colnames = {'vierstufig'};
t=uitable('Data',daten,'ColumnName',colnames,'RowName',rownames,'Parent',f2,'Units','Normalized','Position',[0 0 1 1]);

%

%% Quelle:
%
% IEEE Transactions on Communications, Vol. 44, no. 5, May 1996
%
% "The Design of Low Jitter Hard Limiters"
% Olicer Collins
