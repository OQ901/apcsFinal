public class Grid{
  // Grid Construction
  final int FREQTILES = 6;
  Tile[] grid;
    
  // Shifting
  int shiftY;
  int shiftV;
  int baseV;

  public Grid(int baseV){
    // (Re)Set board shifts
    this.baseV = baseV;
    shiftV = baseV;
    shiftY = 0;
    
    // Fill grid with random tiles (0-3)
    grid = new Tile[FREQTILES];
    grid[0] = null;
    for (int i = 1; i < grid.length; i ++) {
      grid[i] = new Tile(int(random(4)), i);
    }
    
  }
  
  public void fillGrid(){
    for(int i = 0; i < grid.length; i++) {
      grid[i].drawTile();
    }
  }
  
  public boolean scroll(){
    boolean isDead = false;
    shiftY += shiftV;
    if (grid[0].row != -1) {
      isDead = true;
    }

    // If shifted a whole tile (or more), restart shifting cycle
    if (shiftY >= Tile.TY) {
      shiftY = shiftY - Tile.TY;
      
      for (int i = 0; i < grid.length - 1; i ++) {
        grid[i] = grid[i + 1];
      }
      
      grid[grid.length - 1].row = int(random(4));
    }
    
    return isDead;
  }
  
}
