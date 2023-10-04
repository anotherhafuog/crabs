function mapCheck = isOnMap(x,y,width,height)
  if (x > 0 && x < width && y > 0 && y < height)
    mapCheck = 1;
  else
    mapCheck = 0;
  endif
endfunction
