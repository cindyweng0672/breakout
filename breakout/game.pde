void game() {
  background(black);

  //paddle
  fill(white);
  circle(px, py, 150);

  if (px>=width-75) {
    px=width-75;
  }
  if (px<=75) {
    px=75;
  }

  if (akey==true) {
    px-=5;
  }
  if (dkey==true) {
    px+=5;
  }

  //target 
  fill(white);
  circle(x, y, d);
  
  //lives
  if(y>=(height-d/2)){
    lives--;
    x=width/2;
    y=height/2;
  }
  
  textSize(20);
  text("lives   " +lives, 100, 700);
  text("score   "+score, 100, 600);
  
  if(lives==0){
    mode=GAMEOVER;
  }

  bounce();
  moveTarget();
  for (int i=0; i<ty.length; i++) {
    for (int j=0; j<tx.length; j++) {
      if(alive[j][i]==true){
        manageBricks(j, i);
      }
    }
  }
  
  if(allFalse(alive)){
    mode=GAMEOVER;
  }
}

void gameClicks() {
  mode=PAUSE;
}
