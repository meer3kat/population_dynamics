clear all;

n = 1000;
a0 = n;

bval = [5, 10, 15, 20, 35, 50];


for b = bval
    A(b,1) = a0;
    
    for i = 2:1:1000
        
        A(b,i) = b*n*poisspdf(2,A(b,i-1)/n);
    end
end

%p = [5, 10, 15, 20, 35, 50];
figure2 = figure('position', [0, 0, 700, 500]);
subplot(3,2,1)
plot(A(5,:))
xlabel('t','FontSize',10)
ylabel('total population','FontSize',10)
title({'Mean-field model for population';'b = 5'}, 'FontSize', 12)

subplot(3,2,2)
plot(A(10,:))
xlabel('t','FontSize',10)
ylabel('total population','FontSize',10)
title({'Mean-field model for population';'b = 10'}, 'FontSize', 12)

subplot(3,2,3)
plot(A(15,:))
xlabel('t','FontSize',10)
ylabel('total population','FontSize',10)
title({'Mean-field model for population';'b = 15'}, 'FontSize', 12)

subplot(3,2,4)
plot(A(20,:))
xlabel('t','FontSize',10)
ylabel('total population','FontSize',10)
title({'Mean-field model for population';'b = 20'}, 'FontSize', 12)

subplot(3,2,5)
plot(A(35,:))
xlabel('t','FontSize',10)
ylabel('total population','FontSize',10)
title({'Mean-field model for population';'b = 35'}, 'FontSize', 12)

subplot(3,2,6)
plot(A(50,:))
xlabel('t','FontSize',10)
ylabel('total population','FontSize',10)
title({'Mean-field model for population';'b = 50'}, 'FontSize', 12)


saveas(figure2,'meanfield_model.png');
 