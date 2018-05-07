
function [x,y,T,op,s1,s2] = test43_hunt(J,N,e,L,movie,k1,k2,cf)
%% this function simulate the particle movement
% J(200) total time steps 200
% N(40) Number of particles 40 
% e(0.5) is eta the noise parameter, whose maximum value is 2*pi, 0.5
% L(10) is the size of the domain on which the particles can move
% movie(1 or 0) to make movie or not
% k1 is the influence neighbours for the first group
% k2 is the influence neighbours for the second group
% cf is the force effect towards the center of mass
%J=200;N=40;e=0.5;L=10;movie=1;k1=10;k2=3;cf=0;
%Set up movie

figure('position', [0, 0, 700, 600])
makemovie = movie;
if makemovie == 1
myv = VideoWriter('hunting5.avi');
myv.FrameRate = 10;
open(myv);
set(gca,'nextplot','replacechildren'); 
end


%movien = avifile('Vicsekmovie','FPS',3,'compression','none')
UJ=1;   
%Rate at which film is updated

t=1/J; %Size of one time step

r=0.5;%The radius of eating
fast = 1.2;

v=0.5; %v is the speed at which the particles move
vp = v * fast;

% x(i,j) gives the x coordinate of the ith particle at time j
x=zeros(N,J+1);
x(:,1)=L*rand(N,1); %define initial x coordiantes of all particles
px = [];
px(1) = L*rand();%predator x

% y(i,j) gives the y coordinate of the ith particle at time j
y=zeros(N,J+1);
y(:,1)=L*rand(N,1); %define initial y coordiantes of all particles
py = [];
py(1) = L*rand(); %predator y

% T(i,j) gives the angle with the x axis of the direction of motion of the ith
% particle at time j
T=zeros(N,J+1);
op = [];
T(:,1)=2*pi*rand(N,1); %define initial direction of all particles
dirp = [];
dirp(1) = 2*pi*rand();

ssin = sum(sin(T(:,1)));
scos = sum(cos(T(:,1)));
op(1) = (1/N) * sqrt(ssin^2 + scos^2);
%For all time steps
for j=1:1:J %iterate in time
    %For each particle
    D = distance(x,y,j,N);
    [B,I] = sort(D);
    big_n = I(2:k1+1,:); %found our nearest 10 neighbours for each one
    small_n = I(2:k2+1,:); %found our nearest 3 neighbours for each one
    xc = nanmean(x(:,j)); %center of mass x
    yc = nanmean(y(:,j)); %center of mass y
    
    dirp(j+1) = atan2(yc - py(j), xc - px(j));
    
    px(j+1) = px(j) + vp * cos(dirp(j+1));
    py(j+1) = py(j) + vp * sin(dirp(j+1));
    
    for i=1:1:round(N/2)
        %the group that depends on larger number of neighbours
        
            %get the current distance vector  
            neighbour = big_n(:,i);
            tn = []; % the neighbour direction
            for m = 1:1:length(neighbour)
                tn(m) = T(neighbour(m),j);
            end
   
            
            fcenter = 0;
            %location of center
            ss = nansum(sin(tn)) + sin(fcenter)*cf;
            sc = nansum(cos(tn)) + cos(fcenter)*cf;
            
            S = atan2(ss,sc);
                              
            T(i,j+1)=S+e*(rand-0.5); %adds noise to the measured angle

            x(i,j+1)=x(i,j)+v*cos(T(i,j+1)); %updates the particles' x-coordinates
            y(i,j+1)=y(i,j)+v*sin(T(i,j+1)); %updates the particles' y coordinates

            % Jumps from the right of the box to the left or vice versa
            x(i,j+1)=mod(x(i,j+1),L);

            %Jumps from the top of the box to the bottom or vice versa
            y(i,j+1)=mod(y(i,j+1),L);
    end
    
    
    
    for i=round(N/2)+1:1:N
        %the group that depends on small number of neighbours
        
            %get the current distance vector  
            neighbour = small_n(:,i);
            tn = []; % the neighbour direction
            for m = 1:1:length(neighbour)
                tn(m) = T(neighbour(m),j);
            end
   
            
            
            fcenter = atan2(yc-y(i,j),xc-x(i,j));
            fcenter = 0;
            %location of center
            ss = nansum(sin(tn)) + sin(fcenter)*cf;
            sc = nansum(cos(tn)) + cos(fcenter)*cf;
            
            S = atan2(ss,sc);
                              
            T(i,j+1)=S+e*(rand-0.5); %adds noise to the measured angle

            x(i,j+1)=x(i,j)+v*cos(T(i,j+1)); %updates the particles' x-coordinates
            y(i,j+1)=y(i,j)+v*sin(T(i,j+1)); %updates the particles' y coordinates

            % Jumps from the right of the box to the left or vice versa
            x(i,j+1)=mod(x(i,j+1),L);

            %Jumps from the top of the box to the bottom or vice versa
            y(i,j+1)=mod(y(i,j+1),L);
    end
    
    %Plot particles
    Dp = distance_predator(x,y,j,N,px,py);
    
    for ii = 1:1:N
        
            if Dp(ii) < r
                x(ii,j+1) = NaN;
                y(ii,j+1) = NaN;
            end
        
    end
    
    
    if makemovie
        for i= 1:1:round(N/2)
            if abs(x(i,j)-x(i,j+1))<v && abs(y(i,j)-y(i,j+1))<v
                	plot([x(i,j), x(i,j+1)] ,[y(i,j),y(i,j+1)],'g-','markersize',4) %plots the first half of the particles in black
                    axis([0 L 0 L]);
                    hold on
                    %plot([px(j) px(j+1)],[py(j) py(j+1)],'r-','markersize',4) %plot the predator
                    plot(x(i,j+1),y(i,j+1),'g.','markersize',10)
                    %plot(px(j+1),py(j+1),'rd','markersize',10)
                    xlim([0 L])
                    ylim([0 L])
                    xlabel('X position')
                    ylabel('Y position')
                    title({'hunting game';'Green: movement depends on 10 neighbours';'Black: movement depends on 3 neighbours';'Red:Predator'},'FontSize',16);
                    
            end
        end
        
        for i = round(N/2)+1:1:N
            if abs(x(i,j)-x(i,j+1))<v && abs(y(i,j)-y(i,j+1))<v
                	plot([x(i,j), x(i,j+1)] ,[y(i,j),y(i,j+1)],'k-','markersize',4) %plots the first half of the particles in black
                    axis([0 L 0 L]);
                    
                    plot([px(j) px(j+1)],[py(j) py(j+1)],'r-','markersize',4) %plot the predator
                    plot(x(i,j+1),y(i,j+1),'k.','markersize',10)
                    plot(px(j+1),py(j+1),'rd','markersize',10)
                    xlim([0 L])
                    ylim([0 L])
                    xlabel('X position')
                    ylabel('Y position')
                    title({'hunting game';'Green: movement depends on 10 neighbours';'Black: movement depends on 3 neighbours';'Red:Predator'},'FontSize',16);
            end
        end
            
            
        
    end
    
    %{
    ssin = sum(sin(T(:,j+1)));
    scos = sum(cos(T(:,j+1)));
    op(j+1) = (1/N) * sqrt(ssin^2 + scos^2);
    %}
    if makemovie
        frame = getframe(gcf);
        writeVideo(myv,frame);

        hold off
        %pause(0.1)
         
 
        M(j)=getframe; %makes a movie fram from the plot
        
        %movien = addframe(movien,M(j)); %adds this movie fram to the movie
    end
 

end

if makemovie ==1     
close(myv); %finishes the movie
end

for t = 1:1:J

    
    s1(t) = N/2 - sum(isnan(x(1:round(N/2),t)));
    s2(t) = N/2 - sum(isnan(x(round(N/2)+1:end,t)));
    
end

end

