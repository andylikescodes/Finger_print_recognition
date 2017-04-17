clc;
clf;
clear;

I = imread('f0001_01.png');

figure;
showgray(I)
title('original image');

%apply median filter
I_median_filter = medfilt2(I);
figure;
showgray(I_median_filter);
title('median filter');

%plot histogram
figure;
histogram(I_median_filter);
title('histogram after median filter');

%apply laplacian image enhancement
mask = [1 1 1; 1 -8 1; 1 1 1];
lap = imfilter(I_median_filter,mask);
lapI = I_median_filter - lap;
figure;
showgray(lapI);
title('laplacian image enhancement');

%histogram flattening
J = histeq(lapI);
figure;
showgray(J);
title('histogram flattening');

% figure;
% histogram(J);

% convert to bw - with thresholding
% J_bw = im2bw(J,0.5);
% figure;
% showgray(J_bw);
% with local bw - 16x16 block
[m,n] = size(J);
mask = ones(16,16)*1/(16*16);
new_J = ones(m,n);
for i=8:m-8
    for j=8:m-8
        mask_mean = sum(sum(double(J(i-7:i+8, j-7:j+8)).*double(mask)));
        new_J(i-7:i+8, j-7:j+8) = J(i-7:i+8, j-7:j+8) > mask_mean;
        
    end
end

figure;
showgray(new_J);
title('local binarized');

%apply thinning:
J_bw_thin = bwmorph(new_J,'thin',Inf);
figure;
showgray(J_bw_thin);
title('thinning');



%(881, 1534), (2948,1534), (881,2850), (2948,2850)
% 
% I_box = I(881:2948, 1534:2850);
% mask = [1 1 1; 1 -8 1; 1 1 1];
% 
% lap = imfilter(I_box,mask);
% lapI = I_box - lap;
% imagesc(lapI);

% subplot(2,2,1);
% histogram(I);
% 
% subplot(2,2,2);
% colormap(gray);
% imagesc(I);

% J = histeq(I);
% showgray(J);

% showgray(lapI);

