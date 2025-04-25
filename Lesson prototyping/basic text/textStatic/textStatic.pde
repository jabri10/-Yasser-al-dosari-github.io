// Text: static
//
String title ="Wahoo!.";
//
//Display
//fullscreen(120, 90);
size(900, 700);
int appWidth = width; //displayWidth
int appHeight = height;//displayHeight
int shorterSide = (appWidth > appHeight ) ? appHeight : appWidth ; //Landscape, Portrait, & Square
//
/*Fonts from OS
println("Start of console");
String[] fontList = PFont.list();//To list all fonts availableon sytem
printArray(fontList); //For listing all possible fonts to choose, then createFont
*/
float fontSize = shorterSide;
PFont titleFont = createFont("SegoeScript-20", fontSize);
//Tools / Create Font / Find Font / Do Not Press "OK", known bug
//
//Population
float titleX, titleY, titleWidth, titleHeight;
titleX = appWidth*1/4;
titleY = appHeight*1/4;
titleWidth = appWidth*1/2;
titleHeight = appHeight*1/10;
//
//DIVs
rect(titleX, titleY, titleWidth, titleHeight);
//
//font SIZE ALGORITHM
float SegoeScript20AspectRatio = 1;
fontSize = titleHeight * SegoeScript20AspectRatio;
if (textWidth(title) > titleWidth  )  {
  fontSize = fontSize * 0.9;
}



//
color purpleInk = #2C08FF;
fill(purpleInk); 
textAlign (CENTER, CENTER);
//Values: [LEFT CENTRE RIGHT] & [TOP CENTRE BOTTOM BASELINE]
textFont(titleFont, fontSize);
text(titleX, titleY, titleWidth, titleHeight);
color whiteInk = #FFFFFF;
fill(whiteInk); //reset
//
