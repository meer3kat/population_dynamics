clear all;
%need to compute average? 
n = 1000; % number of resource sites 
x0 = 1000; %initial population number
t = 500;%simulate to t = 500

% if lamda < 0 ,it converge
% if lamda > 0 ,it diverge



for b = 1:1:50
    b
    x = get_initial(n,x0);

    lamda(1) = abs(dfda(n,b,x0));

    for i = 2:1:t
    
        x = next_generation(x,n,b);
        a = sum(x);
        lamda(i) = log(abs(dfda(n,b,a)));
    end

    lya_exp(b) = (1/t)* sum(lamda);
end

plot(lya_exp)