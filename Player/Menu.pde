public class Menu{
  PImage button;
  String[] buttonList;
  int nMenus;
  int cursPos;
  int buttonWidth;
  int buttonHeight;
  
  int[] button_x1,button_y1,button_x2,button_y2;
  
  public Menu(String[] buttonList, int cursPos, int buttonWidth, int buttonHeight){
    this.buttonList = buttonList;
    nMenus = buttonList.length;
    this.cursPos=cursPos;
    this.buttonWidth=buttonWidth;
    this.buttonHeight=buttonHeight
    
  }
  
  public void menuSetup(){
    button_x1 = new int[nMenus];
    button_y1 = new int[nMenus];
    button_x2 = new int[nMenus];
    button_y2 = new int[nMenus];
    
    int y1 = 0;
    int padding = 20;
    textSize(50);
    fill(0);
    text("Main Menu", 50, 50);
    for(int i = 0; i < nMenus; i++){
      button_x1[i] = 30;
      button_y1[i] = 100+y1;
      button_x2[i] = button_x1[i] + button_width;
      button_y2[i] = button_y1[i] + button_height;
      y1 += button_height + padding;
    }
  }
  
  public void buttonPress(){
    for(int i=0;i<nMenus;i++){
      if(mouseX>button_x1[i]&& mouseX <button_x2[i]&&
      mouseY>button_y1[i]&&mouseY<button_y2[i]){
        cursPos=i;
        System.out.println("level pressed: " + i);//temp
      }
    }
  }
  
  public void displayMenus(){
    menuSetup();
    fill(255);
    textSize(35);
    for(int i = 0; i < nMenus; i++){
     button = loadImage("img/button.jpg");
     image(button, button_x1[i], button_y1[i]);
     int y1 = (button_width- (int)textWidth(myMenus[i])) / 2 + 7;
     text(myMenus[i], button_x1[1] + 30, button_y1[i] + y1);
    }
  }
}
