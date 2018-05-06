close all;
clear
load('sim_friends_with20reps');
i = 0;
hrange2 = [];
hrange2(1) = 1;
h = 0;


while h < 100
    i = i + 1;
    h = 2^i;
    hrange2 = [hrange2 h]; %for our histogram
end

histur = hist(result,hrange2);
nhistur = histur/sum(histur); %frequency distribution 

if nhistur(end) == 0
    nhistur = nhistur(1:end-1);
    hrange2 = hrange2(1:end-1);
end


figure2 = figure('position', [0, 0, 700, 500]);
loglog(hrange2,nhistur,'r*','markersize',20)
hold on
grid on
%p = polyfit(log(hrange), log(nhistur), 1);
%y_hat = exp(p(1) * log(hrange) + p(2));
%loglog(hrange, y_hat,'r')
xlabel('Group size','FontSize',14)
set(gca, 'XTick', hrange)
set(gca, 'YTick', [0.0001 0.001 0.01 0.1 0.25 0.5 1])
ylabel('Relative Frequency','FontSize',14)
title({'log-log plot of group size vs relative frequency'}, 'FontSize', 16)
saveas(figure2,'loglogdr.png');
%}