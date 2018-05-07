function P = probability_vector(A,i)
    links = sum(A);
    links = links(1:i-1);
    
    for j = 1:1:i-1
        P(j) = links(j)/(2*(i-2));
    end
end
