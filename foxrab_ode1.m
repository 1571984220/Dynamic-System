function  dzdt = foxrab_ode1(z,s_r ,s_f)
%z=[z1 z2 z3 z4],s_r is the initial speed of the rabbit,s_f is for fox
dzdt = zeros (4,1); %make  sure  the  output  is a 4*1 column  vector
%the dynamic system for rabbit
dzdt(1) = s_r*cos(pi/4);
dzdt(2) = s_r*sin(pi/4);
%the dynamic system for fox
if z(3) > 200 && z(1) <200 && intersection(z(1),z(2),z(3),z(4),-400)>=200%situation 1 happen
        dist1 = sqrt((200-z(3))^2+(-400-z(4))^2);% distance between fox and SW
        dzdt (3) = s_f*(200-z(3))/dist1;
        dzdt (4) = s_f*(-400-z(4))/dist1;
elseif z(3) < 200 && z(1) >200 && intersection(z(1),z(2),z(3),z(4),0)>=200%situation 2 happen
        dzdt (3) = 0;
        dzdt (4) = s_f;
else%the fox can see the rabbit
dist = sqrt((z(1)-z(3))^2+(z(2)-z(4))^2);% distance between fox and rabbit
dzdt (3) = s_f*(z(1)-z(3))/dist; % horizontal  velocity
dzdt (4) = s_f*(z(2)-z(4))/dist; % vertical  velocity
end
end


