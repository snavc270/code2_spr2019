//from Bryan Ma Code1 fall 2017 
//https://github.com/whoisbma/Code_1_FA17/tree/master/week-12/stateMachine
int state = 0;

void setup() {
  size(600, 600);
  textAlign(CENTER, CENTER);
  rectMode(CENTER);
  fill(250);
}

void draw() {
  switch (state) {
  case 0:
    drawIntro();
    break;
  case 1:
    drawScene1();
    break;
  case 2:
    drawScene2();
    break;
  case 3:
    drawScene3();
    break;
  case 4:
    drawEnding();
  default:
    break;
  }
}

void keyPressed() {
  switch (state) {
  case 0:
    if (key == ' ') {
      state = 1;
    }
    break;
  case 1:
    if (key == 'a') {
      state = 2;
    } else if (key == 'z') {
      state = 3;
    }
    break;
  case 2:
    if (key == ' ') {
      state = 4;
    }
    break;
  case 3:
    if (key == ' ') {
      state = 4;
    }
    break;
  case 4:
    if (key == 'r') {
      state = 0;
    }
  default:
    break;
  }
}

void drawIntro() {
  background(0, 200, 120);
  textSize(42);
  text("intro stuff goes here", width/2, 150);
  textSize(24);
  text("press spacebar to start", width/2, height- 150);
}

void drawScene1() {
  background(200, 120, 0);
  textSize(24);
  text("to see a circle, press a", width/2, height/2);
  text("to see a square, press z", width/2, height/2 + 50);
}

void drawScene2() {
  background(120, 0, 200);
  textSize(24);
  text("look, a circle!", width/2, height/2 + 100);
  text("press spacebar to continue", width/2, height- 150);
  ellipse(width/2, height/2, 100 + sin(frameCount * 0.1) * 20, 100 + sin(frameCount * 0.1) * 20);
}

void drawScene3() {
  background(0, 120, 200);
  textSize(24);
  text("look, a square!", width/2, height/2 + 100);
  text("press spacebar to continue", width/2, height- 150);
  pushMatrix();
  translate(width/2, height/2);
  rotate(sin(frameCount * 0.01) * PI);
  rect(0, 0, 100, 100);
  popMatrix();
}

void drawEnding() {
  background(10);
  textSize(72);
  text("fin", width/2, height/2);
  textSize(24);
  text("press r to restart", width/2, height- 150);
}