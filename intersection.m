function  inter = intersection(x1,y1,x2,y2,a)
%x coordinate of the intersection of the line through the 
% two points (x1,y1),(x2,y2)and the y=a
inter = x1+(((a)-(y1))/((y2-y1)/(x2-x1)));
end

