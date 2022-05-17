void pause(){
  gif();
  textFont(font);
  textSize(50);
  fill(white);
  
  text("Pause", width/2, height/2);
}
void pauseClicks(){
  mode=GAME;
}
