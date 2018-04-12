function y = sim_population(n,population_number,final_t,b)
%n is the number of resources sites
%start with initialize our start condition generation 1;
y = zeros(n,final_t);
y(:,1) = get_initial(n,population_number);

for t = 2:1:final_t
    y(:,t) = next_generation(y(:,t-1),n,b);
end
    
end

