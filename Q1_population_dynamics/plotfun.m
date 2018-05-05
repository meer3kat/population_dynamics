clear all;

x = 0:0.01:10;
f1 = x.*exp(-x);
[B,I] = sort(f1);
fmax = max(f1);
figure
plot(x,f1)
hold on
plot(x(I(end)),f1(I(end)),'r*','MarkerSize',10)
plot([0 3],[fmax fmax])
text(0.5,0.38,{'f1(max) = 0.3679'})
xlabel('x','FontSize',14)
ylabel('f = x * exp(-x)','FontSize',14)


