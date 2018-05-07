clear all;

N = 100; % initial number of individuals

G = ones(1,N);

r = 0.01;
ft = 1000;%final time step
hrange = 1:1:100; %for histogram
result = [];
gn = [];
reps = 100;

for j = 1:1:100
        j;

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
        gn = [gn length(G)];
end
 
histu = hist(result,hrange);   
nhistu = histu/sum(histu);
 
    
    %store the final group distribution



histu = hist(result,hrange);
%loglog(histu);
    
K = 1.6145;
c = 0.3805;
y_predict =[];

for ii = hrange
    y_predict(ii) = (K * c^ii) /ii;
end

save('findpi2.mat')

figure2 = figure('position', [0, 0, 700, 500]);
plot(hrange,nhistu,'r*')
hold on

plot(y_predict,'b')
xlabel('Group size','FontSize',14)


ylabel('Relative Frequency','FontSize',14)
legend('model data','master equation');
title({'comparison of our model and master equation'}, 'FontSize', 16)
saveas(figure2,'me1.png');






