clear

load('Q3_3network')

%degree_nw the degree of the connect
max_degree = max(degree_nw);
h = 0;
ii = 0;
hr(1) = 1;


while h < max_degree
    ii = ii + 1;
    h = 2^ii;
    hr = [hr h]; %for our histogram
end


phis = hist(degree_nw,hr);

figure1 = figure('position', [0, 0, 700, 500]);

bar(histu)
set(gca, 'XScale', 'log')
set(gca, 'YScale', 'log')

xlabel('Degree of connection','FontSize',14)
ylabel('Number of students','FontSize',14)

title({'Histogram for degree of connection for preferential network on log log scale'}, 'FontSize', 16)
saveas(figure1,'p_nw2.png');




figure2 = figure('position', [0, 0, 700, 500]);
loglog(hr,phis,'b*-','markersize',10);
grid on
xlabel('Degree of connection','FontSize',14)
ylabel('Number of students','FontSize',14)
set(gca, 'XTick',[hr])
title({'loglog plot of degree of connection for preferential network'}, 'FontSize', 16)
saveas(figure2,'p_nw.png');
