function G = join_group(G,pick)
%% pick a person/group and join them all to another join a group 
% p to join depends on groupsize = k/N

target = ceil(rand()*length(G));
P = cumsum(G);

k = find(P>=target,1);%find the index of the group to join

if k ~= pick %not join the existing group
    
    G(k) = G(k) + 1;%add one number
    G = G([1:pick-1 pick+1:end]);
else 
    G = G;
end
