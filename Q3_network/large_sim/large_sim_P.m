clear all

% to simulate infection with preferential network
sim_t = 10; %want to get different network matrix A
n = 5000; %population
final_t = 1000; % simulate for 1000 time steps

ps = 0.001:0.001:0.01;
y = zeros(length(ps), final_t);

for st = 1:1:sim_t
    st
    A = p_network(n);
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
    
        for t = 1:1:final_t
            b1 = infection_transit(A,b0,n,pe,r);
            y(j,t) = y(j,t)+sum(b1);
            b0 = b1;
        end
    end
end
    

final_y = y/sim_t;
plot(final_y')
save('result_sim10_pn')
    
    
    
    







