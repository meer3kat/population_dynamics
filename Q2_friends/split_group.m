function G = split_group(G,pick)
%% this function to get a group split up
k = G(pick);
G = G([1:pick-1 pick+1:end]);
add = ones(1,k);
G = [G add];
end
