//Dynamic not static
//
//library=minim
//Global variables
//
float X, Y, Width, Height;
float topDisplayX, topDisplayY, topDisplayWidth, topdispayHeight;
float y;
float muteX,muteY, muteWidth, muteHeight;
float quitX,quitY,quitWidth,quitHeight;
float playX, playY,playWidth,playHeight;
float pauseX,pauseY,pauseWidth,pauseHeight;
float stopX,stopY,stopWidth,stopHeight;
float fastforwardX,fastforwardY,fastforwardWidth,fastforwardHeight;
float fastreverseX,fastreverseY,fastreverseWidth,fastreverseHeight;
float muteX,muteY,muteWidth,muteHeight;
float loop-onceX,loop-onceY,loop-onceWidth, loop-onceHeight;
float loop-infiniteX,loop-infiniteY,loop-infiniteWidth,loop-infiniteHeight;
float shuffleX,shuffleY,shuffleWidth,shuffleHeight;
float nextX,nextY,nextWidth,nextHeight;
float previousX,previousY,previousWidth,previousHeight;
void setup() {
  fullScreen();//displayWidth, displayHeight;
  int appWidth = displayWidth;
  int appHeight = displayHeight;
  
  X = appWidth * 0.26;
  Y = appHeight * 0.20;
  Width = appWidth * 0.50;
  Height = appHeight * 0.40;
  
 //'println(displayWidth, displayHeight);
  
   topDisplayX =appWidth * 0.30;
   topDisplayY =appHeight * 0.70;
   topDisplayWidth = appWidth * 0.08;
   topdispayHeight = appHeight * 0.08;
muteX = appWidth * 0.40;
muteY = appHeight * 0.70;
muteWidth = appWidth * 0.08;
muteHeight = appHeight * 0.08;
quitX = appWidth * 0.50;
quitY = appHeight * 0.70;
quitWidth = appWidth * 0.08;
quitHeight =appHeight *0.08; 
playX = appWidth * 0.60
playY = appHeight * 0.70
playWidth = appWidth * 0.08
playHeight = appHeight *0.08
pauseX = appWidth * 0.70
pauseY = appHeight *0.70
pauseWidth = appWidth * 0.08
pauseHeight = appHeight * 0.80
fastforwardX = appWidth *0.80
fastforwardY = appHeight * 0.70
fastforwardWidth = appWidth *0.08
fastforwardHeight =appHeight * 0.08
fastreverseX = appWidth * 0.90
fastreverseY = appHeight *0.70
fastreverseWidth = appWidth * 0.08
fastreverseHeight = appHeight *0.08
loop-onceX = appWidth * 0.100
loop-onceY = appHeight *0.70
loop-onceWidth = appWidth *0.08
loop-onceHeight = appHeight *0.08
loop-infiniteX = appWidth *0.110
loop-infiniteY = appHeight *0.70
loop-infiniteWidth = appWidth *0.08
loop-infiniteHeight = appHeight *0.08
shuffleX = appWidth *
shuffleY = appHeight *
shuffleWidth = appWidth *
shuffleHeight = appHeight *
nextX = appWidth *
nextY = appHeight *
nextWidth = appWidth *
nextHeight =appHeight *
previousX = appWidth *
previousY = appHeight *
previousWidth = appWidth *
previousHeight = appHeight
rect(topDisplayX, topDisplayY, topDisplayWidth, topdispayHeight);
  //
  
rect(muteX,muteY, muteWidth, muteHeight);
rect(quitX,quitY,quitWidth,quitHeight);
rect(playX, playY,playWidth,playHeight);
rect(pauseX,pauseY,pauseWidth,pauseHeight);
rect(stopX,stopY,stopWidth,stopHeight);
rect(fastforwardX,fastforwardY,fastforwardWidth,fastforwardHeight);
rect(fastreverseX,fastreverseY,fastreverseWidth,fastreverseHeight);
rect(loop-onceX,loop-onceY,loop-onceWidth, loop-onceHeight);
rect(loop-infiniteX,loop-infiniteY,loop-infiniteWidth,loop-infiniteHeight);
rect(shuffleX,shuffleY,shuffleWidth,shuffleHeight);
rect(nextX,nextY,nextWidth,nextHeight);
rect(previousX,previousY,previousWidth,previousHeight);
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
