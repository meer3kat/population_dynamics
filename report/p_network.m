function A = p_network(n)
% generate the preferential network
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
end
    
    
    
    
    
    
    






