function lineHandle = drawLine (pointA, pointB, color)
%this function takes two points, pointA and pointB and a color and draws a line between them.
%With color color

%extract the x coords from the points
x = [pointA(1); pointB(1)];
y = [pointA(2); pointB(2)];

lineHandle = plot(x,y, color);
set(lineHandle,"LineWidth",3);
endfunction
