void intro(){
  textFont(font);
  
  gif();
  
  textAlign(CENTER, CENTER);
  textSize(50);
  fill(white);
  text("Breakout", width/2, height/2);
  
  fill(white);
  rect(width/2-100, 550, 200, 100);
  textSize(30);
  fill(black);
  text("Start", width/2, 600);
}
void introClicks(){
 if (mouseX<500 && mouseX>300 && mouseY<650 && mouseY>550){
    mode=GAME;
 }
}
