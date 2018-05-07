clear
close all

J=200;N=40;e=0.5;L=10;movie=0;
k1=20;k2=3;cf=0;

for i = 1:1:50
[x,y,T,op,s1,s2] = test43_hunt(J,N,e,L,movie,k1,k2,cf);
ss1(i,:) = s1;
ss2(i,:) = s2;
end

save('run434.mat')

            
            
    