clc;
clf;
clear;

I = imread('f0002_05.png');

% subplot(2,2,1);
% histogram(I);
% 
% subplot(2,2,2);
% colormap(gray);
% imagesc(I);

% J = histeq(I);
% showgray(J);

mask = [1 1 1; 1 -8 1; 1 1 1];

lap = imfilter(I,mask);
lapI = I - lap;
imagesc(lapI);

% J_bw = im2bw(lapI,0.6);

%(881, 1534), (2948,1534), (881,2850), (2948,2850)
% 
% I_box = I(881:2948, 1534:2850);
% mask = [1 1 1; 1 -8 1; 1 1 1];
% 
% lap = imfilter(I_box,mask);
% lapI = I_box - lap;
% imagesc(lapI);

showgray(lapI);

