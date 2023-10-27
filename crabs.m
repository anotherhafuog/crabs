function crabs (level)
% Crabs is a kids computer game where a fisherman, called the captain,
% hunts for a very clever and powerful crab.
% Draw the game map and initialize map dimensions.
[mapHeight , mapWidth] = drawMap( "BGImage.png" );
%initialize captain location, heading and size
xCapt = 1000;
yCapt = 500;
thetaCapt = -pi/2;
sizeCapt = 50;
healthCapt = 100;
crabsCaught = 0;
%initialize crab location, heading and size
xCrab = 1000;
yCrab = 1200;
thetaCrab = -pi/2;
sizeCrab = 50;
%initialize jelly fish
xJelly=rand*mapWidth;
yJelly=0;
thetaJelly = -pi/2;
sizeJelly = 25;
jellySting = 2;
% Draw the captain and initialize graphics handles
%*********************************************************
% Put your call to drawCapt() here ..... You must give drawCapt its
% input and output arguments.
[captGraphics,xNet,yNet] = drawCapt(xCapt,yCapt,thetaCapt,sizeCapt);
crabGraphics = drawCrab(xCrab,yCrab,thetaCrab,sizeCrab);
jellyGraphics = drawJelly(xJelly,yJelly,thetaJelly,sizeJelly);
%*******************************************************
% print health status
healthLoc = [100,100];
crabsCaughtLoc = [100,175];
healthStatus = text(healthLoc(1), healthLoc(2), strcat('Health = ', ...
num2str(healthCapt)), 'FontSize', 12, 'Color', 'red');
crabsCaughtStatus = text(crabsCaughtLoc(1), crabsCaughtLoc(2), ...
strcat('Crabs Caught = ',num2str(crabsCaught)), 'FontSize', 12, 'Color', 'red');
while(1)
%remove old and plot new health and points status to screen
delete(healthStatus);
delete(crabsCaughtStatus);
healthStatus = text(healthLoc(1), healthLoc(2), strcat('Health = ', ...
num2str(healthCapt)), 'FontSize', 12, 'Color', 'red');
crabsCaughtStatus = text(crabsCaughtLoc(1), crabsCaughtLoc(2),
strcat('Crabs Caught = ', ...
num2str(crabsCaught)), 'FontSize', 12, 'Color', 'red');
% erase old jellyfish
for i=1:length(jellyGraphics)
delete(jellyGraphics(i));
endfor
% move jellyfish
[xJelly,yJelly,thetaJelly] = moveJelly(level, xJelly, yJelly,thetaJelly, sizeJelly, mapHeight,mapWidth);
% draw jellyfish
jellyGraphics = drawJelly(xJelly,yJelly,thetaJelly,sizeJelly);
% read the keyboard
cmd = kbhit(1);
if (cmd == 'Q')
break;
endif
if( cmd == "w" || cmd == "a" || cmd == "d" ) %Captain has moved. Respond.
% erase old captain
for i=1:length( captGraphics )
set( captGraphics(i), 'Visible', 'off' );
endfor
% move capt
[xCapt, yCapt, thetaCapt] = moveCapt(cmd, xCapt, yCapt, thetaCapt, mapWidth, mapHeight);
% draw new capt
[captGraphics,xNet,yNet] = drawCapt(xCapt,yCapt,thetaCapt,sizeCapt);
elseif (cmd == "i" || cmd == "j" || cmd == "k" || cmd == "l" || cmd ==",") % respond crab moved
%erase old crab
for i=1:length(crabGraphics)
set(crabGraphics(i),'Visible','off');
endfor
%move crab
[xCrab,yCrab,thetaCrab] = moveCrab(cmd,xCrab,yCrab,thetaCrab,mapHeight,
mapWidth);
%draw new captain and crab
crabGraphics = drawCrab(xCrab,yCrab,thetaCrab,sizeCrab);
endif
if ( getDist(xJelly,yJelly,xCapt,yCapt) < 3*sizeCapt )
healthCapt = healthCapt - jellySting;
endif
if( getDist(xNet,yNet,xCrab,yCrab) < 2*sizeCapt ) %crab is caught
%keep track of how many crabs are caught
crabsCaught = crabsCaught +1;
%erase old crab
for i=1:length(crabGraphics)
delete(crabGraphics(i));
endfor
%create a new crab. initialize new crab location, heading and size
xCrab = rand*mapWidth;
yCrab = rand*mapHeight;
thetaCrab = -pi/2;
sizeCrab = 50;
%draw new crab
crabGraphics = drawCrab(xCrab,yCrab,thetaCrab,sizeCrab);
endif
fflush(stdout);
pause(.01)
endwhile
close all
clear
endfunction
