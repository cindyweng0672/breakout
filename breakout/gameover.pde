void gameOver(){
  theme.pause();
  gameover.play();
  
  gif();
  if(lives==0){
    textSize(50);
    text("You Lost", width/2, height/2);
  }
  if(lives!=0){
    textSize(50);
    text("You Won", width/2, height/2);
  }
  
  textSize(15);
  fill(white);
  rect(100, 600, 100, 50);
  fill(black);
  text("Restart", 150, 625);
  
  fill(white);
  rect(300, 600, 100, 50);
  fill(black);
  text("Exit", 350, 625);
}
void gameoverClicks(){
  if(mouseX>100 && mouseX<200 && mouseY<650 && mouseY>600){
    mode=GAME;
    lives=3;
    score=0;
    setAlive();
    gameover.pause();
    theme.rewind();
    theme.play();
  }
  if(mouseX<400 && mouseX>300 && mouseY<650 && mouseY>600){
    exit();
  }
}
