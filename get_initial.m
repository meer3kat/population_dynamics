function y = get_initial(n,p)
%% this function gives the generation 0's location
% input: n- number of resources
%        p- the total number of population at t0.

    y = zeros(n,1);
    for i = 1:1:p
        loc = randi(n);
        y(loc) = y(loc) + 1;
    end
end
