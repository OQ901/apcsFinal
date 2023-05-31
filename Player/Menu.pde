PImage button;
String[] myMenus ={"Level1","Level2","Level3","Level4","Level5","Level6"};
int nMenus=myMenus.length;
int cursPos=0;
int button_width=150;
int button_height=50;

int[] button_x1,button_y1;

void menuSettings(){
  size(480,720);
}

void menuSetup(){
  button_x1 = new int[nMenus];
  button_y1 = new int[nMenus];
  
  int x1=0;
  int padding=20;
  
  for(int i=0;i<nMenus;i++){
    button_x1[i]=30;
    button_y1[i]=50+x1;
    x1+=button_height+padding;
  }
}

void drawMenu(){
  background(255,255,255);
  displayMenus();
}

//void mousePressed(){
//  exit();//temp
//}

void displayMenus(){
  menuSetup();
  fill(255);
  textSize(35);
  for(int i=0;i<nMenus;i++){
   button = loadImage("img/button.jpg");
   image(button,button_x1[i],button_y1[i]);
   int y1 = (button_width-(int)textWidth(myMenus[i]))/2+7;
   text(myMenus[i],button_x1[1]+30,button_y1[i]+y1);
  }
}
