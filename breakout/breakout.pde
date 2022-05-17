import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

//mode frame work 
int mode;
final int INTRO=0;;
final int GAME=1;
final int PAUSE=2;
final int GAMEOVER=3;
final int OPTION=4;

color black=#151414;
color white=#FFFFFF;
color darkGreen=#23982C;
color darkBlue=#1A49C6;
color yellow=#FFFFAD;
color orange=#FFD45D;
color red=#FC7954;
color green=#08B900;
color blue=#5F5DFF;
color purple=#C26FFA;

//target
int x, y, d;
float vx, vy;
int n=9;
int m=6;
int[] tx=new int[n];
int[] ty=new int[m];
boolean[][] alive=new boolean[n][m];
int brickl=30;
int brickw=80;
int tempx=40;
int tempy=50;
int lives=3;
int count=0;
int score=0;

//paddle
int px=width/2;
int py=height;

//keyboard 
boolean akey, dkey;

PFont font;
int numOfFrames=17;
PImage[] gif=new PImage[numOfFrames];

//audio
Minim minim;
AudioPlayer coin, bump, gameover, theme;

void setup(){
  size(800, 800);
  
  x=width/2;
  y=height/2;
  vx=0;
  vy=3;
  d=30;
  px=width/2;
  py=height;
  
  font=createFont("1up.ttf", 20);
  
  //input target array
  for(int i=0; i<n; i++){
    tx[i]=tempx;
    tempx+=brickw;
  }
  
  for(int j=0; j<m; j++){
    ty[j]=tempy;
    tempy+=50;
  }
  
  setAlive();
  
  //input gif array
  
  for(int i=0; i<numOfFrames; i++){
    gif[i]=loadImage("frame_0"+i+"_delay-0.03s.png");
  }
  
 //sound
  minim = new Minim(this);
  coin = minim.loadFile("coin.wav");
  bump = minim.loadFile("bump.wav");
  gameover = minim.loadFile("gameover.wav");
  theme = minim.loadFile("intro.wav");
  
  //play audio+rewind
  theme.rewind();
  theme.play();
}

void draw(){
  if (mode==INTRO){
    intro();
  }else if (mode==GAME){
    game();
  }else if (mode==PAUSE){
    pause();
  }else if(mode==GAMEOVER){
    gameOver();
  }else{
    println("Mode Error:"+mode);
  }
}
