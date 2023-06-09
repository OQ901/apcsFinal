public class WinMenu extends DeathMenu{
  public WinMenu(){
    super("Next Level");
  }
  
    public void display(int score, int hiscore){    
    // Scoreboard
    fill(255, 255, 255);
    rect(60, 180, 360, 45);
    rect(60, 240, 360, 75);
    fill(100);
    textSize(30);
    textAlign(LEFT);
    String s = "Congratulations! You win!";
    text(s, 80, 180, 350, 240);
    s = "Score: " + score;
    text(s, 90, 245, 350, 240);
    s = "High Score: " + hiscore;
    text(s, 90, 275, 350, 240);
    
    super.displayMenu();
  }
}
