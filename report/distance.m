function D = distance(x,y,t,N)
%compute the distance matrix at time t
D = zeros(N,N);
xx = x(:,t);
yy = y(:,t);
%extract the curent location

for i = 1:1:N
    for j = i+1:1:N
        D(i,j) = sqrt((xx(i)-xx(j))^2 + (yy(i) - yy(j))^2);
        D(j,i) = D(i,j);
        

    end
end

end

        

