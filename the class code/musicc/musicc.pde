import ddf.minim.*;

// Global variables
Minim minim;
AudioPlayer[] players;
String[] trackNames = { "096.mp3", "097.mp3", "098.mp3", "099.mp3" };
int currentTrack = 0;
String status = "Stopped";

void setup() {
  size(800, 600);
  minim = new Minim(this);

  // Load audio files
  players = new AudioPlayer[trackNames.length];
  for (int i = 0; i < trackNames.length; i++) {
    players[i] = minim.loadFile(trackNames[i]);
    if (players[i] == null) {
      println("Error: Could not load " + trackNames[i]);
    }
  }
}

void draw() {
  background(30);

  // Display track info
  fill(255);
  textAlign(CENTER, CENTER);
  textSize(20);
  text("Track: " + trackNames[currentTrack] + "\nStatus: " + status, width / 2, height / 4);

  // Draw buttons
  drawButton("Play", width / 4, height / 2);
  drawButton("Stop", 2 * width / 4, height / 2);
  drawButton("Next", 3 * width / 4, height / 2);
}

void drawButton(String label, float x, float y) {
  fill(100);
  rect(x - 50, y - 20, 100, 40);
  fill(255);
  textAlign(CENTER, CENTER);
  textSize(16);
  text(label, x, y);
}

void mousePressed() {
  if (players[currentTrack] == null) {
    println("Error: No track loaded for current track index " + currentTrack);
    return;
  }

  if (mouseX > width / 4 - 50 && mouseX < width / 4 + 50 && mouseY > height / 2 - 20 && mouseY < height / 2 + 20) {
    // Play button
    stopAllPlayers();
    players[currentTrack].play();
    status = "Playing";
  } else if (mouseX > 2 * width
