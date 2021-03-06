clear all;
close all;

N = 100; % initial number of individuals

G = ones(1,N);

r = 0.01; %p for split
ft = 1000;%final time step

result = [];
i = 0;
hrange = [];
hrange(1) = 1;
h = 0;

while h < 100
    i = i + 1;
    h = 2^i;
    hrange = [hrange h]; %for our histogram
end
ngroup = 0;    

for j = 1:1:100
    j;

    for t = 1:1:ft
    
        pick = ceil(rand()*length(G)); 

        if G(pick) == 1
            G = join_group(G,pick);
        elseif rand() < r*G(pick)
            G = split_group(G,pick);
        end
        ngroup = ngroup + length(G);
        
        %storeh(t,:)=hist(G,[1:50])'; 
        %imagesc(storeh, [0 20])
        
        
    end
    result= [result G];%take the result when it is stable 
end
histu = hist(result,hrange);
nhistu = histu/sum(histu); %frequency distribution 

if nhistu(end) == 0
    nhistu = nhistu(1:end-1);
    hrange = hrange(1:end-1);
end


figure2 = figure('position', [0, 0, 700, 500]);
loglog(hrange,nhistu,'r*','markersize',20)
hold on
grid on
p = polyfit(log(hrange), log(nhistu), 1);
y_hat = exp(p(1) * log(hrange) + p(2));
loglog(hrange, y_hat,'r')
xlabel('Group size','FontSize',14)
set(gca, 'XTick', hrange)
set(gca, 'YTick', [0.0001 0.001 0.01 0.1 0.25 0.5 1])
ylabel('Relative Frequency','FontSize',14)
title({'log-log plot of group size vs relative frequency'}, 'FontSize', 16)
saveas(figure2,'loglog1.png');

hrange2 = 1:1:100;
histu2 = hist(result,hrange2);
nhistu2 = histu2/sum(histu2);

figure3 = figure('position', [0, 0, 700, 500]);
loglog(hrange2,histu2,'r','markersize',15)
hold on
grid on
%p = polyfit(log(hrange), log(nhistu), 1);
%y_hat = exp(p(1) * log(hrange) + p(2));
%loglog(hrange, y_hat,'r')
xlabel('Group size','FontSize',14)
set(gca, 'XTick', [hr])
%set(gca, 'YTick', [0.0001 0.001 0.01 0.1 0.25 0.5 1])
ylabel('Frequency','FontSize',14)
title({'log log plot of group size vs frequency'}, 'FontSize', 16)
saveas(figure3,'loglog2.png');





