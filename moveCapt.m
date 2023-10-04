function [ xCapt, yCapt, thetaCapt ] = moveCapt( cmd, x, y, theta,width,height);
dTheta = pi/8;
dStep = 50;
if( cmd == "w" ) %move forward
xTemp = x + dStep*cos(theta);
yTemp = y + dStep*sin(theta);
if (isOnMap(xTemp,yTemp,width,height))
xCapt = xTemp;
yCapt = yTemp;
else
xCapt = x;
yCapt = y;
endif
thetaCapt = theta;

elseif ( cmd == "d" ) %turn right
xCapt = x;
yCapt = y;
thetaCapt = theta + dTheta;

elseif ( cmd == "a" ) %turn left
xCapt = x;
yCapt = y;
thetaCapt = theta - dTheta;

else % if none of the cases are true, set the new variables equal to the old inputs.
xCapt = x;
yCapt = y;
thetaCapt = theta;
endif
endfunction
