public class DeathMenu extends Menu{
  public DeathMenu(){
    super(new String[]{"Try Again", "Main Menu"}, 300, 75, (width - 300) / 2, 500, 85);
  }
  
  public void display(int score, int hiscore){    
    // Scoreboard
    fill(255, 255, 255);
    rect(60, 180, 360, 45);
    rect(60, 240, 360, 75);
    fill(100);
    textSize(30);
    textAlign(LEFT);
    String s = "You suck!";
    text(s, 180, 185, 350, 240);
    s = "Score: " + score;
    text(s, 90, 245, 350, 240);
    s = "High Score: " + hiscore;
    text(s, 90, 275, 350, 240);
    
    super.displayMenu();
  }
  
  public Boolean goAgain(int mouseXCoor, int mouseYCoor){
    if (buttonPress(mouseXCoor, mouseYCoor) == 0)
      return true;
    else if (buttonPress(mouseXCoor, mouseYCoor) == 1)
      return false;
    else return null;
  }
}
