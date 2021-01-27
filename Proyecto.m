clc,clear,close
fs = 44100;
p = 360;
Nom = 'Salsipuedes.jpg';
tic()
[sound,k] = Top(fs,p,Nom);
toc()
p = audioplayer(sound,fs);
play(p)
 
%Nomf=[Nom(1:k) '.wav'];
%audiowrite(Nomf,sound,fs)
 
%[yp,fsp] = wavread(Nomf);
%get_fft(yp,fsp);
%
% NomfF=[Nom(1:k) 'F.wav'];
% [yp1,fsp1] = wavread(NomfF);
% get_fft(yp1,fsp1);



 