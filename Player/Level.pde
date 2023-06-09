public class Level extends Grid{
  final float[] speeds = {4, 5, 7, 8, 10, 5};
  PImage background;
  int speed; //STUB
  int levelNum;
  Music levelMusic;
  int tilesLeft;
  
  public Level(int levelNum){
    this.levelNum = levelNum;
    background = loadImage("data/img/bg/" + levelNum + ".png");
    
    levelMusic = new Music(levelNum);
    if (levelNum < 5)
      tilesLeft = levelMusic.notes.size();
    else { 
      tilesLeft = Integer.MAX_VALUE;
      levelMusic.play();
    }
    shiftV = speeds[levelNum];
  }
  
  public void levelSetup(){
    image(background, 0, 0, width, height);

    stroke(173, 202, 247); // light blue
    line(Tile.TX, 0, Tile.TX, height);
    line(Tile.TX * 2, 0, Tile.TX * 2, height);
    line(Tile.TX * 3, 0, Tile.TX * 3, height);
    fillGrid();
  }
  
  public boolean playTile(int pressed){
    boolean validMove = checkMove(pressed);
    if (validMove){
      if(levelNum < 5){
        levelMusic.playNote();
        tilesLeft--;
      }
    }
    return validMove;
  }
  
  public boolean scroll(){
    if (grid[grid.length - 1] == null && tilesLeft > tilesPresent()){
      grid[grid.length - 1] = new Tile(int(random(4)), grid.length - 1);
    }
    if (levelNum == 5){
      shiftV = 5 + 0.1 * score;
    }
    return super.scroll();
  }
  
  public boolean levelBeat(){
    return tilesLeft == 0;
  }
}
