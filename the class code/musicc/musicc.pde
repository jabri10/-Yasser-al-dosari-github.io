// Dynamic not static
//
//library=minim
import ddf.minim.*;

// Global variables
Minim minim;
AudioPlayer player;

float boxWidth, boxHeight;
float displayX, displayY, displayWidth, displayHeight;
float buttonSpacing;
String status = "Stopped";

void setup() {
  fullScreen(); // Use full screen
  minim = new Minim(this);
  player = minim.loadFile("096.mp3"); // Ensure the file exists in the "data" folder

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
    player.play();
    status = "Playing";
  }
  // Check if Pause button is clicked
  else if (isButtonClicked(width * 0.35, height * 0.6)) {
    player.pause();
    status = "Paused";
  }
  // Check if Stop button is clicked
  else if (isButtonClicked(width * 0.5, height * 0.6)) {
    player.rewind(); // Simply rewind when stopped
    status = "Stopped";
  }
  // Check if Rewind button is clicked
  else if (isButtonClicked(width * 0.65, height * 0.6)) {
    player.rewind();
    status = "Rewound";
  }
  // Check if Forward button is clicked
  else if (isButtonClicked(width * 0.8, height * 0.6)) {
    player.cue(player.length() - 5000); // Jump to the last 5 seconds
    status = "Forwarded";
  }
}

boolean isButtonClicked(float x, float y) {
  return mouseX > x && mouseX < x + boxWidth && mouseY > y && mouseY < y + boxHeight;
}

void stop() {
  player.close();
  minim.stop();
  super.stop();
}
