// Game Variables
boolean started;
boolean gameRun;
boolean isDead;

MainMenu startMenu;
DeathMenu deathMenu;
Level level;

int score;
int hiscore;

// Images
PImage logo;

// One-time Setup
void setup() {
  size(480, 720); // 4 * 5 -- 120 pxl * 144 pxl tiles
  logo = loadImage("data/img/logo.png");
  
  hiscore = 0;
  newStart();
}


// New Game
void newStart() {
  
  // (Re)Set player status
  gameRun = false;
  isDead = false;
  score = 0;
  startMenu = new MainMenu();
  level = null;
  
} // end newStart()

void showScore() {
  
  textSize(40);
  fill(255, 0, 0);
  textAlign(CENTER);
  text(score, 240, 50);
}

void keyPressed() {

  if (gameRun && !isDead && "1234".contains(String.valueOf(key))) {
    isDead = !level.playTile(Character.getNumericValue(key) - 1);
    if (!isDead){
      if (level.levelNum < 5){
        score += level.levelNum + 1;
      } else score++;
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
    if (!startMenu.bgMusic.isPlaying())
      startMenu.startStopBG();
    startMenu.display();
    
  } else{
    
    level.levelSetup();
    
    if (startMenu != null){
      startMenu.startStopBG();
      startMenu = null;
    }
    
    // Alive
    if (gameRun && !isDead && !level.levelBeat()) {
      isDead = level.scroll();
      showScore();
    }
  }
  
  if (isDead) {
      if (score > hiscore){
        hiscore = score;
      }
      if (deathMenu == null){
        deathMenu = new DeathMenu("Try Again");
        deathMenu.startStopBG();
      }
      deathMenu.display(score, hiscore);
      
      if (level.levelNum == 5)
        level.levelMusic.stop();
    }
    
  if(level != null && level.levelBeat()){
    if (score > hiscore){
        hiscore = score;
    }
    
    if(deathMenu == null){
      deathMenu = new WinMenu();
      deathMenu.startStopBG();
    }
    deathMenu.display(score, hiscore);
  }

} // end draw()

void mousePressed(){
  if (!started){
    started = true;
  } else
    if (!gameRun){
      level = startMenu.chooseLevel(mouseX, mouseY);
      if (level != null)
        gameRun = true;
    } else
    if (isDead || level.levelBeat()){
      if(deathMenu.goAgain(mouseX, mouseY) != null){
        if (deathMenu.goAgain(mouseX, mouseY)){
          if (isDead)
            level = new Level(level.levelNum);
          else
            level = new Level(level.levelNum + 1);
          score = 0;
          isDead = false;
        }
        else{
          newStart();
        }
        deathMenu.startStopBG();
        deathMenu = null;
      }
    }
}
