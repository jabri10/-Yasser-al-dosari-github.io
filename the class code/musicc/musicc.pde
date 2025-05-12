import ddf.minim.*;
import java.io.File;

// Global variables
Minim minim;
AudioPlayer player;
String[] trackNames;
int currentTrack = 0;

void setup() {
  size(800, 600);
  minim = new Minim(this);

  // Load track names dynamically from the "data" folder
  File folder = new File(dataPath(""));
  File[] files = folder.listFiles();
  if (files == null || files.length == 0) {
    println("No tracks found in the data folder!");
    exit();
  }

  // Filter for .mp3 files
  trackNames = new String[files.length];
  int count = 0;
  for (File file : files) {
    if (file.getName().endsWith(".mp3")) {
      trackNames[count++] = file.getName();
    }
  }

  // Resize the array to fit the actual number of tracks
  trackNames = subset(trackNames, 0, count);

  if (trackNames.length == 0) {
    println("No .mp3 files found in the data folder!");
    exit();
  }

  // Load the first track
  player = minim.loadFile(trackNames[currentTrack]);
}

void draw() {
  background(30);

  // Display track info
  fill(255);
  textAlign(CENTER, CENTER);
  textSize(20);
  text("Track: " + trackNames[currentTrack], width / 2, height / 4);

  // Draw buttons dynamically based on window size
  float buttonWidth = width / 6;
  float buttonHeight = height / 10;
  float playX = width / 3 - buttonWidth / 2;
  float nextX = 2 * width / 3 - buttonWidth / 2;
  float buttonY = height / 2 - buttonHeight / 2;

  drawButton("Play", playX, buttonY, buttonWidth, buttonHeight);
  drawButton("Next", nextX, buttonY, buttonWidth, buttonHeight);
}

void drawButton(String label, float x, float y, float w, float h) {
  fill(100);
  rect(x, y, w, h, 5);
  fill(255);
  textAlign(CENTER, CENTER);
  textSize(16);
  text(label, x + w / 2, y + h / 2);
}

void mousePressed() {
  float buttonWidth = width / 6;
  float buttonHeight = height / 10;
  float playX = width / 3 - buttonWidth / 2;
  float nextX = 2 * width / 3 - buttonWidth / 2;
  float buttonY = height / 2 - buttonHeight / 2;

  if (isButtonClicked(playX, buttonY, buttonWidth, buttonHeight)) {
    player.play();
  } else if (isButtonClicked(nextX, buttonY, buttonWidth, buttonHeight)) {
    player.close();
    currentTrack = (currentTrack + 1) % trackNames.length;
    player = minim.loadFile(trackNames[currentTrack]);
    player.play();
  }
}

boolean isButtonClicked(float x, float y, float w, float h) {
  return mouseX > x && mouseX < x + w && mouseY > y && mouseY < y + h;
}

void stop() {
  if (player != null) player.close();
  if (minim != null) minim.stop();
  super.stop();
}
