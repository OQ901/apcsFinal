class Grid{
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
      grid[i] = int(random(4));
    }
    
  }
  
  
}
