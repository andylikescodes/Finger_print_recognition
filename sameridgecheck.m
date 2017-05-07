function bool = sameridgecheck(bifu,term, image)
% A function to check if the bifucation and termination are
% on the same ridge

bifu_x = bifu(1);
bifu_y = bifu(2);
term_x = term(1);
term_y = term(2);

[m,n] = size(image);
imgpix = m*n;

D1 = bwdistgeodesic(image, bifu_y, bifu_x, 'quasi-euclidean');
D2 = bwdistgeodesic(image, term_y, term_x, 'quasi-euclidean');

D = D1+D2;
D(isnan(D))=inf;

path = imregionalmin(D);
bool = sum(sum(path)) < imgpix;
