function [value , isterminal , direction] = foxrab_events(z,mindist ,burrow)
%stop the solver when rabbit is caught
value (1) = sqrt((z(1)-z(3))^2+(z(2)-z(4))^2) - mindist;
isterminal (1) = 1;
direction (1) = -1;% the event is triggered when "value(1)"changes from positive to negative
%stop the solver when rabbit reaches the burrow
value (2) = (burrow(1)-z(1));
isterminal (2) = 1;
direction (2) = -1;% the event is triggered when "value(2)"changes from positive to negative
end

