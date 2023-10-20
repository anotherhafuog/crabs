function [xJelly,yJelly,thetaJelly] = moveJelly(level, x, y, theta, size, height, width)
jellyMove = 50;
step = jellyMove + level;
yJelly = y + step;
xJelly = x;
thetaJelly = theta;
if (yJelly > height-10*size)
yJelly = size;
xJelly = rand * width;
endif
endfunction
