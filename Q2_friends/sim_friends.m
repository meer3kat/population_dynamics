clear all;

N = 100; % initial number of individuals

G = ones(1,N);

r = 0.1;
ft = 2000;%final time step
hrange = 1:1:100; %for histogram
result = [];

for j = 1:1:100
    j

    for t = 1:1:ft
    
        pick = ceil(rand()*length(G)); 

        if G(pick) == 1
            G = join_group(G,pick);
        elseif rand() < r*G(pick)
            G = split_group(G,pick);
        end
        
        %storeh(t,:)=hist(G,[1:50])'; 
        %imagesc(storeh, [0 20])
        
        
    end
    result= [result G];
end
    histu = hist(result,hrange);
    loglog(histu);
    





