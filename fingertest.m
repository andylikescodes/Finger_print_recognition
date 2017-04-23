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
% with local bw - 8x8 block
% [m,n] = size(J);
% msize = 4;
% mask = ones(msize,msize)*1/(msize*msize);
% new_J = ones(m,n);
% for i=msize/2:m-msize/2
%     for j=msize/2:m-msize/2
%         mask_mean = sum(sum(double(J(i-(msize/2-1):i+msize/2, j-(msize/2-1):j+msize/2)).*double(mask)));
%         new_J(i-(msize/2-1):i+msize/2, j-(msize/2-1):j+msize/2) = J(i-(msize/2-1):i+msize/2, j-(msize/2-1):j+msize/2) > mask_mean;
%         
%     end
% end
new_J_4 = localbinerizer(J, 4);

figure;
showgray(new_J_4);
title(sprintf('local binarized %d', 4));

new_J_6 = localbinerizer(J, 6);

figure;
showgray(new_J_6);
title(sprintf('local binarized %d', 6));

new_J_8 = localbinerizer(J, 8);

figure;
showgray(new_J_8);
title(sprintf('local binarized %d', 8));

new_J_10 = localbinerizer(J, 10);

figure;
showgray(new_J_10);
title(sprintf('local binarized %d', 10));

new_J_12 = localbinerizer(J, 12);

figure;
showgray(new_J_12);
title(sprintf('local binarized %d', 12));


%apply thinning:
% J_bw_thin = bwmorph(new_J,'thin',Inf);
% figure;
% showgray(J_bw_thin);
% title('thinning');



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

