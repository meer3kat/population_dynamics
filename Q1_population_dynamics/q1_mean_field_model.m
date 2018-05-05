clear all;

n = 1000;
a0 = n;

bval = [1 5 10 20 30 40 50]

for b = bval
    A(b,1) = a0;
    

    for i = 2:1:1000
        
        A(b,i) = b*n*poisspdf(2,A(b,i-1)/n);
    end
end

%plot(A')
