clear

load('Q3_5try1full.mat')


figure1 = figure('position', [0, 0, 700, 500]);
plot(y')
xlabel('Time','FontSize',14)
legend('p = 0.001','p = 0.002','p = 0.003','p = 0.004','p = 0.005','p = 0.006','p = 0.007','p = 0.008','p = 0.009','p = 0.01','location','eastoutside');
ylabel('Number of infected students','FontSize',14)
title({'Number of infected students over time in preferential network';'p = 0.001:0.001:0.01'}, 'FontSize', 16)

saveas(figure1,'pnwinf.png');


c = r./ps;
figure4 = figure('position', [0, 0, 700, 500]);
plot(c,y(:,1000),'r*-','markersize',10)
xlabel('r/p','FontSize',14)
%legend('p = 0.001','p = 0.002','p = 0.003','p = 0.004','p = 0.005','p = 0.006','p = 0.007','p = 0.008','p = 0.009','p = 0.01','location','eastoutside');
ylabel('Number of infected students','FontSize',14)
title({'Number of infected students vs r/p in preferential network'}, 'FontSize', 16)
saveas(figure4,'pnwprp.png');

