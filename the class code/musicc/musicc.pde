import ddf.minim.*;

// Global variables
Minim minim;
AudioPlayer[] players;
String[] trackNames = { "096.mp3", "097.mp3", "098.mp3", "099.mp3" };
int currentTrack = 0;
float boxWidth, boxHeight;
float displayX, displayY, displayWidth, displayHeight;
float buttonSpacing;
String status = "Stopped";
float buttonY;

void setup() {
  fullScreen();
  minim = new Minim(this);

  players = new AudioPlayer[trackNames.length];
  try {
    for (int i = 0; i < trackNames.length; i++) {
      players[i] = minim.loadFile(trackNames[i]);
    }
  } catch (Exception e) {
    println("Error loading audio files: " + e);
    exit();
  }

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

  fill(50);
  rect(displayX, displayY, displayWidth, displayHeight, 10);
  fill(255);
  textAlign(CENTER, CENTER);
  textSize(20);
  text("Track: " + trackNames[currentTrack] + "\nStatus: " + status,
       displayX + displayWidth / 2, displayY + displayHeight / 2);

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

  checkAutoPlay();
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
  AudioPlayer activePlayer = players[currentTrack];

  if (isButtonClicked(buttonSpacing, buttonY)) {
    stopAllPlayers();
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
    stopAllPlayers();
    currentTrack = (currentTrack + 1) % trackNames.length;
    status = "Switched to Track " + (currentTrack + 1) + " (" + trackNames[currentTrack] + ")";
  }
}

boolean isButtonClicked(float x, float y) {
  return mouseX > x && mouseX < x + boxWidth && mouseY > y && mouseY < y + boxHeight;
}

void stopAllPlayers() {
  for (int i = 0; i < players.length; i++) {
    if (players[i].isPlaying() || players[i].position() > 0) {
      players[i].rewind();
      players[i].pause();
    }
  }
}

void checkAutoPlay() {
  for (int i = 0; i < players.length; i++) {
    if (players[i].isPlaying() && players[i].position() >= players[i].length() - 10) {
      players[i].pause();
      players[i].rewind();
      currentTrack = (i + 1) % players.length;
      players[currentTrack].play();
      status = "Auto-playing Track " + (currentTrack + 1) + " (" + trackNames[currentTrack] + ")";
      break;
    }
  }
}

void stop() {
  for (int i = 0; i < players.length; i++) {
    if (players[i] != null) players[i].close();
  }
  if (minim != null) minim.stop();
  super.stop();
}
