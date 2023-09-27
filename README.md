# crabs

Introduction: Crabs is a kids computer game where a captain tries to catch a crab

function: getCapt: number -> matrix <br>
purpose: The input number is the size of the captain character, and generates a matrix representation of the captain charater based on the size input <br>
Dependencies: None <br>
Call: capt = getCapt(50) will generate a captain matrix of size 50 <br>
Side Effects: None <br>
<br>
function: crabs: none -> image <br>
purpose: When called, the crabs function displays the current game state in a window  <br>
Dependencies: drawCapt, drawMap <br>
Call: crabs will display the crabs game in a window <br>
Side Effects: Returns the shiftCapt matrix <br>
<br>
function: drawCapt: number number number number -> plot <br>
purpose: Takes the x coordinate, y coordinate, size, and heading of the captain, and generates a plot of the captain charater based on those inputs <br>
Dependencies: getCapt, getTranslation,  <br>
Call: drawCapt(xCapt, yCapt, thetaCapt, sizeCapt); will generate a captain plot at coordinates (xCapt, yCapt), with heading thetaCapt, and with the size sizeCapt <br>
Side Effects: Returns the shiftCapt matrix <br>
<br>
function: getTranslation: number number -> matrix <br>
purpose: Takes the x and y values of the captain to be shifted by, and returns a matrix to shift the captain by those values <br>
Dependencies: None  <br>
Call: T = getTranslation(xCapt,yCapt); will generate a matrix to shift the captain, based on x-value xCapt and y-value yCapt <br>
Side Effects: None <br>
<br>
function: drawLine: number number string -> matrix <br>
purpose: Takes the x and y values of the captain to be shifted by, and returns a matrix to shift the captain by those values <br>
Dependencies: None  <br>
Call: T = getTranslation(xCapt,yCapt); will generate a matrix to shift the captain, based on x-value xCapt and y-value yCapt <br>
Side Effects: None <br>
<br>
