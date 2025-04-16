//Library - Minim
//
//Global Variables
float imageDivX, imageDivY, imageDivWidth, imageDivHeight;
PImage backgroundImage, bikeImage;
float backgroundImageX, backgroundImageY, backgroundImageWidth, backgroundImageHeight;
float bikeX, bikeY, bikeImageWidth, bikeImageHeight;
float bikeX_Changed, bikeY_Changed, bikeImageWidthChanged, bikeImageHeightChanged;
//
void setup() {
  //fullScreen();
  size(700, 500);
  println(displayWidth, displayHeight);
  int appWidth = width; //displayWidth
  int appHeight = height; //displayHeight
  //
  //Image Loading
  String open = "/";
  String fileTypeJPG = ".jpg";
  String imageFolder = "Images";
  String imageGeomterySquare = "Square";
  String imageGeomteryLandscape = "Landscape";
  String imageGeomteryPortrait = "";
  String soccerBall = "SoccerBall";
  String bike = "bike";
  String file = imageFolder + open + imageGeomterySquare + open + soccerBall + fileTypeJPG;
  backgroundImage = loadImage(file);
  file = imageFolder + open + imageGeomteryLandscape + open + bike + fileTypeJPG;
  bikeImage = loadImage(file);
  //
  //Population
  backgroundImageX = appWidth*0;
  backgroundImageY = appHeight*0;
  backgroundImageWidth = appWidth-1; //Note boarder of rect() & counting of pixels
  backgroundImageHeight = appHeight-1; //Note boarder of rect() & counting of pixels
  imageDivX = appWidth*1/4;
  imageDivY = appHeight*1/5;
  imageDivWidth = appWidth*1/2;
  imageDivHeight = appHeight*1.5/5; //1+1.5=2.5, half of the total height
  bikeX_Changed = bikeX = imageDivX;
  bikeY_Changed = bikeY = imageDivY;
  bikeImageWidthChanged = bikeImageWidth = 860.0; //without .0 may truncate
  bikeImageHeightChanged = bikeImageHeight = 529.0; //without .0 may truncate
  

  Boolean rectLandscape = ( imageDivWidth > imageDivHeight ) ? true : false ;
  Boolean imageLandscape = ( bikeImageWidth > bikeImageHeight ) ? true : false ;
  float ratioGreaterThanOne = ( imageLandscape == true ) ? bikeImageWidth/bikeImageHeight : bikeImageHeight/bikeImageWidth;
  if ( rectLandscape == imageLandscape ) {
    //Larger DIV dimension to larger iamge dimenson (the changed value)
    //
    if ( rectLandscape == true ) { //Landscape
      boolean scaledLarger = ( bikeImageWidthChanged < imageDivWidth ) ? true : false ; //TRUE = Mutliple >1
      bikeImageWidthChanged = imageDivWidth;
      bikeImageHeightChanged = ( scaledLarger == true ) ? bikeImageWidthChanged *ratioGreaterThanOne : bikeImageWidthChanged /ratioGreaterThanOne ;
      float i = 1.0;
      float accuracy = 0.01; // add zeros if necessary, see text-flat algorithm (CS-Introduction)
      while ( bikeImageHeightChanged > imageDivHeight ) {
        i = 1 - accuracy;
        bikeImageHeightChanged = bikeImageHeightChanged*i;
        bikeImageWidthChanged = bikeImageWidthChanged*i;
      }
    }
    if ( rectLandscape == false ) { //Portrait
      boolean scaledLarger = ( bikeImageHeightChanged < imageDivHeight ) ? true : false ; //TRUE = Mutliple >1
      bikeImageHeightChanged = imageDivHeight;
      bikeImageWidthChanged = ( scaledLarger == true ) ? bikeImageHeightChanged *ratioGreaterThanOne : bikeImageHeightChanged /ratioGreaterThanOne ;
      //while() {}
    }
  } else {
  }
  //
  //DIVs
  //rect(backgroundImageX, backgroundImageY, backgroundImageWidth, backgroundImageHeight);
  //rect(imageDivX, imageDivY, imageDivWidth, imageDivHeight);
  //
} //End setup
//
void draw() {
  //
  //Background Image
  image( backgroundImage, backgroundImageX, backgroundImageY, backgroundImageWidth, backgroundImageHeight );
  /* Background Image Question: Is the ball circular? Explain using the numbers the computer sees
   - ANS: this is compression
   */
  //Image in DIV
  image( bikeImage, bikeX, bikeY, imageDivWidth, imageDivHeight );
  image( bikeImage, bikeX_Changed, bikeY_Changed, bikeImageWidthChanged, bikeImageHeightChanged );
  //Image CENTER, LEFT, RIGHT, TOP, BOTTOM, etc.
  //
} //End draw
//
void mousePressed() {
} //End mousePressed
//
void keyPressed() {
} //End keyPressed
//
// End Main Program
