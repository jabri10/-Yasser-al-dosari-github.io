import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

// Global variables
Minim minim;
AudioPlayer[] players;
// Define track names. Ensure these MP3 files are accessible (e.g., in the sketch's data folder).
String[] trackNames = { "096.mp3", "097.mp3", "098.mp3", "099.mp3" };
int currentTrack = 0;
String status = "Stopped";

// UI Layout Variables (from the detailed structure)
float quitX, quitY, quitWidth, quitHeight;
float imageDivX, imageDivY, imageDivWidth, imageDivHeight;
float messageDIV_X, messageDIV_Y, messageDIV_Width, messageDIV_Height;
float stopDivX, stopDivY, stopDivWidth, stopDivHeight;
float muteDivX, muteDivY, muteDivWidth, muteDivHeight;
float previousDivX, previousDivY, previousDivWidth, previousDivHeight;
float fastRewindDivX, fastRewindDivY, fastRewindDivWidth, fastRewindDivHeight;
float pauseDivX, pauseDivY, pauseDivWidth, pauseDivHeight;
float playDivX, playDivY, playDivWidth, playDivHeight;
float loopOnceDivX, loopOnceDivY, loopOnceDivWidth, loopOnceDivHeight;
float loopInfiniteDivX, loopInfiniteDivY, loopInfiniteDivWidth, loopInfiniteDivHeight;
float fastForwardDivX, fastForwardDivY, fastForwardDivWidth, fastForwardDivHeight;
float nextDivX, nextDivY, nextDivWidth, nextDivHeight;
float shuffleDivX, shuffleDivY, shuffleDivWidth, shuffleDivHeight;
float songPositionDivX, songPositionDivY, songPositionDivWidth, songPositionDivHeight;
float timeRemainingDivX, timeRemainingDivY, timeRemainingDivWidth, timeRemainingDivHeight;
float songTitleDivX, songTitleDivY, songTitleDivWidth, songTitleDivHeight;
float timeBarDivX, timeBarDivY, timeBarDivWidth, timeBarDivHeight;
float totalTimeDivX, totalTimeDivY, totalTimeDivWidth, totalTimeDivHeight;

// Button Shape Variables (from the detailed structure)
float stopButtonX, stopButtonY, stopButtonWidth, stopButtonHeight;
float playX1, playY1, playX2, playY2, playX3, playY3;
float fastForwardX1, fastForwardY1, fastForwardX2, fastForwardY2, fastForwardX3, fastForwardY3;
float fastForwardX4, fastForwardY4, fastForwardX5, fastForwardY5, fastForwardX6, fastForwardY6;
float pauseX1, pauseY1, pauseWidth1, pauseHeight1;
float pauseX2, pauseY2, pauseWidth2, pauseHeight2;

PImage myFirstImage, mySecondImage;
float imageWidthChanged_First, imageHeightChanged_First;
float imageWidthChanged_Second, imageHeightChanged_Second;

PFont appFont;
float fontSize;

void setup() {
  size(700, 500); // Using the detailed structure's size for the window
  int appWidth = width;
  int appHeight = height;
  int appShortSide = (appWidth < appHeight) ? appWidth : appHeight;

  minim = new Minim(this);

  // Load audio files from the trackNames array.
  // Ensure these MP3 files are in the 'data' folder of your Processing sketch.
  players = new AudioPlayer[trackNames.length];
  for (int i = 0; i < trackNames.length; i++) {
    players[i] = minim.loadFile(trackNames[i]);
    if (players[i] == null) {
      println("Error: Could not load " + trackNames[i] + ". Make sure it's in the sketch's data folder.");
    }
  }

  // UI Population - Define positions and sizes for all UI elements
  int numberOfButtons = 13;
  int widthOfButton = appWidth / numberOfButtons;
  int beginningButtonSpace = widthOfButton;
  int buttonY = appHeight * 3 / 5;

  quitX = appWidth - appShortSide * 1 / 20;
  quitY = 0;
  quitWidth = appShortSide * 1 / 20;
  quitHeight = appShortSide * 1 / 20;

  songTitleDivX = beginningButtonSpace;
  songTitleDivY = appHeight * 1.5 / 20;
  songTitleDivWidth = appWidth * 1 / 2 - beginningButtonSpace * 1.5;
  songTitleDivHeight = appHeight * 1 / 10;

  imageDivX = beginningButtonSpace;
  imageDivY = appHeight * 4.5 / 20;
  imageDivWidth = appWidth * 1 / 2 - beginningButtonSpace * 1.5;
  imageDivHeight = appHeight * 1.5 / 5;

  messageDIV_X = appWidth * 1 / 2 + beginningButtonSpace * 1 / 2;
  messageDIV_Y = appHeight * 1.5 / 20;
  messageDIV_Width = appWidth * 1 / 2 - beginningButtonSpace * 1.5;
  messageDIV_Height = appHeight * 9 / 20;

  stopDivX = beginningButtonSpace + widthOfButton * 0;
  stopDivY = buttonY;
  stopDivWidth = widthOfButton;
  stopDivHeight = widthOfButton;

  stopButtonX = stopDivX + stopDivWidth * 1 / 4;
  stopButtonY = stopDivY + stopDivHeight * 1 / 4;
  stopButtonWidth = widthOfButton * 1 / 2;
  stopButtonHeight = widthOfButton * 1 / 2;

  muteDivX = beginningButtonSpace + widthOfButton * 1;
  muteDivY = buttonY;
  muteDivWidth = widthOfButton;
  muteDivHeight = widthOfButton;

  previousDivX = beginningButtonSpace + widthOfButton * 2;
  previousDivY = buttonY;
  previousDivWidth = widthOfButton;
  previousDivHeight = widthOfButton;

  fastRewindDivX = beginningButtonSpace + widthOfButton * 3;
  fastRewindDivY = buttonY;
  fastRewindDivWidth = widthOfButton;
  fastRewindDivHeight = widthOfButton;

  pauseDivX = beginningButtonSpace + widthOfButton * 4;
  pauseDivY = buttonY;
  pauseDivWidth = widthOfButton;
  pauseDivHeight = widthOfButton;

  pauseX1 = pauseDivX + pauseDivWidth * 1 / 4;
  pauseY1 = pauseDivY + pauseDivHeight * 1 / 4;
  pauseWidth1 = pauseDivWidth * 1 / 8;
  pauseHeight1 = pauseDivHeight * 1 / 2;

  pauseX2 = pauseDivX + pauseDivWidth * 5 / 8;
  pauseY2 = pauseDivY + pauseDivHeight * 1 / 4;
  pauseWidth2 = pauseDivWidth * 1 / 8;
  pauseHeight2 = pauseDivHeight * 1 / 2;

  playDivX = beginningButtonSpace + widthOfButton * 5;
  playDivY = buttonY;
  playDivWidth = widthOfButton;
  playDivHeight = widthOfButton;

  playX1 = playDivX + playDivWidth * 1 / 4;
  playY1 = playDivY + playDivHeight * 1 / 4;
  playX2 = playDivX + playDivWidth * 3 / 4;
  playY2 = playDivY + playDivHeight * 1 / 2;
  playX3 = playDivX + playDivWidth * 1 / 4;
  playY3 = playDivY + playDivHeight * 3 / 4;

  loopOnceDivX = beginningButtonSpace + widthOfButton * 6;
  loopOnceDivY = buttonY;
  loopOnceDivWidth = widthOfButton;
  loopOnceDivHeight = widthOfButton;

  loopInfiniteDivX = beginningButtonSpace + widthOfButton * 7;
  loopInfiniteDivY = buttonY;
  loopInfiniteDivWidth = widthOfButton;
  loopInfiniteDivHeight = widthOfButton;

  fastForwardDivX = beginningButtonSpace + widthOfButton * 8;
  fastForwardDivY = buttonY;
  fastForwardDivWidth = widthOfButton;
  fastForwardDivHeight = widthOfButton;

  fastForwardX1 = fastForwardDivX + fastForwardDivWidth * 1 / 4;
  fastForwardY1 = fastForwardDivY + fastForwardDivHeight * 1 / 4;
  fastForwardX2 = fastForwardDivX + fastForwardDivWidth * 1 / 2;
  fastForwardY2 = fastForwardDivY + fastForwardDivHeight * 1 / 2;
  fastForwardX3 = fastForwardDivX + fastForwardDivWidth * 1 / 4;
  fastForwardY3 = fastForwardDivY + fastForwardDivHeight * 3 / 4;

  fastForwardX4 = fastForwardDivX + fastForwardDivWidth * 1 / 2;
  fastForwardY4 = fastForwardDivY + fastForwardDivHeight * 1 / 4;
  fastForwardX5 = fastForwardDivX + fastForwardDivWidth * 3 / 4;
  fastForwardY5 = fastForwardDivY + fastForwardDivHeight * 1 / 2;
  fastForwardX6 = fastForwardDivX + fastForwardDivWidth * 1 / 2;
  fastForwardY6 = fastForwardDivY + fastForwardDivHeight * 3 / 4;

  nextDivX = beginningButtonSpace + widthOfButton * 9;
  nextDivY = buttonY;
  nextDivWidth = widthOfButton;
  nextDivHeight = widthOfButton;

  shuffleDivX = beginningButtonSpace + widthOfButton * 10;
  shuffleDivY = buttonY;
  shuffleDivWidth = widthOfButton;
  shuffleDivHeight = widthOfButton;

  float musicSongPaddingY = widthOfButton * 1 / 4;
  float musicSongSpaceX = stopDivX;
  float musicSongSpaceY = stopDivY + widthOfButton + musicSongPaddingY;
  float musicSongSpaceWidth = appWidth - widthOfButton * 2;
  float musicSongSpaceHeight = appHeight - musicSongPaddingY - musicSongSpaceY;

  songPositionDivX = musicSongSpaceX;
  songPositionDivY = musicSongSpaceY;
  songPositionDivWidth = musicSongSpaceWidth * 1 / 5;
  songPositionDivHeight = musicSongSpaceHeight * 2 / 5;

  timeRemainingDivX = musicSongSpaceX + musicSongSpaceWidth * 3 / 5;
  timeRemainingDivY = musicSongSpaceY + musicSongSpaceHeight * 3 / 5;
  timeRemainingDivWidth = musicSongSpaceWidth * 1 / 5;
  timeRemainingDivHeight = musicSongSpaceHeight * 2 / 5;

  totalTimeDivX = musicSongSpaceX + musicSongSpaceWidth * 4 / 5;
  totalTimeDivY = musicSongSpaceY + musicSongSpaceHeight * 3 / 5;
  totalTimeDivWidth = musicSongSpaceWidth * 1 / 5;
  totalTimeDivHeight = musicSongSpaceHeight * 2 / 5;

  timeBarDivX = musicSongSpaceX;
  timeBarDivY = musicSongSpaceY + musicSongSpaceHeight * 2 / 5;
  timeBarDivWidth = musicSongSpaceWidth;
  timeBarDivHeight = musicSongSpaceHeight * 1 / 5;

  // Image Loading. Update these paths or remove if not using images.
  // For the canvas, you generally put images in the 'data' folder of your sketch
  // and load them by just their filename (e.g., loadImage("myimage.png")).
  // The 'upArrow' and 'folders' logic is typically for specific local file structures.
  // For simplicity and canvas compatibility, adjust these to direct data folder paths.
  String myFirstImagePathway = "Old_man_portrait.png"; // Assuming in data folder
  String mySecondImagePathway = "bike.jpg"; // Assuming in data folder

  myFirstImage = loadImage(myFirstImagePathway);
  mySecondImage = loadImage(mySecondImagePathway);

  if (myFirstImage == null) {
    println("Error: Could not load " + myFirstImagePathway + ". Make sure it's in the sketch's data folder.");
  }
  if (mySecondImage == null) {
    println("Error: Could not load " + mySecondImagePathway + ". Make sure it's in the sketch's data folder.");
  }

  // Image Aspect Ratio Calculation for displaying images within their divs
  int myFirstImageWidth = (myFirstImage != null) ? myFirstImage.width : 1;
  int myFirstImageHeight = (myFirstImage != null) ? myFirstImage.height : 1;
  int mySecondImageWidth = (mySecondImage != null) ? mySecondImage.width : 1;
  int mySecondImageHeight = (mySecondImage != null) ? mySecondImage.height : 1;

  if (myFirstImageWidth > 1 && myFirstImageHeight > 1) {
    float imageAspectRatioFirst = (float)myFirstImageWidth / myFirstImageHeight;
    if (imageAspectRatioFirst > (float)imageDivWidth / imageDivHeight) { // Image is wider than div
      imageWidthChanged_First = imageDivWidth;
      imageHeightChanged_First = imageDivWidth / imageAspectRatioFirst;
    } else { // Image is taller than div or has similar aspect ratio
      imageHeightChanged_First = imageDivHeight;
      imageWidthChanged_First = imageDivHeight * imageAspectRatioFirst;
    }
  }

  if (mySecondImageWidth > 1 && mySecondImageHeight > 1) {
    float imageAspectRatioSecond = (float)mySecondImageWidth / mySecondImageHeight;
    if (imageAspectRatioSecond > (float)quitWidth / quitHeight) { // Image is wider than div
      imageWidthChanged_Second = quitWidth;
      imageHeightChanged_Second = quitWidth / imageAspectRatioSecond;
    } else { // Image is taller than div or has similar aspect ratio
      imageHeightChanged_Second = quitHeight;
      imageWidthChanged_Second = quitHeight * imageAspectRatioSecond;
    }
  }

  // Font setup. "Arial" is generally available. If you use a custom font,
  // it needs to be placed in the 'data' folder and loaded with loadFont().
  appFont = createFont("Arial", appShortSide);
  fontSize = 20; // Initial font size for the song title
}

void draw() {
  background(30); // Dark background

  // Draw all the UI divisions (rectangles)
  noFill(); // Draw outlines
  stroke(100); // Light grey stroke for divisions

  rect(quitX, quitY, quitWidth, quitHeight);
  rect(imageDivX, imageDivY, imageDivWidth, imageDivHeight);
  rect(messageDIV_X, messageDIV_Y, messageDIV_Width, messageDIV_Height);

  rect(stopDivX, stopDivY, stopDivWidth, stopDivHeight);
  rect(muteDivX, muteDivY, muteDivWidth, muteDivHeight);
  rect(previousDivX, previousDivY, previousDivWidth, previousDivHeight);
  rect(fastRewindDivX, fastRewindDivY, fastRewindDivWidth, fastRewindDivHeight);
  rect(pauseDivX, pauseDivY, pauseDivWidth, pauseDivHeight);
  rect(playDivX, playDivY, playDivWidth, playDivHeight);
  rect(loopOnceDivX, loopOnceDivY, loopOnceDivWidth, loopOnceDivHeight);
  rect(loopInfiniteDivX, loopInfiniteDivY, loopInfiniteDivWidth, loopInfiniteDivHeight);
  rect(fastForwardDivX, fastForwardDivY, fastForwardDivWidth, fastForwardDivHeight);
  rect(nextDivX, nextDivY, nextDivWidth, nextDivHeight);
  rect(shuffleDivX, shuffleDivY, shuffleDivWidth, shuffleDivHeight);

  rect(songPositionDivX, songPositionDivY, songPositionDivWidth, songPositionDivHeight);
  rect(songTitleDivX, songTitleDivY, songTitleDivWidth, songTitleDivHeight);
  rect(timeBarDivX, timeBarDivY, timeBarDivWidth, timeBarDivHeight);
  rect(timeRemainingDivX, timeRemainingDivY, timeRemainingDivWidth, timeRemainingDivHeight);
  rect(totalTimeDivX, totalTimeDivY, totalTimeDivWidth, totalTimeDivHeight);

  // Draw images, centered within their respective divs
  if (myFirstImage != null) {
    image(myFirstImage, imageDivX + (imageDivWidth - imageWidthChanged_First) / 2, imageDivY + (imageDivHeight - imageHeightChanged_First) / 2, imageWidthChanged_First, imageHeightChanged_First);
  }
  if (mySecondImage != null) {
    image(mySecondImage, quitX + (quitWidth - imageWidthChanged_Second) / 2, quitY + (quitHeight - imageHeightChanged_Second) / 2, imageWidthChanged_Second, imageHeightChanged_Second);
  }

  // Display track info and status within the songTitleDivX
  fill(255); // White text
  textAlign(LEFT, TOP); // Align to top-left of the division for multi-line text
  // Adjust font size to fit within the songTitleDivWidth and height
  float tempFontSize = fontSize;
  textFont(appFont, tempFontSize);
  String displayText = "Track: " + trackNames[currentTrack] + "\nStatus: " + status;
  // Simple check to reduce font size if text is too wide or too tall for two lines
  while (textWidth(displayText) > songTitleDivWidth - 20 || (textAscent() + textDescent()) * 2 > songTitleDivHeight - 20) {
    tempFontSize *= 0.95;
    textFont(appFont, tempFontSize);
    if (tempFontSize < 5) break; // Prevent infinite loop for very small divisions
  }
  text(displayText, songTitleDivX + 10, songTitleDivY + 10, songTitleDivWidth - 20, songTitleDivHeight - 20); // Add padding

  // Draw the specific button shapes (Play, Stop, Pause, Fast Forward)
  fill(50, 150, 50); // Green for Play
  triangle(playX1, playY1, playX2, playY2, playX3, playY3);

  fill(150, 50, 50); // Red for Stop
  rect(stopButtonX, stopButtonY, stopButtonWidth, stopButtonHeight);

  fill(50, 50, 150); // Blue for Pause
  rect(pauseX1, pauseY1, pauseWidth1, pauseHeight1);
  rect(pauseX2, pauseY2, pauseWidth2, pauseHeight2);

  fill(150, 150, 50); // Yellow for Fast Forward
  triangle(fastForwardX1, fastForwardY1, fastForwardX2, fastForwardY2, fastForwardX3, fastForwardY3);
  triangle(fastForwardX4, fastForwardY4, fastForwardX5, fastForwardY5, fastForwardX6, fastForwardY6);

  // Add labels for other buttons (conceptual, not interactive in this version)
  fill(200); // Light grey for other button labels
  textAlign(CENTER, CENTER);
  textSize(16); // Fixed size for these labels
  text("Mute", muteDivX + muteDivWidth / 2, muteDivY + muteDivHeight / 2);
  text("Prev", previousDivX + previousDivWidth / 2, previousDivY + previousDivHeight / 2);
  text("Rewind", fastRewindDivX + fastRewindDivWidth / 2, fastRewindDivY + fastRewindDivHeight / 2);
  text("Loop 1", loopOnceDivX + loopOnceDivWidth / 2, loopOnceDivY + loopOnceDivHeight / 2);
  text("Loop Inf", loopInfiniteDivX + loopInfiniteDivWidth / 2, loopInfiniteDivY + loopInfiniteDivHeight / 2);
  text("Next", nextDivX + nextDivWidth / 2, nextDivY + nextDivHeight / 2);
  text("Shuffle", shuffleDivX + shuffleDivWidth / 2, shuffleDivY + shuffleDivHeight / 2);

  // Example of drawing time information (placeholders for now)
  fill(255);
  textAlign(CENTER, CENTER);
  textSize(14);
  text("Pos: 0:00", songPositionDivX + songPositionDivWidth / 2, songPositionDivY + songPositionDivHeight / 2);
  text("Rem: -:--", timeRemainingDivX + timeRemainingDivWidth / 2, timeRemainingDivY + timeRemainingDivHeight / 2);
  text("Total: 0:00", totalTimeDivX + totalTimeDivWidth / 2, totalTimeDivY + totalTimeDivHeight / 2);
}

void stopAllPlayers() {
  for (AudioPlayer player : players) {
    if (player != null) {
      player.pause();
      player.rewind(); // Reset to beginning
    }
  }
}

void mousePressed() {
  // Check if the current track player is loaded before proceeding
  if (players[currentTrack] == null) {
    println("Error: No track loaded for current track index " + currentTrack);
    return;
  }

  // QUIT Button detection
  if (mouseX > quitX && mouseX < quitX + quitWidth && mouseY > quitY && mouseY < quitY + quitHeight) {
    exit(); // Exits the Processing sketch
  }

  // Play Button detection
  if (mouseX > playDivX && mouseX < playDivX + playDivWidth &&
      mouseY > playDivY && mouseY < playDivY + playDivHeight) {
    stopAllPlayers();
    players[currentTrack].play();
    status = "Playing";
  }
  // Stop Button detection
  else if (mouseX > stopDivX && mouseX < stopDivX + stopDivWidth &&
           mouseY > stopDivY && mouseY < stopDivY + stopDivHeight) {
    stopAllPlayers();
    status = "Stopped";
  }
  // Next Button detection
  else if (mouseX > nextDivX && mouseX < nextDivX + nextDivWidth &&
           mouseY > nextDivY && mouseY < nextDivY + nextDivHeight) {
    stopAllPlayers();
    currentTrack = (currentTrack + 1) % trackNames.length; // Cycle through tracks
    if (players[currentTrack] != null) { // Ensure the next track is loaded
      players[currentTrack].play();
      status = "Playing";
    } else {
      status = "Error loading next track";
    }
  }
  // Pause Button detection
  else if (mouseX > pauseDivX && mouseX < pauseDivX + pauseDivWidth &&
           mouseY > pauseDivY && mouseY < pauseDivY + pauseDivHeight) {
    if (players[currentTrack].isPlaying()) {
      players[currentTrack].pause();
      status = "Paused";
    } else {
      players[currentTrack].play();
      status = "Playing";
    }
  }
  // Mute Button detection
  else if (mouseX > muteDivX && mouseX < muteDivX + muteDivWidth &&
           mouseY > muteDivY && mouseY < muteDivY + muteDivHeight) {
    if (players[currentTrack].isMuted()) {
      players[currentTrack].unmute();
      status = "Playing (Unmuted)";
    } else {
      players[currentTrack].mute();
      status = "Playing (Muted)";
    }
  }
  // Previous Button detection
  else if (mouseX > previousDivX && mouseX < previousDivX + previousDivWidth &&
           mouseY > previousDivY && mouseY < previousDivY + previousDivHeight) {
    stopAllPlayers();
    currentTrack = (currentTrack - 1 + trackNames.length) % trackNames.length; // Ensure positive wrap-around
    if (players[currentTrack] != null) {
      players[currentTrack].play();
      status = "Playing";
    } else {
      status = "Error loading previous track";
    }
  }
  // Fast Forward Button detection
  else if (mouseX > fastForwardDivX && mouseX < fastForwardDivX + fastForwardDivWidth &&
           mouseY > fastForwardDivY && mouseY < fastForwardDivY + fastForwardDivHeight) {
    if (players[currentTrack] != null) {
      players[currentTrack].skip(5000); // Skip forward 5 seconds (5000 milliseconds)
      status = "Playing (FFwd)";
    }
  }
  // Fast Rewind Button detection
  else if (mouseX > fastRewindDivX && mouseX < fastRewindDivX + fastRewindDivWidth &&
           mouseY > fastRewindDivY && mouseY < fastRewindDivY + fastRewindDivHeight) {
    if (players[currentTrack] != null) {
      players[currentTrack].skip(-5000); // Skip backward 5 seconds
      status = "Playing (Rewind)";
    }
  }
  // Loop Once Button detection
  else if (mouseX > loopOnceDivX && mouseX < loopOnceDivX + loopOnceDivWidth &&
           mouseY > loopOnceDivY && mouseY < loopOnceDivY + loopOnceDivHeight) {
    if (players[currentTrack] != null) {
      stopAllPlayers();
      players[currentTrack].loop(1); // Play current track once more after current loop completes
      status = "Looping Once";
    }
  }
  // Loop Infinite Button detection
  else if (mouseX > loopInfiniteDivX && mouseX < loopInfiniteDivX + loopInfiniteDivWidth &&
           mouseY > loopInfiniteDivY && mouseY < loopInfiniteDivY + loopInfiniteDivHeight) {
    if (players[currentTrack] != null) {
      stopAllPlayers();
      players[currentTrack].loop(); // Loop current track infinitely
      status = "Looping Infinitely";
    }
  }
  // Shuffle Button detection - Basic random next song
  else if (mouseX > shuffleDivX && mouseX < shuffleDivX + shuffleDivWidth &&
           mouseY > shuffleDivY && mouseY < shuffleDivY + shuffleDivHeight) {
    if (players[currentTrack] != null) {
      stopAllPlayers();
      int newTrack = (int)random(trackNames.length);
      // Ensure a different track if there's more than one song
      while (newTrack == currentTrack && trackNames.length > 1) {
        newTrack = (int)random(trackNames.length);
      }
      currentTrack = newTrack;
      if (players[currentTrack] != null) {
        players[currentTrack].play();
        status = "Playing (Shuffled)";
      } else {
        status = "Error loading shuffled track";
      }
    }
  }
}

void keyPressed() {
  // QUIT Key (ESC or 'Q')
  if (key == 'q' || key == 'Q' || (key == CODED && keyCode == ESC)) {
    exit();
  }
  // Play/Pause Toggle Key ('P')
  else if (key == 'p' || key == 'P') {
    if (players[currentTrack] != null) {
      if (players[currentTrack].isPlaying()) {
        players[currentTrack].pause();
        status = "Paused";
      } else {
        players[currentTrack].play();
        status = "Playing";
      }
    }
  }
  // Stop Key ('S')
  else if (key == 's' || key == 'S') {
    stopAllPlayers();
    status = "Stopped";
  }
  // Next Track Key ('N')
  else if (key == 'n' || key == 'N') {
    stopAllPlayers();
    currentTrack = (currentTrack + 1) % trackNames.length;
    if (players[currentTrack] != null) {
      players[currentTrack].play();
      status = "Playing";
    }
  }
  // Previous Track Key ('B' for Back)
  else if (key == 'b' || key == 'B') {
    stopAllPlayers();
    currentTrack = (currentTrack - 1 + trackNames.length) % trackNames.length;
    if (players[currentTrack] != null) {
      players[currentTrack].play();
      status = "Playing";
    }
  }
  // Fast Forward Key ('F')
  else if (key == 'f' || key == 'F') {
    if (players[currentTrack] != null) {
      players[currentTrack].skip(5000);
      status = "Playing (FFwd)";
    }
  }
  // Rewind Key ('R')
  else if (key == 'r' || key == 'R') {
    if (players[currentTrack] != null) {
      players[currentTrack].skip(-5000);
      status = "Playing (Rewind)";
    }
  }
  // Mute/Unmute Key ('M')
  else if (key == 'm' || key == 'M') {
    if (players[currentTrack] != null) {
      if (players[currentTrack].isMuted()) {
        players[currentTrack].unmute();
        status = "Playing (Unmuted)";
      } else {
        players[currentTrack].mute();
        status = "Playing (Muted)";
      }
    }
  }
  // Loop Once Key ('L')
  else if (key == 'l') {
    if (players[currentTrack] != null) {
      stopAllPlayers();
      players[currentTrack].loop(1);
      status = "Looping Once";
    }
  }
  // Loop Infinitely Key ('K')
  else if (key == 'k') {
    if (players[currentTrack] != null) {
      stopAllPlayers();
      players[currentTrack].loop();
      status = "Looping Infinitely";
    }
  }
  // Shuffle Key ('H')
  else if (key == 'h' || key == 'H') {
    if (players[currentTrack] != null) {
      stopAllPlayers();
      int newTrack = (int)random(trackNames.length);
      while (newTrack == currentTrack && trackNames.length > 1) {
        newTrack = (int)random(trackNames.length);
      }
      currentTrack = newTrack;
      if (players[currentTrack] != null) {
        players[currentTrack].play();
        status = "Playing (Shuffled)";
      } else {
        status = "Error loading shuffled track";
      }
    }
  }
}
