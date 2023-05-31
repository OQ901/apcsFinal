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
  
  public void deathScreen(){
    // End Screen
    fill(255, 255, 255);
    rect(60, 180, 360, 45);
    rect(60, 240, 360, 75);
    fill(100);
    textSize(30);
    String s = "You suck!";
    text(s, 180, 185, 350, 240);
    s = "Score: TBD";
    text(s, 90, 245, 350, 240);
    s = "High Score: TBD";
    text(s, 90, 275, 350, 240);
  }
}
