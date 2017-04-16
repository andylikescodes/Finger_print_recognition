I = rgb2gray(imread('FingerPrint1.jpg'));

I_edge = edge(I, 'canny');

showgray(I_edge);

showgray(I);