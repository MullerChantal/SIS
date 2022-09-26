%% EXERCICE 1bis
figure;
close all; clearvars;
syms t; %création de la variable symbolique t
T=5;
s = @(t) t*rectangularPulse(0,T,t); % création du signal s dépendant de t
tiledlayout(3,1)
nexttile; fplot(s(t),[-10 10],'b'); % tracé en 'bleu' de s(t) entre -10 et 10
nexttile; fplot(s(3-t),[-10 10],'r');
nexttile; fplot(s((3+t)/2),[-10 10],'g');

%% EXERCICE 2bis
figure;
syms t; %création de la variable symbolique t
u = @(t) heaviside(t); % création du signal échelon u(t)
ramp = @(t) t*u(t); % création du signal rampe(t)
rect = @(t) rectangularPulse(-1/2,1/2,t) %création du signal rec(t)
tiledlayout(4,1)
nexttile; fplot(exp(-t)*u(t)*u(3-t),'b');
nexttile; fplot(sin(ramp(t)),[-5 10*pi],'r');
nexttile; fplot(ramp(sin(t)),[-5 10*pi],'r');
nexttile; fplot(rect(t/2-1),[-5 5],'b');

%% EXERCICE 3bis
figure;
syms t; %création de la variable symbolique t
u = @(t) heaviside(t); % création du signal échelon u(t)
ramp = @(t) t*u(t); % création du signal rampe(t)
x = @(t) ramp(t+1)-ramp(t)+u(t-1)-3*u(t-2)+ramp(t-2)-ramp(t-3)
tiledlayout(4,1)
nexttile; fplot(x(t),[-5 12],'b'); 
nexttile; fplot(x(2-t/3),[-5 12],'b');
nexttile; fplot(u(t+4)-u(t+1),[-5 12],'g');
nexttile; fplot(x(2-t/3)*(u(t+4)-u(t+1)),[-5 12],'r');



%% EXERCICE 1
figure;

syms t; %création de la variable symbolique t
T=5;
s = @(t) t*rectangularPulse(0,T,t); % création du signal s dépendant de t
tiledlayout(3,1)
nexttile; fplot(s(t),[-10 10],'b'); % tracé en 'bleu' de s(t) entre -10 et 10
nexttile; fplot(s(3-t),[-10 10],'r');
nexttile; fplot(s((3+t)/2),[-10 10],'g');

%% EXERCICE 2
figure;
syms t; %création de la variable symbolique t
u = @(t) heaviside(t); % création du signal échelon u(t)
rampe = @(t) t*u(t); % création du signal rampe(t)
rect = @(t) rectangularPulse(-1/2,1/2,t) %création du signal rec(t)
tiledlayout(4,1)
nexttile; fplot(exp(-t)*u(t)*u(3-t),'b');
nexttile; fplot(sin(rampe(t)),[-5 10*pi],'r');
nexttile; fplot(rampe(sin(t)),[-5 10*pi],'r');
nexttile; fplot(rect(t/2-1),[-5 5],'b');

%% EXERCICE 3
figure;
syms t; %création de la variable symbolique t
x = @(t) piecewise(t<-1,0,-1<=t<0,t+1,0<=t<1,1,1<=t<2,2,2<=t<3,-3+t,3<=t,0) %création du signal x(t)
u = @(t) piecewise(t<0,0,t>=0,1); % création du signal échelon u(t)
tiledlayout(4,1)
nexttile; fplot(x(t),[-5 12],'b'); 
nexttile; fplot(x(2-t/3),[-5 12],'b');
nexttile; fplot(u(t+4)-u(t+1),[-5 12],'g');
nexttile; fplot(x(2-t/3)*(u(t+4)-u(t+1)),[-5 12],'r');

%% Exemple TD1 sous Moodle
figure;
syms t; %création de la variable symbolique t
u = @(t) heaviside(t);                      % création du signal échelon u(t)
ramp = @(t) t*u(t);                         % création du signal rampe(t)
rect = @(t) rectangularPulse(-1/2,1/2,t)    %création du signal rec(t)
porte(t)= u(t)*u(2*pi-t);                         %création du signal porte(t)
tiledlayout(5,1)
nexttile; fplot(u(t),[-2 10],'b');
nexttile; fplot(ramp(t),[-2 10],'b');
nexttile; fplot(rect(t),[-2 2],'b');
nexttile; fplot(porte(t),[-2 10],'b');
nexttile; fplot(sin(t)*porte(t),[-pi 3*pi],'b');
ax = gca;
S = sym(ax.XLim(1):pi/2:ax.XLim(2));     % graduation pour fonction trigo
ax.XTick = double(S);
ax.XTickLabel = arrayfun(@texlabel,S,'UniformOutput',false);

