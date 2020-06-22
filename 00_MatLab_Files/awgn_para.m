clear;
clc;


   
        prompt = {'Anzahl der Datenbits N: ','EbN0: ','Oversamplingfaktor: ',...
                    'Roll-Off Faktor: ','Downsamplingfaktor für Gardner: ','Error Update Gain für Gardner: '};
        dlg_title = 'AWGN Kanal Parameter';
        answer = inputdlg(prompt);
        N = str2num(answer{1});
        EbN0 = str2num(answer{2});
        Nos = str2num(answer{3});
        rho = str2num(answer{4});
        downGard = str2num(answer{5});
        EUG = str2num(answer{6});
