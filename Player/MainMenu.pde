public class MainMenu extends Menu{
  PImage background;
  PImage logo;
  
  public MainMenu(){
    super(new String[]{"Level 1","Level 2","Level 3","Level 4","Level 5","Freemode"},
          300, 60, (width - 300) / 2, 250, 70);
    background = loadImage("img/bg/MMBG.jpg");
    logo = loadImage("img/logo.png");
  }
  
  public void display(){
    image(background, 0, 0, width, height);
    textSize(50);
    fill(255);
    text("Main Menu", width / 2, 225);
    super.displayMenu();
    image(logo, width / 2 - 75, 25, 150, 150);
  }
  
  public Level chooseLevel(int mouseXCoor, int mouseYCoor){
    int buttonPressed = buttonPress(mouseXCoor, mouseYCoor);
    if (buttonPressed > -1){
      return new Level(buttonPressed);
    } else return null;
  }
}
