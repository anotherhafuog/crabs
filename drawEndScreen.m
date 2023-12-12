function restart = drawEndScreen (imgName,crabsCaught,numCrabs)
  %draw the end screen
  drawMap(imgName);
  hold on
  myMessage=['Good Job! You Caught ', num2str(crabsCaught), ' out of ', num2str(numCrabs), '!' ];
  textLoc = [10,250];
  myTextHandle=text(textLoc(1), textLoc(2), myMessage, 'FontSize', 30, 'Color', 'red');
  pause(5)
  delete(myTextHandle);
  textLoc = [100,50];
  myMessage2 = ['Play again? Y/N'];
  myTextHandle=text(textLoc(1), textLoc(2), myMessage2, 'FontSize', 40, 'Color', 'red');
  %read keyboard
  while (1)
    %focus on command window
    commandwindow();
    cmd=kbhit(1);
    if( cmd == 'y' || cmd == 'Y')
    restart = 1;
    break;
    elseif(cmd == 'n' || cmd == 'N' || cmd == 'Q')
    restart = 0;
    break;
    endif
    pause(.1)
  endwhile
  hold off
endfunction
