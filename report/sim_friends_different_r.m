clear all;

N = 100; % initial number of individuals

G = ones(1,N);

ft = 1000;%final time step
%hrange = 1:1:N; %for histogram
result = [];
reps = 100; %number of reps with each parameter
diffr = 0.001:0.001:0.1;
count = 0;
total=zeros(length(diffr),length(diffr)*reps);
hrange = [];
hrange(1) = 1;
h = 0;
ii = 0;
while h < 100
    ii = ii + 1;
    h = 2^ii;
    hrange = [hrange h]; %for our histogram
end


for r = diffr
    count = count + 1
    result = [];
    for re = 1:1:reps
        G = final_groups(G,ft,r);
        %this is the final group size distribution
        result = [result G];
    end
    histu(count,:) = hist(result,hrange);
    total(count,1:length(result)) = result;
    %take the final step histogram
end

histu_mean = histu/reps;
%take the nomalized? 

loglog(histu_mean'); 

save('sim_friends_try3')




