function D = distance_predator(x,y,t,N,px,py)
%compute the distance matrix at time t
D = [];
xx = x(:,t);
yy = y(:,t);
px = px(t);
py = py(t);
%extract the curent locations

for i = 1:1:N
    
        
        D(i) = sqrt((xx(i)-px)^2 + (yy(i) - py)^2);
        %if D(i,j) == NaN
         %   D(i,j) = 10000;
        %end
        

end

end

        

