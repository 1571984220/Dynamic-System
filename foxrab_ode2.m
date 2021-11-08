function  dzdt = foxrab_ode2(z,s_r,s_f)
%z=[z1 z2 z3 z4 z5 z6],s_r is the initial speed of the rabbit,s_f is for fox
dzdt = zeros (6,1);%make  sure  the  output  is a 6*1 column  vector
sr = s_r*exp(-0.0008*z(5));%the speed of the rabbit
%the dynamic for rabbit
dzdt(1) = sr*cos(pi/4);
dzdt(2) = sr*sin(pi/4);
dzdt(5) = sqrt(dzdt(1)^2+dzdt(2)^2);
%the dynamic for fox
sf = s_f*exp(-0.0002*z(6));%the speed of the fox
%the dynamic for fox
if z(3) > 200 && z(1) <200 && intersection(z(1),z(2),z(3),z(4),-400)>=200
    dist1 = sqrt((200-z(3))^2+(-400-z(4))^2);% distance between fox and SW
    dzdt (3) = sf*(200-z(3))/dist1;
    dzdt (4) = sf*(-400-z(4))/dist1;
elseif z(3) < 200 && z(1) >200 && intersection(z(1),z(2),z(3),z(4),0)>=200
    dzdt (3) = 0;
    dzdt (4) = sf;
else
dist = sqrt((z(1)-z(3))^2+(z(2)-z(4))^2);% distance between fox and rabbit
dzdt (3) = sf*(z(1)-z(3))/dist; % horizontal  velocity
dzdt (4) = sf*(z(2)-z(4))/dist; % vertical  velocity
end
dzdt(6) = sqrt(dzdt(3)^2+dzdt(4)^2);
end

