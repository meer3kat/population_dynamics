function y = sim_population(n,p,t,b)
%% this function simlate the population with specific n, population, time, offspring
% output the vector
% n- number of resource site
% p- population at t0
% t- simulate the time step t
% b- number of offspring per 2 individual
% generate nxt matrix, where each row is the resource site, and each colomn
% is each time
y = zeros(n,t);
y(:,1) = get_initial(n,p); 

for t = 2:1:t
    y(:,t) = next_generation(y(:,t-1),n,b);
end
y = sum(y);
    
end

