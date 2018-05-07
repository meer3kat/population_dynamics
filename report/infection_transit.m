function y = infection_transit(A,b,n,p,r)
% A connection matrix
% b state vector (1 infected, 0 good)
% n number of population
% p constant related to infect
% r recover rate

y = zeros(n,1); %initial the next state
neighbours = zeros(n,1);
for i = 1:n
    if b(i) == 0
        neighbours(i) = A(i,:) * b;        
        pi(i) = 1 - exp(-p*neighbours(i));
        if rand < pi(i)
            y(i) = 1;
        else 
            y(i) = 0;
        end
    
    else
        if rand < r
            y(i) = 0;
        else
            y(i) = 1;
        end
    end   
end
end


    
