// Final Sizing
final int TX = 120; // tile width
final int TY = 144; // tile height
final int FREQTILES = 6;

// Game Variables
int[] grid;
boolean started;
boolean gameRun;
boolean isDead;

// Shifting
int shifTY;
int shiftV;
int baseV;
int speedUp;


// Images
PImage background, logo;


// One-time Setup
void setup() {

  size(480, 720); // 4 * 5 -- 120 pxl * 144 pxl tiles
  grid = new int[FREQTILES];

  background = loadImage("pastelBack.jpg");
  logo = loadImage("logo.jpg");

  // Set custom shifting variables
  baseV = 5;
  speedUp = 1;

  newStart();

}


// New Game
void newStart() {

  // Fill grid with random tiles (0-3)
  grid[0] = -1;
  for (int i = 1; i < grid.length; i ++) {
    grid[i] = int(random(4));
  }

  // (Re)Set board shifts
  shifTY = 0;
  shiftV = baseV;

  // (Re)Set player status
  gameRun = false;
  isDead = false;

} // end newStart()


void keyPressed() {

  if (key == '1') {
    checkMove(0);
  }

  if (key == '2') {
    checkMove(1);
  }

  if (key == '3') {
    checkMove(2);
  }

  if (key == '4') {
    checkMove(3);
  }

  // Start

  if (key == ' ' && !started) {
    started = true;
  } else
  if (started && !gameRun) {
    gameRun = true;
  }

  // Restart
  if (key == ' ' && isDead) {
    newStart();
  }

} // end keyPressed()


void draw() {

  if (!started) {
    
    background(255, 255, 255);
    image(logo, 100, 140, 280, 280);
    fill(0);
    textSize(40);
    text("Piano Tiles X", 140, 460, 280, 60);

  } else {

    
    image(background, 0, 0, width, height);

    stroke(173, 202, 247); // light blue
    line(TX, 0, TX, height);
    line(TX * 2, 0, TX * 2, height);
    line(TX * 3, 0, TX * 3, height);

    // fill(245, 182, 66); // orange
    fill(20, 45, 82); // navy blue
    for(int i = 0; i < grid.length; i++) {
      rect(grid[i] * TX, height - (TY * (i + 1) - shifTY), TX, TY);
    }

    // Alive
    if (gameRun & !isDead) {

      shifTY += shiftV;
      if (grid[0] != -1) {
        isDead = true;
      }

      // If shifted a whole tile (or more), restart shifting cycle
      if (shifTY >= TY) {
        shifTY = shifTY - TY;

        for (int i = 0; i < grid.length - 1; i ++) {
          grid[i] = grid[i + 1];
        }
        grid[grid.length - 1] = int(random(4));
      }
    }
  } 

} // end draw()


void checkMove(int pressed) {

  for (int i = 0; i < grid.length; i++) {
    if (grid[i] != -1) {
      if (grid[i] == pressed) {
        grid[i] = -1;
      } else {
        isDead = true;
      }
      break;
    }
  }
}
