function [xCrab,yCrab,thetaCrab] = moveCrab(cmd,x,y,theta,height,width,size)
dTheta = pi/8;
dStep = 50;
if( cmd == "," ) %rotate right
xCrab = x;
yCrab = y;
thetaCrab = theta + dTheta;

elseif ( cmd == "i" ) %rotate left
xCrab = x;
yCrab = y;
thetaCrab = theta - dTheta;

elseif ( cmd == "k" ) %move back
xTemp = x - dStep*cos(theta);
yTemp = y - dStep*sin(theta);
if (isOnMap(xTemp,yTemp,width,height))
xCrab = xTemp;
yCrab = yTemp;
else
xCrab = x;
yCrab = y;
endif
thetaCrab = theta;

elseif ( cmd == "l" ) %move right
xTemp = x - dStep*sin(theta);
yTemp = y - dStep*cos(theta);
if (isOnMap(xTemp,yTemp,width,height))
xCrab = xTemp;
yCrab = yTemp;
else
xCrab = x;
yCrab = y;
endif
thetaCrab = theta;

elseif ( cmd == "j" ) %move left
xTemp = x + dStep*sin(theta);
yTemp = y + dStep*cos(theta);
if (isOnMap(xTemp,yTemp,width,height))
xCrab = xTemp;
yCrab = yTemp;
else
xCrab = x;
yCrab = y;
endif
thetaCrab = theta;

else % if none of the cases are true, set the new variables equal to the old inputs.
xCrab = x;
yCrab = y;
thetaCrab = theta;
endif
 endfunction
