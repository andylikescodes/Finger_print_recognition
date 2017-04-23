I = imread('finger1.png');

I1 = im2bw(I, 0.5);

figure;
showgray(I);


I2 = medfilt2(I1,[5,5]);
figure;
showgray(I2);

%flip black and white for thining
I_comp = imcomplement(I2);

%apply thinning:
I_thin = bwmorph(I_comp,'thin',Inf);
figure;
showgray(I_thin);
title('thinning');
%showgray(I);

%find minutia:
[bifu, term] = findMinutia(I_thin);
figure;
showgray(I_thin);
hold on;

%plot bifucation on plot
x = bifu(:,1);
y = bifu(:,2);

plot(y,x,'r+', 'MarkerSize', 5);

%plot termination on plot
w = term(:,1);
v = term(:,2);

plot(v,w,'g+', 'MarkerSize', 5)
