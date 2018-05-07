clear all

%enter b
Bvals = 1:1:50;

n = 1000; % number of resource sites 
x0 = 100; %initial population number
t = 200;%simulate to t = 200
count = 0;
reps = 100;
hrange = 0:100:10000;

for b = Bvals
    yall = [];
    count = count + 1
    
    for i = 1:1:reps
        y = sim_population(n,x0,t,b);
        y_end = y(end);
        y_store = y((end/2+1):end);
        yall = [yall,y_store];
        %take the last half of the simulation
    end
    
    % take histogram
    histu(count,:) = hist(yall,hrange);
end


figure2 = figure('position', [0, 0, 700, 500]);
imagesc(Bvals,hrange,histu'/(reps*t/2), [0 0.1])
%normalize the display
colormap jet
colorbar
xlabel('b','FontSize',14)
ylabel('total population','FontSize',14)
title('population simulation phase transition', 'FontSize', 16)
title(sprintf('population simulation phase transition numreps = %s for each b', string(reps)),'FontSize',16)


saveas(figure2,'q1_smallp.png');