clear all

n = 5000;
A = zeros(n,n);
p = 0.0016;

for i = 1:1:n
    for j = i+1:1:n
        if rand < p
            A(i,j) = 1;
            A(j,i) = 1;
        end
    end
end

dir = sum(A);

range = 1:1:max(dir);
histu = hist(dir,range);
nhistu = histu/sum(histu);

figure2 = figure('position', [0, 0, 700, 500]);
bar(nhistu)

xlabel('Degree of connection','FontSize',14)
ylabel('Frequency','FontSize',14)
title({'degree distribution'}, 'FontSize', 16)
%saveas(figure2,'randomf2.png');




k = (1/n)*sum(dir);

%save('try1')