void moveTarget() {
  x+=vx;
  y+=vy;
}

void bounce() { 
  if (y<=(d/2)) {
    vy=vy*-1;
    bump.rewind();
    bump.play();
  }

  if (x>=(width-d/2)||x<=(d/2)) {
    vx=vx*-1;
    bump.rewind();
    bump.play();
  }

  if (dist(x, y, px, py)<=(d/2+75)) {
    vx=(x-px)/20;
    vy=(y-py)/20;
    bump.rewind();
    bump.play();
  }

  if (vy==0) {
    vy+=random(-1, 1);
  }
}

void brickBounce(int a, int b) { 
  if (x>tx[a]-d && x<tx[a]+brickw+d && y>ty[b]-d && y<ty[b]+brickl+d) {
    vx=(x-tx[a])/20;
    vy=(y-ty[b])/20;
    if (vy==0) {
      vy+=random(-1, 1);
    }
    alive[a][b]=false;
    score++;
    coin.rewind();
    coin.play();
  }
}

void manageBricks(int a, int b) {
  if (ty[b]==0) fill(red);
  if (ty[b]==50) fill(orange);
  if (ty[b]==100) fill(yellow);
  if (ty[b]==150) fill(green);
  if (ty[b]==200) fill(blue);
  if (ty[b]==250) fill(purple);
  if (ty[b]==300) fill(red);
  rect(tx[a], ty[b], brickw, brickl);
  brickBounce(a, b);
}

void gif() {
  image(gif[count], 0, 0, width, height);
  count++;
  if (count==numOfFrames-1) {
    count=0;
  }
}

void setAlive() {
  for (int i=0; i<n; i++) {
    for (int j=0; j<m; j++) {
      alive[i][j]=true;
    }
  }
}

boolean allFalse(boolean[][] arr2D) { //<>//
  for (int i=0; i<arr2D.length; i++) {
    for (int j=0; j<arr2D[0].length; i++) {
      if (arr2D[i][j]) {
        return false;
      }
    }
  }
  return true;
}
