function [bifu, term] = findMinutia(I)
% concept of crossing number (CN)

[m,n] = size(I);

bifu = [];
term = [];
for i = 2:(m-1)
    for j = 2:(n-1)
        if I(i,j) == 1
            if ~checkTriple(i,j, bifu)
                mask=I(i-1:i+1, j-1:j+1);
                neighbor = sum(sum(I(i-1:i+1, j-1:j+1)))-1;
                if neighbor == 3
                    bifu = [bifu; i j];
                elseif neighbor == 1 && ~checkEdge([i,j], I)
                    term = [term; i,j];
                end
            end
        end
    end
end

