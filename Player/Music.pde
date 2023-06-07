import processing.sound.*;

public class Music{
  Amplitude amp;
  SoundFile musicFile;
  public Music(int levelNum){  
  musicFile = new SoundFile(this, "lvl/goat.wav");
  File.play();
  }
}
