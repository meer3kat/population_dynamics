clear all

%enter b
b = input('enter b: ');

n = 1000; % number of resource sites 
x0 = 1000; %initial population number
t = 200;%simulate to t = 200


for i = 1:1:100
    y(i,:) = sim_population(n,x0,t,b);
    
    
end

x = 1:1:t;
figure2 = figure('position', [0, 0, 700, 500]);
%for i = 1:1:100
    
    plot(y')
%end

xlabel('t','FontSize',14)
ylabel('total population','FontSize',14)
title('population simulation', 'FontSize', 16)

%saveas(figure2,'test1.png');