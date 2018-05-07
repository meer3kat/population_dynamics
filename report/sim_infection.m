clear all

n = 5000; %number of people
A = zeros(n,n); %initial network
p = 0.0016; %connection probability

for i = 1:1:n
    for j = i+1:1:n
        if rand < p
            A(i,j) = 1;
            A(j,i) = 1;% create network one by one
        end
    end
end

infected_start = randperm(n,100); % the infected ones
infected_vector = zeros(n,1);
for i = 1:1:length(infected_start)
    infected_vector(infected_start(i)) = 1;
end
y0 = sum(infected_vector);
b0 = infected_vector;
ps = 0.001:0.001:0.01;
r = 0.03;
j = 0;

for pe = ps
    j = j+1
    infected_start = randperm(n,100); % the infected ones
    infected_vector = zeros(n,1);
    for i = 1:1:length(infected_start)
        infected_vector(infected_start(i)) = 1;
    end
    
    y0 = sum(infected_vector);
    b0 = infected_vector;
    
    for t = 1:1:1000
        b1 = infection_transit(A,b0,n,pe,r);
        y(j,t) = sum(b1);
        b0 = b1;
    end

end


save('resultp10run')
    
plot(y)