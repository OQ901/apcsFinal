public class Grid{
  // Grid Construction
  final int FREQTILES = 6;
  Tile[] grid;
    
  // Shifting
  float shiftV;

  public Grid(){
    // (Re)Set board shifts
    
    // Fill grid with random tiles (0-3)
    grid = new Tile[FREQTILES];
    grid[grid.length - 1] = new Tile(int(random(4)), grid.length - 1);
    
  }
  
  public void fillGrid(){
    for(int i = 0; i < grid.length; i++) {
      if(grid[i] != null){
        grid[i].drawTile();
      }
    }
  }
  
  public boolean scroll(){
    boolean isDead = false;
    if (grid[0] != null) {
      isDead = true;
    }
  
    for (int i = grid.length - 1; i > 0; i--){
      if (grid[i] != null){
        grid[i].moveTile(shiftV);
        
        if (grid[i].resetNeeded()){
          grid[i].resetShift();
          grid[i - 1] = grid[i];
          grid[i] = null;
        }
      }
    }
    
    return isDead;
  }
  
  public boolean checkMove(int pressed){
    boolean validMove = false;
    for (int i = 0; i < grid.length; i++){
      if (grid[i] != null){
        if (grid[i].column == pressed){
          grid[i] = null;
          validMove = true;
        }
        break;
      }
    }
    return validMove;
  }
  
  public int tilesPresent(){
    int tiles = 0;
    for (int x = 0; x < grid.length; x++){
      if (grid[x] != null) tiles++;
    }
    return tiles;
  }
}
