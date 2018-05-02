clear all

n = 5000; 
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
    k = find(tp>= target, 1); %found our link student 
    A(k,i) = 1;
    A(i,k) = 1; %write our connect matrix
end


ps = 0.001:0.001:0.01;
r = 0.03;
j = 0;

for pe = ps
    j = j+1
    infected_start = randperm(n,100); % the infected ones
    infected_vector = zeros(n,1);%initial a state vector
    for i = 1:1:length(infected_start)
        infected_vector(infected_start(i)) = 1;
        %write the infected student one by one
    end
    
    y0 = sum(infected_vector);
    b0 = infected_vector;
    
    for t = 1:1:1000
        b1 = infection_transit(A,b0,n,pe,r);
        y(j,t) = sum(b1);
        b0 = b1;
    end

end
plot(y)

%{
degree_nw = sum(A);
max_degree = max(degree_nw);
hrange = 1:1:max_degree;

histu = hist(degree_nw,hrange);
bar(histu);
loglog(histu);

%average degreee of network

ave_degree = (1/(n*n))*sum(sum(A));
%}    
    
    
    
    
    
    






