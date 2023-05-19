// Final Sizing
final int tX = 120; // tile width
final int tY = 144; // tile height
final int freqTiles = 6;

// Game Variables
int[] grid;
boolean started;
boolean gameRun;
boolean isDead;
int score;
int hiscore;
int overtime;

// Shifting
int shiftY;
int shiftV;
int baseV;
int speedUp;


// Images
PImage background, logo;


// One-time Setup
void setup() {

  size(480, 720); // 4 * 5 -- 120 pxl * 144 pxl tiles
  grid = new int[freqTiles];
  hiscore = 0;

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
  shiftY = 0;
  shiftV = baseV;

  // (Re)Set player status
  gameRun = false;
  isDead = false;

  score = 0;
  overtime = 0;

} // end newStart()
