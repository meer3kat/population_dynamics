clear all
close all
n = 5000; 
%{
s = randperm(n,2);

A = zeros(n,n);
A(s(1),s(2)) = 1;
A(s(2),s(1)) = 1;
%created the first link 
%}
A = zeros(n,n);
A(1,2) = 1;
A(2,1) = 1;
%link the first two students.

for i = 3:1:n
    links = sum(A);
    cum_links = cumsum(links);
    target = rand;
    p = probability_vector(A,i);
    tp = cumsum(p);
    k = find(tp>= target, 1);
    %found our link student
    A(k,i) = 1;
    A(i,k) = 1;
    %write our connect matrix
end

degree_nw = sum(A);
max_degree = max(degree_nw);
hrange = 1:1:max_degree;

histu = hist(degree_nw,hrange);
bar(histu);
loglog(histu);

%average degreee of network

ave_degree = (1/(n))*sum(sum(A));
    
    
    
    
    
    
    






