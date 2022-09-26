clear;
D=0.5;          % Durée d'émission d'une note
Fs=8000;        % Fréquence d'échantillonnage
Te = 1/Fs;      % Période d'échantillonnage
N = round(D/Te);% Nombre d'échantillons dans une note 
n = Te*(0:N-1); % Vecteur temps pour une note
octave  = [ 261.6, 293.7, 329.6, 349.6, 391.9, 440.0, 493.9 ]; % octave
kb = [ octave; 2*octave ]; % Clavier de 2 lignes, 2 octaves ;
freqs = [octave 2*octave]'; % Vecteur de fréquences pour 2 octaves

% Jouons les notes des deux octaves
gamme = [];        
for k = 1 : length(freqs)
    note(k,:) = sin(2*pi*freqs(k)*n);
    gamme = [gamme note(k,:)];
end
soundsc(gamme,Fs);

s3=note(3,:); % signal Mi (329,6 Hz)
f4=[0:3999]./4000*Fs; % Création d'un vecteur de fréquence de 4000 points allant de 0 à Fs
f256=[0:255999]./256000*Fs; % Création d'un vecteur de fréquence de 256000 points allant de 0 à Fs

tiledlayout(2,1)
nexttile; plot(f4,abs(fft(s3,4000))); % Affichage du module du spectre du Mi
nexttile; plot(f256,abs(fft(s3,256000)));;

Env = exp(-n/(D/4)); 
Note_m = s3.*Env;
soundsc(Note_m,Fs);
figure;
tiledlayout(4,1)
nexttile; plot(n,Env);
nexttile; plot(n,Note_m);
nexttile; plot(f4,abs(fft(Note_m)));
f4c=([0:3999]-2000)./4000*Fs;
nexttile; plot(f4c,fftshift(abs(fft(Note_m))));
