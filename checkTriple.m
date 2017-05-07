function flag = checkTriple(i, j, list)

[m,n] = size(list);
flag = false;
bool = false;

neightbors = [i-1,j-1; i-1, j; i-1, j+1; i,j-1];
for k = 1:4
    if bool == true
        break;
    end
    for l = 1:m
        if bool == true
            break;
        end
        check = (neightbors(k,:) == list(l,:));
        if check(1)==1 && check(2)==1
            bool = true;
            flag = true;
            
        end
    end

end
