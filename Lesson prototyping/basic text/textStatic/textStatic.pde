// Text: Dynamic

//
//Global Variables
PFont appFont;
Float fontSize;
String title ="Wahoo!.";

//
float titleX, titleY, titleWidth, titleHeight;
//
void setup() {
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
 titleWidth = shorterSide;
 PFont appFont = createFont("SegoeScript-20", fontSize);
//Tools/Create Font / Find Fonnt / Do Not Press "OK", known bug (not loadFont)
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
Font(sFont, fontSize);
println(textWidth(title), titlewidth);
while (textWidth(title) > titeWidth) {
  fontSize = fontSize * 0.9;
  textFont(titleFont, fontSize);
  println("Step:", textWidth(title), titleWidth);
}
//
//code before Drawing Text
color purpleInk = #2C08FF;
fill(purpleInk); 
textAlign (CENTER, CENTER);
//Values: [LEFT CENTRE RIGHT] & [TOP CENTRE BOTTOM BASELINE]
textFont(titleFont, fontSize);//
//Drwaing Text
text(titleX, titleY, titleWidth, titleHeight);
color whiteInk = #FFFFFF;
fill(whiteInk); //reset
//
} //End Setup
//
void draw() {
  //Empty Draw
} //End Draw
//
void mousePressed() {} //End Mouse pressed
void keyPressed() {}//
//End Main
