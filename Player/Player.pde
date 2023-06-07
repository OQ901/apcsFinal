// Game Variables
boolean started;
boolean gameRun;
boolean isDead;

MainMenu startMenu;
DeathMenu deathMenu;
Level level;
Music lvlMusic;

int score;
int hiscore;

// Images
PImage logo;

// Sounds
SoundFile music;

// One-time Setup
void setup() {
  size(480, 720); // 4 * 5 -- 120 pxl * 144 pxl tiles
  logo = loadImage("img/logo.png");
  
  startMenu = new MainMenu();
  hiscore = 0;
  newStart();
}


// New Game
void newStart() {
  
  // (Re)Set player status
  gameRun = false;
  isDead = false;
  score = 0;
  
} // end newStart()


void keyPressed() {

  if (gameRun && !isDead && "1234".contains(String.valueOf(key))) {
    isDead = !level.checkMove(Character.getNumericValue(key) - 1);
    if (!isDead){
      if (level.levelNum < 5){
        score += level.levelNum + 1;
      } else score++;
    } else if (score > hiscore){
      hiscore = score;
    }
  }

  // Start

  if (key == ' ' && !started) {
    started = true;
  }

} // end keyPressed()


void draw() {

  if (!started) {
    
    background(255, 255, 255);
    image(logo, 100, 140, 280, 280);
    fill(0);
    textSize(40);
    text("Piano Tiles X", 140, 460, 280, 60);

  } else if (!gameRun){
    background(255, 255, 255);
    startMenu.display();
    
  } else{
    
    level.levelSetup();
    
    // Alive
    if (gameRun & !isDead) {
      isDead = level.scroll();
    }
  }
  
  if (isDead) {
      deathMenu = new DeathMenu();
      deathMenu.display(score, hiscore);
    }

} // end draw()

void mousePressed(){
  if (!started){
    started = true;
  } else
    if (!gameRun){
      level = startMenu.chooseLevel(mouseX, mouseY);
      chooseMuse();
      if (level != null)
        gameRun = true;
    }
    if (isDead){
      if(deathMenu.goAgain(mouseX, mouseY) != null){
        if (deathMenu.goAgain(mouseX, mouseY)){
          level = new Level(level.levelNum);
          isDead = false;
        }
        else newStart();
      }
    }
}

 void chooseMuse(){
   music = new SoundFile(this, "lvl/" + level + ".wav");
   
 }
