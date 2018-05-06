clear 
close all;
load('sim_friends_try3');
nhistu = histu./sum(histu,2); %frequency distribution
nhistu = nhistu(:,1:end-1);
hrange = hrange(1:end-1);

figure3 = figure('position', [0, 0, 700, 500]);


for j = [1 5 20 50 80 100]
    loglog(hrange,nhistu(j,:),'*-','markersize',8);
    hold on;
    %p = polyfit(log(hrange), log(nhistu(j,:)), 1);
    %y_hat = exp(p(1) * log(hrange) + p(2));
    %loglog(hrange, y_hat);
end


grid on
legend('r = 0.001','r = 0.005','r = 0.02','r = 0.05','r = 0.08','r = 0.1');
xlabel('Group size','FontSize',14)
set(gca, 'XTick', hrange)
set(gca, 'XTick', [hrange 100])
set(gca, 'YTick', [0.0001 0.001 0.01 0.1 0.25 0.5 1])
ylabel('Relative Frequency','FontSize',14)
title({'log-log plot of group size vs relative frequency with different r';'100 replications per parameter'}, 'FontSize', 16)
saveas(figure3,'logloggr100.png');

hold off

figure4 = figure('position', [0, 0, 700, 500]);
surf(hrange, diffr, nhistu)
shading interp
colorbar
colormap jet
set(gca, 'XScale','log')
xlabel('Group size','FontSize',14)
ylabel('r','FontSize',14)
zlabel('relative frequency','FontSize',14)
title({'heat map of group size vs relative frequency with different r';'100 replications per parameter'}, 'FontSize', 16)
saveas(figure4,'loglogheatmap.png');

