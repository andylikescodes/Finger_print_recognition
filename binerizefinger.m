I = rgb2gray(imread('FingerPrint1.jpg'));

I_bw = I < 45;

colormap(gray);
imagesc(I_bw);