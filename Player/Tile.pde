public class Tile{
  final static int TX = 120; // tile width
  final static int TY = 144; // tile height
  int xPos, yPos, row, column;
  int travelDist;
  
  public Tile(int ranColumn, int row){
  this.row = row;
  column = ranColumn;
  xPos = column * TX;
  yPos = height - (TY * (row + 1));
  }
  
  public void drawTile(){
    // fill(245, 182, 66); // orange
    fill(20, 45, 82); // navy blue
    rect(xPos, yPos, Tile.TX, Tile.TY);
  }
  
  public void moveTile(int shiftY){
    yPos += shiftY;
    travelDist += shiftY;
  }
  
  public boolean resetNeeded(){
    return travelDist >= TY;
  }
  
  public void resetShift(){
    travelDist = 0;
    row--;
    yPos = height - (TY * (row + 1));
  }
}
