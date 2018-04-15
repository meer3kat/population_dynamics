clear all;

n = 1000; % number of resource sites 
x0 = 1000; %initial population number
t = 500;%simulate to t = 200


for b = 1:1:50
    x = get_initial(n,x0);

    lamda(1) = abs(dfda(n,b,x0));

    for i = 2:1:t
    
        x = next_generation(x,n,b);
        a = sum(x);
        lamda(i) = abs(dfda(n,b,a));
    end

    lya_exp(b) = (1/t)* sum(lamda);
end