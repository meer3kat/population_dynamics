clear all

%enter b
while 1
b = input('enter b: ');

n = 1000; % number of resource sites 
x0 = 200; %initial population number
t = 500;%simulate to t = 200

y = sim_population(n,x0,t,b);
x = 1:1:t;

figure2 = figure('position', [0, 0, 700, 500]);
plot(x,y,'b')
%normalize it.
xlabel('t','FontSize',14)
ylabel('total population','FontSize',14)
title('population simulation', 'FontSize', 16)
end

%saveas(figure2,'test1.png');