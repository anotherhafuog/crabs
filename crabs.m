function crabs (level)
% Crabs is a kids computer game where a fisherman, called the captain,
% hunts for a very clever and powerful crab.
% Draw the game map and initialize map dimensions.
[mapHeight , mapWidth] = drawMap( "BGImage.png" );
% Initialize captain location, heading and size
xCapt = 1000;
yCapt = 500;
thetaCapt = -pi/2;
sizeCapt = 50;
%initialize crab location, heading and size
xCrab = 1000;
yCrab = 1200;
thetaCrab = -pi/2;
sizeCrab = 50;
%initialize jellyfish
xJelly = rand*mapWidth;
yJelly = 0;
thetaJelly = -pi/2;
sizeJelly = 25;
% Draw the captain and initialize graphics handles
%*********************************************************
% Put your call to drawCapt() here ..... You must give drawCapt its
% input and output arguments.
captGraphics = drawCapt(xCapt, yCapt, thetaCapt, sizeCapt);
crabGraphics = drawCrab(xCrab,yCrab,thetaCrab,sizeCrab);
jellyGraphics = drawJelly(xJelly,yJelly,thetaJelly,sizeJelly);
%*******************************************************
while(1)
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
captGraphics = drawCapt( xCapt, yCapt, thetaCapt, sizeCapt);
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
fflush(stdout);
pause(.01)
endwhile
close all
clear
endfunction
