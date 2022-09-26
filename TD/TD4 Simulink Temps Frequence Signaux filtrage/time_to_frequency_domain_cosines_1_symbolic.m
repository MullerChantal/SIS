%% signal temps continu ex1 
close all;
F=[128 320 512]
A=[10 1 4]
syms t      				% symbolic toolbox
x= sin(2*pi*F*t) 		% continuous signal
sig=sum(A.*x)
figure;
nexttile;
fplot(sig,[0 1/64*4],'r','LineWidth',0.75);
axis([ 0 1/64*4 -15 15]);


% spectre du signal
syms  f w
% Continuous Fourier Transform
% Method 1:
X = fourier(sig,t,w);
X = subs(X,w,2*pi*f);
X = simplify(X)



