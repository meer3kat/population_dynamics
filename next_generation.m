function y = next_generation(x,n,b)
%% this function gets the next_generation column vector 
%x is the current population vector at each location 
%n is the number of locations
%b is the number of offspring per 2 individual

y = zeros(n,1); % initialize our next generation vector

    for i = 1:1:n
        if x(i) == 2 % only care about if y(i) is exactly 2
            for j = 1:1:b 
                loc = randi(n);%change the random number generator
                y(loc) = y(loc) + 1;
            end
        end
    end
    
end

%{
tips from teacher
loc=ceil(rand(b,1)*n)
y(loc)=y(loc)+1
%}



    
    
    