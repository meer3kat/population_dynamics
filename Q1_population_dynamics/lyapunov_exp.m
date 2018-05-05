clear all;

n = 1000; % number of resource sites 
x0 = 1000; %initial population number
t = 500;%simulate to t = 500
%b = 15;

for b = 1:1:50
    
    b

    x_0 = get_initial(n,x0);
    x_1 = next_generation(x_0,n,b);
    delta_t = sum(x_1) - sum(x_0);
    %mid_val(1) = log(abs(delta_t/x0));
    x_0 = x_1;


    for i = 2:1:t
        x_1 = next_generation(x_0,n,b);
    
        delta_t1 = sum(x_1) - sum(x_0);
    
        mid_val(i) = log(abs(delta_t1/delta_t));
    
        delta_t = delta_t1;
        x_0 = x_1;
    end

    lya_exp(b) = (1/t) * sum(mid_val);
end


    
    
    
    

%{
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
%}