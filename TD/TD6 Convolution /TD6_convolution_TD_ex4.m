% Linear Convolution and Circular Convolution 

clearvars;
close all;

x = [2 1 0 -1 -2];
h = ones(1,7);

% Linear convolution
y= conv(x,h)

% Circular convolution
y_circ1 = cconv(x,h)           

% Circular convolution equal to linear convolution
y_circ2 = cconv(x,h,length(x)+length(h)-1)           

nexttile;
stem(0:length(y)-1,y)
nexttile;
stem(0:length(y_circ1)-1,y_circ1)
nexttile;
stem(0:length(y_circ2)-1,y_circ2)
