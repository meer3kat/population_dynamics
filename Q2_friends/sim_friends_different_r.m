clear all;

N = 100; % initial number of individuals

G = ones(1,N);

%r = 0.01;
ft = 1000;%final time step
hrange = 1:1:N; %for histogram
result = [];
reps = 200;
diffr = 0.001:0.001:0.1;
count = 0

for r = diffr
    count = count + 1
    result = [];
    for re = 1:1:reps
        G = final_groups(G,ft,r);
        %this is the final group size distribution
        result = [result G];
    end
    histu(count,:) = hist(result,hrange);
    %take the final step histogram
end

histu_mean = histu/reps;
%take the nomalized? 

loglog(histu_mean'); 

save('sim_friends_with20reps')





