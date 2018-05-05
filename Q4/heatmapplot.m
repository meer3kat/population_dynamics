load('ssatry1.mat')

figure2 = figure('position', [0, 0, 700, 500]);

imagesc(steady_a)
colormap jet
colorbar
xticks([10:10:60])
xticklabels({'1','2','3','4','5','6'})
xlabel('e noise','FontSize',14)
ylabel('number of neighbours that influence the direction','FontSize',14)
title('heat map of steady-state alignment', 'FontSize', 16)
%title(sprintf('population simulation phase transition numreps = %s for each b', string(reps)),'FontSize',16)


saveas(figure2,'heatmap.png');