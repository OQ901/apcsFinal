// Final Sizing
final int WX = 480; // window max x
final int WY = 720; // max y
      int curLevel=0;
String[] levels = new String[]{"song1","song2","etc"};
String[] backgrounds = new String[]{"background1.jpg","background2.jpg","etc"};




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

void updateLevel{
  text(levels[curLevel],0,0);
  
} 
