//dynamic not static
import ddf.minim.*;

// Global variables
Minim minim;
AudioPlayer player;
AudioPlayer player2;
AudioPlayer player3;
float boxWidth, boxHeight;
float displayX, displayY, displayWidth, displayHeight;
float buttonSpacing;
String status = "Stopped";
int currentTrack = 1;
String track1Name = "096.mp3";
String track2Name = "097.mp3";
String track3Name = "098.mp3";
float buttonY;

void setup() {
  fullScreen(); // Use full screen
  minim = new Minim(this);
  try {
    player = minim.loadFile(track1Name);
    player2 = minim.loadFile(track2Name);
    player3 = minim.loadFile(track3Name);
  } catch (Exception e) {
    println("Error loading audio files: " + e);
    exit();
  }

  // Set dimensions for the display and control buttons
  displayWidth = width * 0.8;
  displayHeight = height * 0.2;
  displayX = (width - displayWidth) / 2;
  displayY = height * 0.1;
  boxWidth = width * 0.12;
  boxHeight = height * 0.08;
  buttonSpacing = (width - (6 * boxWidth)) / 7;
  buttonY = height * 0.4;
}

void draw() {
  background(30);

  // Draw the display box
  fill(50);
  rect(displayX, displayY, displayWidth, displayHeight, 10);
  fill(255);
  textAlign(CENTER, CENTER);
  textSize(20);
  String currentTrackName = getCurrentTrackName();
  text("Track: " + currentTrackName + "\nStatus: " + status, displayX + displayWidth / 2, displayY + displayHeight / 2);

  // Draw control buttons
  float startX = buttonSpacing;
  drawButton("Play", startX, buttonY);
  startX += boxWidth + buttonSpacing;
  drawButton("Pause", startX, buttonY);
  startX += boxWidth + buttonSpacing;
  drawButton("Stop", startX, buttonY);
  startX += boxWidth + buttonSpacing;
  drawButton("Rewind", startX, buttonY);
  startX += boxWidth + buttonSpacing;
  drawButton("Forward", startX, buttonY);
  startX += boxWidth + buttonSpacing;
  drawButton("Switch", startX, buttonY);
}

void drawButton(String label, float x, float y) {
  fill(100);
  rect(x, y, boxWidth, boxHeight, 5);
  fill(255);
  textAlign(CENTER, CENTER);
  textSize(16);
  text(label, x + boxWidth / 2, y + boxHeight / 2);
}

void mousePressed() {
  AudioPlayer activePlayer = getCurrentPlayer();

  if (isButtonClicked(buttonSpacing, buttonY)) {
    activePlayer.play();
    status = "Playing";
  } else if (isButtonClicked(buttonSpacing + boxWidth + buttonSpacing, buttonY)) {
    activePlayer.pause();
    status = "Paused";
  } else if (isButtonClicked(buttonSpacing + 2 * (boxWidth + buttonSpacing), buttonY)) {
    activePlayer.rewind();
    activePlayer.pause();
    status = "Stopped";
  } else if (isButtonClicked(buttonSpacing + 3 * (boxWidth + buttonSpacing), buttonY)) {
    activePlayer.rewind();
    status = "Rewinding";
  } else if (isButtonClicked(buttonSpacing + 4 * (boxWidth + buttonSpacing), buttonY)) {
    int jumpTime = 5000;
    int newPosition = min(activePlayer.position() + jumpTime, activePlayer.length());
    activePlayer.cue(newPosition);
    activePlayer.play();
    status = "Forwarding";
  } else if (isButtonClicked(buttonSpacing + 5 * (boxWidth + buttonSpacing), buttonY)) {
    currentTrack = (currentTrack % 3) + 1;
    status = "Switched to Track " + currentTrack + " (" + getCurrentTrackName() + ")";
  }
}

boolean isButtonClicked(float x, float y) {
  return mouseX > x && mouseX < x + boxWidth && mouseY > y && mouseY < y + boxHeight;
}

AudioPlayer getCurrentPlayer() {
  if (currentTrack == 1) return player;
  else if (currentTrack == 2) return player2;
  else return player3;
}

String getCurrentTrackName() {
  if (currentTrack == 1) return track1Name;
  else if (currentTrack == 2) return track2Name;
  else return track3Name;
}

void stop() {
  if (player != null) player.close();
  if (player2 != null) player2.close();
  if (player3 != null) player3.close();
  if (minim != null) minim.stop();
  super.stop();
}
