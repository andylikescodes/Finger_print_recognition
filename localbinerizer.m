function new_J = localbinerizer(J, msize)

[m,n] = size(J);
mask = ones(msize,msize)*1/(msize*msize);
new_J = ones(m,n);
for i=msize/2:m-msize/2
    for j=msize/2:m-msize/2
        mask_mean = sum(sum(double(J(i-(msize/2-1):i+msize/2, j-(msize/2-1):j+msize/2)).*double(mask)));
        new_J(i-(msize/2-1):i+msize/2, j-(msize/2-1):j+msize/2) = J(i-(msize/2-1):i+msize/2, j-(msize/2-1):j+msize/2) > mask_mean;
        
    end
end