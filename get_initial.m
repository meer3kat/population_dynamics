function y = get_initial(n,population_number)
    y = zeros(n,1);
    for i = 1:1:population_number
        loc = randi(n);
        y(loc) = y(loc) + 1;
    end
end
