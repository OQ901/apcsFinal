// Game Variables
boolean started;
boolean gameRun;
boolean isDead;
Grid grid = new Grid(5);

// Images
PImage background, logo;


// One-time Setup
void setup() {

  size(480, 720); // 4 * 5 -- 120 pxl * 144 pxl tiles

  background = loadImage("img/bg/pastelBack.jpg");
  logo = loadImage("img/logo.jpg");

  // Set custom shifting variables
  newStart();

}


// New Game
void newStart() {
  
  // (Re)Set player status
  gameRun = false;
  isDead = false;

} // end newStart()


void keyPressed() {

  if (key == '1') {
    grid.checkMove(0);
  }

  if (key == '2') {
    grid.checkMove(1);
  }

  if (key == '3') {
    grid.checkMove(2);
  }

  if (key == '4') {
    grid.checkMove(3);
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
    line(Tile.TX, 0, Tile.TX, height);
    line(Tile.TX * 2, 0, Tile.TX * 2, height);
    line(Tile.TX * 3, 0, Tile.TX * 3, height);
    
    grid.fillGrid();

    // Alive
    if (gameRun & !isDead) {
      isDead = grid.scroll();
    }
  } 

} // end draw()
