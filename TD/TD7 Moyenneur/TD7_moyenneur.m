close all;
N=[10 100]
h1=1/N(1)*ones(1,N(1))
h2=1/N(2)*ones(1,N(2))

figure(1)
freqz(h1)
figure(2)
freqz(h2)

figure(3)
zplane(h1)
figure(4)
zplane(h2)

b1=1/N(1)*(-ones(1,N(1)+1)+[2 ones(1,N(1)-1) 0])
a1=[1 -1]
figure(5)
freqz(b1,a1)
figure(6)
zplane(b1,a1)

b2=1/N(2)*(-ones(1,N(2)+1)+[2 ones(1,N(2)-1) 0])
a2=[1 -1]
figure(7)
freqz(b2,a2)
figure(8)
zplane(b2,a2)

