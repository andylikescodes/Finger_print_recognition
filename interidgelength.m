function L = interidgelength(image)
% A function to calculate the average distance 
% between each ridge

[m,n] = size(image);

mid_m = m/2;
mid_n = n/2;
ridge_n=[];
ridge_m=[];
length_n=[];
length_m=[];
counter = 0;
for i = 1:n
    if image(mid_m,i) == 1
        
        ridge_n = [ridge_n, i];
    end
end

for j = 1:m
    if image(j,mid_n) == 1
        ridge_m = [ridge_m, j];
    end
end

for k = 1:length(ridge_n)-1
    length_n = [length_n,ridge_n(k+1)-ridge_n(k)];
end

for l = 1:length(ridge_m)-1
    length_m = [length_m,ridge_m(l+1)-ridge_m(l)];
end

total = [length_n, length_m];
L = mean(total);