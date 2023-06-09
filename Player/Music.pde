import processing.sound.*;
import java.io.File;
import java.io.FileNotFoundException;
import java.util.Scanner;

public class Music{
  SoundFile musicFile;
  ArrayList<Double> notes;
  double totalDuration;
  int nextNote;
  float position;
  
  public Music(int lvlNum){
    if (lvlNum < 0){
      musicFile = new SoundFile(Player.this, "data/sound/bg.mp3");
    } else{
      try{
        musicFile = new SoundFile(Player.this, "data/sound/" + lvlNum + "/" + lvlNum + ".mp3");
        if (lvlNum < 5){
          File noteArray = new File(dataPath("sound/" + lvlNum + "/" + lvlNum + ".txt"));
          Scanner arrayReader = new Scanner(noteArray);
          notes = new ArrayList<Double>();
        
          totalDuration = 0;
          nextNote = 0;
          position = 0;
          while (arrayReader.hasNextDouble()){
            double next = arrayReader.nextDouble();
            notes.add(next);
            totalDuration += next;
          }
        
          arrayReader.close();
        }
      }
      catch(FileNotFoundException ex){
          System.out.println("File Not Found!");
      }
    }
  }
  
  public void play(){
    musicFile.play();
  }
  
  public void loop(){
    musicFile.loop();
  }
  
  public void pause(){
    musicFile.pause();
  }
  
  public int stop(){
    int position = musicFile.positionFrame();
    musicFile.stop();
    return position;
  }
  
  public void playNote(){
    if (nextNote < notes.size()){
      musicFile.stop();
      float noteLength = (float)(notes.get(nextNote) / totalDuration * musicFile.duration());
      musicFile.playFor(noteLength, position);
      position += noteLength;
      nextNote++;
    }
  }
  
  public boolean isPlaying(){
    return musicFile.isPlaying();
  }
}
