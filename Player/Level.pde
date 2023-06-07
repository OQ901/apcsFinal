public class Level extends Grid{
  PImage background;
  int speed; //STUB
  int levelNum;
  
  public Level(int levelNum){
    // STUB
    super(5);
    this.levelNum = levelNum;
    background = loadImage("img/bg/" + levelNum + ".png");
    
    score = 0;
    hiscore = 0;
  }
  
  public void levelSetup(){
    image(background, 0, 0, width, height);

    stroke(173, 202, 247); // light blue
    line(Tile.TX, 0, Tile.TX, height);
    line(Tile.TX * 2, 0, Tile.TX * 2, height);
    line(Tile.TX * 3, 0, Tile.TX * 3, height);
    fillGrid();
  }
  
}
