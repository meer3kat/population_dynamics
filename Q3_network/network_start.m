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
bar(histu)
%grid on


k = (1/n)*sum(dir);

save('try1')