public class Level extends Grid{
  PImage background = loadImage("img/bg/pastelBack.jpg"); // STUB
  int speed; //STUB
  
  public Level(int levelNum){
    // STUB
    super(5);
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
