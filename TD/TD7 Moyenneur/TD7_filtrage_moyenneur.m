close all;
[y,fs] = audioread('bach44100.wav');                   % read it from file
pause; % pause is neeeded to have time to listen to the sound...
disp('Press any key and to play the signal, read from file wav'); 
sound(y,fs);    

N=[10 100]
h1=1/N(1)*ones(1,N(1))
h2=1/N(2)*ones(1,N(2))

yfiltered1=conv(y,h1,'same');
yfiltered2=conv(y,h2,'same');

pause;
disp('Press any key and to play the fitered signal 1, read from file wav'); 
sound(yfiltered1,fs);   

pause;
disp('Press any key and to play the fitered signal 2, read from file wav'); 
sound(yfiltered2,fs); 

figure
t=(0:length(y)-1)*1/fs
plot(t,y,'r')
hold on
plot(t,yfiltered1,'b')
plot(t,yfiltered2,'g')