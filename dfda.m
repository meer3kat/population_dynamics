function y = dfda(n,b,a)
y = (b/(2*n)) * (2*a*exp(-a/n) - a*a*exp(-a/n)/n);
end