// Final Sizing
final int WX = 480; // window max x
final int WY = 720; // max y
      int curLevel=0;
String[] levels = new String[]{"song1","song2","etc"};
String[] backgrounds = new String[]{"background1.jpg","background2.jpg","etc"};




void keyPressed() {
   if(curLevel>=0&&curLevel<=levels.length){
       if(keyCode==LEFT)
         curLevel--;
       else if(keyCode==RIGHT)
         curLevel++;}
}

void updateLevel{
  text(levels[curLevel],0,0);
  
} 
