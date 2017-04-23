function flag = checkEdge(point, I)

flag = false;
[m,n] = size(I);
sum_left = sum(I(point(1), 1:point(2)-1));
sum_right = sum(I(point(1), point(2)+1:n));

if sum_left == 0 || sum_right ==0
    flag = true;
end