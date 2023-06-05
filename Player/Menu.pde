public class Menu{
  PImage button;
  String[] buttonList;
  int nMenus;
  int buttonWidth;
  int buttonHeight;
  int button_x1;
  int button_x2;
  
  int[] button_y1, button_y2;

  
  public Menu(String[] buttonList, int buttonWidth, int buttonHeight, int firstX, int firstY){
    this.buttonList = buttonList;
    nMenus = buttonList.length;
    this.buttonWidth = buttonWidth;
    this.buttonHeight = buttonHeight;
    button_x1 = firstX;
    
    button_y1 = new int[nMenus];
    button_y2 = new int[nMenus];
    
    button_x2 = button_x1 + buttonWidth;
    
    for(int i = 0; i < nMenus; i++){
      button_y1[i] = firstY + 60 * i;
      button_y2[i] = button_y1[i] + buttonHeight;
    }
  }
  
  public int buttonPress(int mouseXCoor, int mouseYCoor){
    int cursPos = -1;
    for(int i = 0; i < nMenus; i++){
      if(mouseXCoor > button_x1 && mouseXCoor < button_x2 && mouseYCoor > button_y1[i] && mouseYCoor < button_y2[i]){
        cursPos=i;
        break;
      }
    }
    return cursPos;
  }
  
  public void displayMenu(){
    fill(255);
    textSize(35);
    for(int i = 0; i < nMenus; i++){
      button = loadImage("img/button.png");
      image(button, button_x1, button_y1[i]);
      int y1 = (buttonWidth- (int)textWidth(buttonList[i])) / 2 + 7;
      text(buttonList[i], button_x1 + 30, button_y1[i] + y1);
    }

  }
}
