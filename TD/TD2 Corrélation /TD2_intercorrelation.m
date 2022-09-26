clear all; close all;

lim1=-2^6;
lim2=2^6;
M=7;
A=[1  1  1  1];
B=[1  1 -1 -1];
C=[1 -1  1 -1];
D=[1 -1 -1  1];
[n,x1] = NDiscreteImpulse(lim1,lim2,[A -A]);
code_x1=[A -A]
[n,x2]=  NDiscreteImpulse(lim1,lim2,[C C]);
code_x2=[C C]
[n,x3]= NDiscreteImpulse(lim1,lim2,[D D]);
code_x3=[D D] 

figure
tiledlayout(3,1)
nexttile;
stem(n,x1,'LineWidth',1.25 );
ylim([-2 2]);
xlim([-5 15]);
set(gca,'Box','on','FontSize',10,'Xgrid','on','YGrid','on','XMinorGrid','on','YMinorGrid','on','XMinorTick','on','YMinorTick','on');
xlabel('index');
ylabel('Signal');
title('x2[n]');

nexttile;
stem(n,x2,'LineWidth',1.25 );
ylim([-2 2]);
xlim([-5 15]);
set(gca,'Box','on','FontSize',10,'Xgrid','on','YGrid','on','XMinorGrid','on','YMinorGrid','on','XMinorTick','on','YMinorTick','on');
xlabel('index');
ylabel('Signal');
title('x2[n]');

nexttile;
stem(n,x3,'LineWidth',1.25 );
ylim([-2 2]);
xlim([-5 15]);
set(gca,'Box','on','FontSize',10,'Xgrid','on','YGrid','on','XMinorGrid','on','YMinorGrid','on','XMinorTick','on','YMinorTick','on');
xlabel('index');
ylabel('Signal');
title('x3[n]');

%% autocorrelation
figure
tiledlayout(3,1)
[Rx1x1,lag] = xcorr(x1,x1);
[Rx2x2,lag] = xcorr(x2,x2);
[Rx3x3,lag] = xcorr(x3,x3);
nexttile;
stem(lag,Rx1x1,'LineWidth',1.25 );
ylim([-10 10]);
xlim([-15 15]);
set(gca,'Box','on','FontSize',10,'Xgrid','on','YGrid','on','XMinorGrid','on','YMinorGrid','on','XMinorTick','on','YMinorTick','on');
xlabel('index');
ylabel('Signal');
title('Rx1x1[n]');
E1=Rx1x1(lag==0)

nexttile;
stem(lag,Rx2x2,'LineWidth',1.25 );
ylim([-10 10]);
xlim([-15 15]);
set(gca,'Box','on','FontSize',10,'Xgrid','on','YGrid','on','XMinorGrid','on','YMinorGrid','on','XMinorTick','on','YMinorTick','on');
xlabel('index');
ylabel('Signal');
title('Rx2x2[n]');

E2=Rx2x2(lag==0)
nexttile;
stem(lag,Rx3x3 ,'LineWidth',1.25);
ylim([-10 10]);
xlim([-15 15]);
set(gca,'Box','on','FontSize',10,'Xgrid','on','YGrid','on','XMinorGrid','on','YMinorGrid','on','XMinorTick','on','YMinorTick','on');
xlabel('index');
ylabel('Signal');
title('Rx3x3[n]');
E3=Rx3x3(lag==0)

%% intercorrelation
figure;
tiledlayout(3,2)
[Rx1x2,lag] = xcorr(x1,x2);
nexttile;
stem(lag,Rx1x2 ,'LineWidth',1.25);
ylim([-5 5]);
xlim([-15 15]);
set(gca,'Box','on','FontSize',10,'Xgrid','on','YGrid','on','XMinorGrid','on','YMinorGrid','on','XMinorTick','on','YMinorTick','on');
xlabel('index');
ylabel('Signal');
title('Rx1x2[n]');
E12=Rx1x2(lag==0)

[Rx2x1,lag] = xcorr(x2,x1);
nexttile;
stem(lag,Rx2x1 ,'LineWidth',1.25);
ylim([-5 5]);
xlim([-15 15]);
set(gca,'Box','on','FontSize',10,'Xgrid','on','YGrid','on','XMinorGrid','on','YMinorGrid','on','XMinorTick','on','YMinorTick','on');
xlabel('index');
ylabel('Signal');
title('Rx2x1[n]');
E21=Rx2x1(lag==0)

[Rx2x3,lag] = xcorr(x2,x3);
nexttile;
stem(lag,Rx2x3 ,'LineWidth',1.25);
ylim([-5 5]);
xlim([-15 15]);
set(gca,'Box','on','FontSize',10,'Xgrid','on','YGrid','on','XMinorGrid','on','YMinorGrid','on','XMinorTick','on','YMinorTick','on');
xlabel('index');
ylabel('Signal');
title('Rx2x3[n]');
E23=Rx2x3(lag==0)

[Rx3x2,lag] = xcorr(x3,x2);
nexttile;
stem(lag,Rx3x2 ,'LineWidth',1.25);
ylim([-5 5]);
xlim([-15 15]);
set(gca,'Box','on','FontSize',10,'Xgrid','on','YGrid','on','XMinorGrid','on','YMinorGrid','on','XMinorTick','on','YMinorTick','on');
xlabel('index');
ylabel('Signal');
title('Rx3x2[n]');
E32=Rx3x2(lag==0)

[Rx1x3,lag] = xcorr(x1,x3);
nexttile;
stem(lag,Rx1x3 ,'LineWidth',1.25);
ylim([-5 5]);
xlim([-15 15]);
set(gca,'Box','on','FontSize',10,'Xgrid','on','YGrid','on','XMinorGrid','on','YMinorGrid','on','XMinorTick','on','YMinorTick','on');
xlabel('index');
ylabel('Signal');
title('Rx1x3[n]');
E13=Rx1x3(lag==0)

[Rx3x1,lag] = xcorr(x3,x1);
nexttile;
stem(lag,Rx3x1 ,'LineWidth',1.25);
ylim([-5 5]);
xlim([-15 15]);
set(gca,'Box','on','FontSize',10,'Xgrid','on','YGrid','on','XMinorGrid','on','YMinorGrid','on','XMinorTick','on','YMinorTick','on');
xlabel('index');
ylabel('Signal');
title('Rx3x1[n]');
E31=Rx3x1(lag==0)

%% encodage 1 message pour 1 seul utilisateur (1 message pour l'utilisateur 1)
C1=[1 0 1 1 0 0 1 0 ];
msg1=[]
for i=1:length(C1)
    msg1=[msg1 C1(i)*code_x1]
end
figure;
tiledlayout(3,1)
[msg_decode1,lag]=xcorr(msg1,code_x1)
nexttile;
stem(lag,msg_decode1 ,'LineWidth',1.25);
ylim([-10 10]);
xlim([-15 80]);
set(gca,'Box','on','FontSize',10,'Xgrid','on','YGrid','on','XMinorGrid','on','YMinorGrid','on','XMinorTick','on','YMinorTick','on');
xlabel('index');
ylabel('Signal');
title('decoded msg 1');

[msg_decode2,lag]=xcorr(msg1,code_x2)
nexttile;
stem(lag,msg_decode2 ,'LineWidth',1.25);
ylim([-10 10]);
xlim([-15 80]);
set(gca,'Box','on','FontSize',10,'Xgrid','on','YGrid','on','XMinorGrid','on','YMinorGrid','on','XMinorTick','on','YMinorTick','on');
xlabel('index');
ylabel('Signal');
title('decoded msg 2');

[msg_decode3,lag]=xcorr(msg1,code_x3)
nexttile;
stem(lag,msg_decode3 ,'LineWidth',1.25);
ylim([-10 10]);
xlim([-15 80]);
set(gca,'Box','on','FontSize',10,'Xgrid','on','YGrid','on','XMinorGrid','on','YMinorGrid','on','XMinorTick','on','YMinorTick','on');
xlabel('index');
ylabel('Signal');
title('decoded msg 3');
%% Interet de l'intercorrelation pour la synchronisation ( donne le début du signal)
msg_delayed=[zeros(1,6) msg1]

figure;
tiledlayout(2,1)
[msg_delayed_decode1,lag]=xcorr(msg_delayed,code_x1)
nexttile;
stem(lag,msg_delayed_decode1 ,'LineWidth',1.25);
ylim([-10 10]);
xlim([-15 80]);
set(gca,'Box','on','FontSize',10,'Xgrid','on','YGrid','on','XMinorGrid','on','YMinorGrid','on','XMinorTick','on','YMinorTick','on');
xlabel('index');
ylabel('Signal');
title('decoded msg delayed 1');

msg_delayed_qcq=[[1 0 0 1 1 0] msg1]

[msg_delayed_qcq_decode1,lag]=xcorr(msg_delayed_qcq,code_x1)
nexttile;
stem(lag,msg_delayed_qcq_decode1 ,'LineWidth',1.25);
ylim([-10 10]);
xlim([-15 80]);
set(gca,'Box','on','FontSize',10,'Xgrid','on','YGrid','on','XMinorGrid','on','YMinorGrid','on','XMinorTick','on','YMinorTick','on');
xlabel('index');
ylabel('Signal');
title('decoded msg delayed qcq 1');

%% encodage 1 message pour 1 seul utilisateur (1 message pour l'utilisateur 2)
C2=[1 1 0 1 0 1 1 0 ];
msg2=[]
for i=1:length(C2)
    msg2=[msg2 C2(i)*code_x2]
end
figure;
tiledlayout(3,1)
[msg_decode1,lag]=xcorr(msg2,code_x1)
nexttile;
stem(lag,msg_decode1 ,'LineWidth',1.25);
ylim([-3 3]);
xlim([-15 80]);
set(gca,'Box','on','FontSize',10,'Xgrid','on','YGrid','on','XMinorGrid','on','YMinorGrid','on','XMinorTick','on','YMinorTick','on');
xlabel('index');
ylabel('Signal');
title('decoded msg 1');

[msg_decode2,lag]=xcorr(msg2,code_x2)
nexttile;
stem(lag,msg_decode2 ,'LineWidth',1.25);
ylim([-10 10]);
xlim([-15 80]);
set(gca,'Box','on','FontSize',10,'Xgrid','on','YGrid','on','XMinorGrid','on','YMinorGrid','on','XMinorTick','on','YMinorTick','on');
xlabel('index');
ylabel('Signal');
title('decoded msg 2');

% [msg_decode3,lag]=xcorr(msg2,code_x3)
% nexttile;
% stem(lag,msg_decode3 ,'LineWidth',1.25);
% ylim([-10 10]);
% xlim([-15 80]);
% set(gca,'Box','on','FontSize',10,'Xgrid','on','YGrid','on','XMinorGrid','on','YMinorGrid','on','XMinorTick','on','YMinorTick','on');
% xlabel('index');
% ylabel('Signal');
% title('decoded msg 3');




%% encodage 1 message  pour 3 utilisateurs en même temps
C1=[1 0 1 1 0 1 1 0 ];
msg1=[]
for i=1:length(C1)
    msg1=[msg1 C1(i)*code_x1]
end

C2=[1 1 0 1 0 1 1 0 ];
msg2=[]
for i=1:length(C2)
    msg2=[msg2 C2(i)*code_x2]
end

C3=[1 1 1 0 1 1 1 1 ]
msg3=[]
for i=1:length(C3)
    msg3=[msg3 C3(i)*code_x3]
end
msg=msg1+msg2+msg3

figure;
tiledlayout(4,1)

nexttile;
stem(0:length(msg)-1,msg ,'LineWidth',1.25);
ylim([-5 5]);
xlim([-15 80]);
set(gca,'Box','on','FontSize',10,'Xgrid','on','YGrid','on','XMinorGrid','on','YMinorGrid','on','XMinorTick','on','YMinorTick','on');
xlabel('index');
ylabel('Signal');
title('encoded msg');



nexttile;
[msg_decode1,lag]=xcorr(msg,code_x1)
stem(lag,msg_decode1 ,'LineWidth',1.25);
ylim([-10 10]);
xlim([-15 80]);
set(gca,'Box','on','FontSize',10,'Xgrid','on','YGrid','on','XMinorGrid','on','YMinorGrid','on','XMinorTick','on','YMinorTick','on');
xlabel('index');
ylabel('Signal');
title('decoded msg 1');


nexttile;
[msg_decode2,lag]=xcorr(msg,code_x2)
stem(lag,msg_decode2 ,'LineWidth',1.25);
ylim([-10 10]);
xlim([-15 80]);
set(gca,'Box','on','FontSize',10,'Xgrid','on','YGrid','on','XMinorGrid','on','YMinorGrid','on','XMinorTick','on','YMinorTick','on');
xlabel('index');
ylabel('Signal');
title('decoded msg 2');

nexttile;
[msg_decode3,lag]=xcorr(msg,code_x3)
stem(lag,msg_decode3 ,'LineWidth',1.25);
[msg_decode3,lag]=xcorr(msg,code_x3)
ylim([-10 10]);
xlim([-15 80]);
set(gca,'Box','on','FontSize',10,'Xgrid','on','YGrid','on','XMinorGrid','on','YMinorGrid','on','XMinorTick','on','YMinorTick','on');
xlabel('index');
ylabel('Signal');
title('decoded msg 3');


%% Déclaration de Fonctions
function [n,x]=NDiscreteImpulse(lim1,lim2,xinit)
n=lim1:lim2-1;
x=zeros(size(n));
for i=(1:length(xinit))
    x(n==i-1)=xinit(i);
end
end
