function G = final_groups(G,ft,r)

for t = 1:1:ft
    
    pick = ceil(rand()*length(G)); 

    if G(pick) == 1
       G = join_group(G,pick);
    elseif rand() < r*G(pick)
        G = split_group(G,pick);
    end
    
end