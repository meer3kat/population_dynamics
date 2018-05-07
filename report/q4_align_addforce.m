clear
close all

%Set up movie
fig=figure;
makemovie=1;
%movien = avifile('Vicsekmovie','FPS',3,'compression','none')

J=200; 
%Number of timestep t0 be used

UJ=1;   
%Rate at which film is updated


t=1/J; %Size of one time step

N=40; 
%Number of particles
cforce = 0.1; 
%the force that draw particles together
e=0.5; 
%e is eta the noise parameter, whose maximum value is 2*pi

r=1;

%The radius of influence of a particle

L=10;
%L is the size of the domain on which the particles can move

v=0.5; %v is the speed at which the particles move

% x(i,j) gives the x coordinate of the ith particle at time j
x=zeros(N,J+1);
x(:,1)=L*rand(N,1); %define initial x coordiantes of all particles
     
% y(i,j) gives the y coordinate of the ith particle at time j
y=zeros(N,J+1);
y(:,1)=L*rand(N,1); %define initial y coordiantes of all particles

% T(i,j) gives the angle with the x axis of the direction of motion of the ith
% particle at time j
T=zeros(N,J+1);
T(:,1)=2*pi*rand(N,1); %define initial direction of all particles
k = 4;
%For all time steps
for j=1:1:J %iterate in time
    %For each particle
    D = distance(x,y,j,N);
    [B,I] = sort(D);
    near_n = I(2:k+1,:); %found our nearest 4 neighbours for each one
    xc = mean(x(:,j)); %center of mass x
    yc = mean(y(:,j)); %center of mass y
    
    for i=1:1:N
        
            %get the current distance vector  
            neighbour = near_n(:,i);
            tn = []; % the neighbour direction
            for m = 1:1:length(neighbour)
                tn(m) = T(neighbour(m),j);
            end
            
            fcenter = atan2(yc-y(i,j),xc-x(i,j));
            %location of center
            ss = sum(sin(tn)) + sin(fcenter)*cforce;
            sc = sum(cos(tn)) + cos(fcenter)*cforce;
            
            S = atan2(ss,sc);
            
            
                              
            T(i,j+1)=S+e*(rand-0.5); %adds noise to the measured angle

            x(i,j+1)=x(i,j)+v*cos(T(i,j+1)); %updates the particles' x-coordinates
            y(i,j+1)=y(i,j)+v*sin(T(i,j+1)); %updates the particles' y coordinates

            % Jumps from the right of the box to the left or vice versa
            x(i,j+1)=mod(x(i,j+1),L);

            %Jumps from the top of the box to the bottom or vice versa
            y(i,j+1)=mod(y(i,j+1),L);

            %Plot particles
            
            if makemovie
                if abs(x(i,j)-x(i,j+1))<v & abs(y(i,j)-y(i,j+1))<v
                	plot([x(i,j), x(i,j+1)] ,[y(i,j),y(i,j+1)],'k-','markersize',4) %plots the first half of the particles in black
                    axis([0 L 0 L]);
                    hold on
                    plot(x(i,j+1) ,y(i,j+1),'k.','markersize',10)
                    xlabel('X position')
                    ylabel('Y position')
                    
                end
            end
            
    end
    if makemovie
        hold off
        M(j)=getframe; %makes a movie fram from the plot
        
        %movien = addframe(movien,M(j)); %adds this movie fram to the movie
    end
 
end

     
%movien = close(movien); %finishes the movie

