clear all

%b = 50; %offspring per two individuals^&*()

n = 1000; % number of resource sites 
%first, lets get initial condition
x0 = 1000; %population number

%{
for k = 1:1:30
    x = next_generation(x,n,b);
end
%}
Bvals = [1:1:50];
numreps = 5;
final_t = 100;
count = 0;
hrange = 1:100:10000;
for b = Bvals
    yall = [];
    count = count + 1
    
    for rep = 1:numreps
        y = sim_population(n,x0,final_t,b);
        y_t = sum(y);
        y_end = y_t(1,end);
        y_store = y_t(1,(end-49:end));
        yall = [yall,y_store];
        
    end
    %take histogram
    histu(count,:) = hist(yall,hrange);
end


figure2 = figure('position', [0, 0, 700, 500]);
imagesc(Bvals,hrange,histu'/(numreps*50),[0 0.1])
%normalize it.
colormap jet
hlx=xlabel('b','FontSize',14)
hlx=ylabel('total population?','FontSize',14)
title('Phase transition plot', 'FontSize', 16)
colorbar
saveas(figure2,'phasetransition1.png');