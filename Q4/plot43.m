clear 
close all


figure2 = figure('position', [0, 0, 700, 500]);

subplot(2,2,1)
load('run431.mat')
s1mean(1,:) = mean(ss1);
s2mean(1,:) = mean(ss2);

plot(s1mean(1,:),'g');
hold on
plot(s2mean(1,:),'k');
xlabel('t','FontSize',10)
ylabel('number of particles in each group','FontSize',10)
legend('k1 = 10','k2 = 2')
title({'Hunting game';'k1 = 10, k2 = 2'}, 'FontSize', 12)


subplot(2,2,2)
load('run432.mat')
s1mean(2,:) = mean(ss1);
s2mean(2,:) = mean(ss2);


plot(s1mean(2,:),'g');
hold on
plot(s2mean(2,:),'k');
xlabel('t','FontSize',10)
ylabel('number of particles in each group','FontSize',10)
legend('k1 = 8','k2 = 4')
title({'Hunting game';'k1 = 8, k2 = 4'}, 'FontSize', 12)



subplot(2,2,3)

load('run433.mat')
s1mean(3,:) = mean(ss1);
s2mean(3,:) = mean(ss2);

plot(s1mean(3,:),'g');
hold on
plot(s2mean(3,:),'k');
xlabel('t','FontSize',10)
ylabel('number of particles in each group','FontSize',10)
legend('k1 = 9','k2 = 3')
title({'Hunting game';'k1 = 9, k2 = 3'}, 'FontSize', 12)





subplot(2,2,4)

load('run434.mat')
s1mean(4,:) = mean(ss1);
s2mean(4,:) = mean(ss2);



plot(s1mean(4,:),'g');
hold on
plot(s2mean(4,:),'k');
xlabel('t','FontSize',10)
ylabel('number of particles in each group','FontSize',10)
legend('k1 = 20','k2 = 3')
title({'Hunting game';'k1 = 20, k2 = 3'}, 'FontSize', 12)



saveas(figure2,'hunt.png');