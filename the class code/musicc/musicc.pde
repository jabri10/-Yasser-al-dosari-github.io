//dynamic not static
//
import ddf.minim.*;

// Global variables
Minim minim;
AudioPlayer player;
AudioPlayer player2;

float boxWidth, boxHeight;
float displayX, displayY, displayWidth, displayHeight;
float buttonSpacing;
String status = "Stopped";
boolean isFirstTrack = true;

void setup() {
  fullScreen(); // Use full screen
  minim = new Minim(this);
  
  // Load the two audio files
  player = minim.loadFile("096.mp3");  // Load 096.mp3 from the data folder
  player2 = minim.loadFile("097.mp3"); // Load 097.mp3 from the data folder

  // Set dimensions for the display and control buttons
  displayWidth = width * 0.8;
  displayHeight = height * 0.4;
  displayX = (width - displayWidth) / 2;
  displayY = height * 0.1;

  boxWidth = width * 0.1;
  boxHeight = height * 0.1;
  buttonSpacing = width * 0.02;
}

void draw() {
  background(30);

  // Draw the display box
  fill(50);
  rect(displayX, displayY, displayWidth, displayHeight);
  fill(255);
  textAlign(CENTER, CENTER);
  textSize(24);
  text("Status: " + status, displayX + displayWidth / 2, displayY + displayHeight / 2);

  // Draw control buttons
  drawButton("Play", width * 0.2, height * 0.6);
  drawButton("Pause", width * 0.35, height * 0.6);
  drawButton("Stop", width * 0.5, height * 0.6);
  drawButton("Rewind", width * 0.65, height * 0.6);
  drawButton("Forward", width * 0.8, height * 0.6);
  drawButton("Switch Track", width * 0.9, height * 0.6);  // Button to switch between tracks
}

void drawButton(String label, float x, float y) {
  fill(100);
  rect(x, y, boxWidth, boxHeight);
  fill(255);
  textAlign(CENTER, CENTER);
  textSize(16);
  text(label, x + boxWidth / 2, y + boxHeight / 2);
}

void mousePressed() {
  // Check if Play button is clicked
  if (isButtonClicked(width * 0.2, height * 0.6)) {
    if (isFirstTrack) {
      player.play();
    } else {
      player2.play();
    }
    status = "Playing";
  }
  // Check if Pause button is clicked
  else if (isButtonClicked(width * 0.35, height * 0.6)) {
    if (isFirstTrack) {
      player.pause();
    } else {
      player2.pause();
    }
    status = "Paused";
  }
  // Check if Stop button is clicked
  else if (isButtonClicked(width * 0.5, height * 0.6)) {
    if (isFirstTrack) {
      player.rewind(); // Simply rewind when stopped
    } else {
      player2.rewind();
    }
    status = "Stopped";
  }
  // Check if Rewind button is clicked
  else if (isButtonClicked(width * 0.65, height * 0.6)) {
    if (isFirstTrack) {
      player.rewind();
    } else {
      player2.rewind();
    }
    status = "Rewound";
  }
  // Check if Forward button is clicked
  else if (isButtonClicked(width * 0.8, height * 0.6)) {
    if (isFirstTrack) {
      player.cue(player.length() - 5000); // Jump to the last 5 seconds of Track 1
    } else {
      player2.cue(player2.length() - 5000); // Jump to the last 5 seconds of Track 2
    }
    status = "Forwarded";
  }
  // Check if Switch Track button is clicked
  else if (isButtonClicked(width * 0.9, height * 0.6)) {
    isFirstTrack = !isFirstTrack;  // Toggle between the two tracks

    if (isFirstTrack) {
      status = "Switched to Track 1 (096.mp3)";
    } else {
      status = "Switched to Track 2 (097.mp3)";
    }
  }
}

boolean isButtonClicked(float x, float y) {
  return mouseX > x && mouseX < x + boxWidth && mouseY > y && mouseY < y + boxHeight;
}

void stop() {
  player.close();
  player2.close();
  minim.stop();
  super.stop();
}
