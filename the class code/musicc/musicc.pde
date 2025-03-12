//Dynamic not static
//
//library=minim
//Global variables
//
float X, Y, Width, Height;
float topDisplayX, topDisplayY, topDisplayWidth, topdispayHeight;
float y;

void setup() {
int appWidth = displayWidth;
  int appHeight = displayHeight;
  
  X = appWidth * 0.26;
  Y = appHeight * 0.20;
  Width = appWidth * 0.50;
  Height = appHeight * 0.40;
  fullScreen();
 //'println(displayWidth, displayHeight);
  
   topDisplayX =appWidth * 0.30;
   topDisplayY =appHeight * 0.70;
   topDisplayWidth = appWidth * 0.10;
   topdispayHeight = appHeight * 0.10;
rect(X, Y, Width, Height);


rect(topDisplayX, topDisplayY, topDisplayWidth, topdispayHeight);
  //
  
rect(X, Y, Width, Height);
rect(X, Y, Width, Height);
rect(X, Y, Width, Height);
rect(X, Y, Width, Height);
rect(X, Y, Width, Height);
rect(X, Y, Width, Height);
rect(X, Y, Width, Height);
rect(X, Y, Width, Height);
rect(X, Y, Width, Height);
rect(X, Y, Width, Height);
rect(X, Y, Width, Height);
rect(X, Y, Width, Height);
rect(X, Y, Width, Height);
rect(X, Y, Width, Height);
rect(X, Y, Width, Height);
rect(X, Y, Width, Height);
rect(X, Y, Width, Height);
rect(X, Y, Width, Height);
//
}
//
void draw() {}
//
void mousePressed() {}
//
void keyPressed() {}
//
//End MAIN program
