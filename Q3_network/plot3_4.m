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

c = 4;
for ii = 1:1:length(hrange)
    pk1(ii) = c/(ii * (ii+1) * (ii+2));
end

for ii = 1:1:length(hr)
    pk2(ii) = c/(hr(ii) * (hr(ii)+1) * (hr(ii)+2));
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
loglog(hrange,histu/n,'b*-','markersize',10);
grid on
hold on
loglog(hrange,pk1,'r')
xlabel('Degree of connection','FontSize',14)
ylabel('Relative frequency','FontSize',14)
legend('from network','from master equation')

title({'loglog plot of relative frequency for the degree of connection'}, 'FontSize', 16)
saveas(figure2,'p_nw34.png');
