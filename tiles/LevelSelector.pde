class LevelSelector{

  int[][] buttons;
  int buttonSize
  boolean buttonOver




  void mousePressed() {
    if (button) {
      currentColor = rectColor;
    }
  }

  boolean button(int x, int y, int width, int height)  {
    if (mouseX >= x && mouseX <= x+width && 
        mouseY >= y && mouseY <= y+height) {
      return true;
    } else {
      return false;
    }
  }


  void update(int x, int y) {
    if ( button(circleX, circleY, circleSize) ) 
      buttonOver = true;
      else buttonOver = false;

      
    }
  }
