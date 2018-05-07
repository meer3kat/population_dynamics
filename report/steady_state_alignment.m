clear
close all

N = 40;
J = 200;
L = 10;
movie = 0;
cf = 0.1;
erange = 0.1:0.1:6;
reps = 10;


for k = 1:1:N-1
    k 
    yy = 0;
    for e = erange
        yy = yy+1;
        steady_a(k,yy) = 0;
        for r = 1:1:reps
        
            [x,y,T,op] = polarization(J,N,e,L,movie,k,cf);
            sizeop = length(op);
            ssalign = mean(op(round(sizeop/2):end));
            steady_a(k,yy) = steady_a(k,yy) + ssalign;
        end
        steady_a(k,yy) = steady_a(k,yy)/reps;
    end
end


save('ssatry2.mat')

        