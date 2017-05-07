clear;
I = imread('finger1.png');

I1 = im2bw(I, 0.5);

figure;
showgray(I);


I2 = medfilt2(I1,[5,5]);
figure;
showgray(I2);

%flip black and white for thining
I_comp = imcomplement(I2);

%apply thinning:
I_thin = bwmorph(I_comp,'thin',Inf);
figure;
showgray(I_thin);
title('thinning');
%showgray(I);

%find minutia:
[bifu, term] = findMinutia(I_thin);
figure;
showgray(I_thin);
hold on;

% find the average interidge distance L
L = interidgelength(I_thin);

%If a termination and a bifucation is less than L 
%and they are on the same ridge, remove both of them
false_bifu = [];
false_term = [];
for i = 1:length(bifu)
    for j = 1:length(term)
        temp_l = sqrt(sum((bifu(i,:)-term(j,:)).^2));
        if temp_l <=L && sameridgecheck(bifu(i,:),term(j,:),I_thin)
         
            false_bifu = [false_bifu;bifu(i,:)];
            break;
        end
    end
end

for i = 1:length(term)
    for j = 1:length(bifu)
        temp_l = sqrt(sum((bifu(j,:)-term(i,:)).^2));
        if temp_l <=L && sameridgecheck(bifu(j,:),term(i,:),I_thin)
         
            false_term = [false_term;term(i,:)];
            break;
        end
    end
end

true_bifu = eliminatefalse(bifu,false_bifu);
true_term = eliminatefalse(term,false_term);

% if two bifucation and terminations are less than D and on the same ridge, remove them
false_bifu_2 = [];
false_term_2 = [];
for i = 1:length(true_bifu)
    for j = 1:length(true_bifu)
        if i == j
            continue;
        end
        temp_l = sqrt(sum((true_bifu(i,:)-true_bifu(j,:)).^2));
        if temp_l <= L && sameridgecheck(true_bifu(i,:),true_bifu(j,:),I_thin)
            false_bifu_2 = [false_bifu_2;true_bifu(i,:)];
            break;
        end
    end
end

for i = 1:length(true_term)
    for j = 1:length(true_term)
        if i == j
            continue;
        end
        temp_l = sqrt(sum((true_term(i,:)-true_term(j,:)).^2));
        if temp_l <= L && sameridgecheck(true_term(i,:),true_term(j,:),I_thin)
            false_term_2 = [false_term_2;true_term(i,:)];
            break;
        end
    end
end

true_bifu_2 = eliminatefalse(true_bifu,false_bifu_2);
true_term_2 = eliminatefalse(true_term,false_term_2);

%plot bifucation on plot
x = true_bifu_2(:,1);
y = true_bifu_2(:,2);

plot(y,x,'r+', 'MarkerSize', 5);

%plot termination on plot
w = true_term_2(:,1);
v = true_term_2(:,2);

plot(v,w,'g+', 'MarkerSize', 5)







