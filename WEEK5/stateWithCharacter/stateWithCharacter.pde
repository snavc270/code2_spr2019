Character c;

float floor;

void setup() {
  size(800, 800);
  floor = (height*2)/3;
  c = new Character();
  textSize(40);
  textAlign(CENTER);
  strokeWeight(3);
}

void draw() {
  background(250);
  stroke(0);
  for (int i = 0; i < 50; i++) {
    line(0, floor + pow(i, 2)/1.5, width, floor + pow(i, 2));
  }

  fill(0);
  text("Press space to jump (i.e. change states)", width/2, 100);

  text("state: " + c.state, 450, floor - 50);

  c.update();
  c.display();
}

void keyPressed() {
  c.handleInput(key);
}

class Character {
  int state;  // 0 - standing, 1 - in air
  PVector pos;
  PVector vel;
  float grav;
  float w;
  float h;
  float baseh;
  
  Character() {
    w = 120;
    h = 100;
    baseh = 100;
    grav = 0.9;
    pos = new PVector(300, floor - baseh/2);
    vel = new PVector(0, 0);
  }
  
  void display() {

    switch (state) {
      case 0:
        fill(200, 150, 70);
        break;
      case 1:
        fill(200, 70, 190);
        break;
      default:
        break;
    }
    
    stroke(0);
    line(pos.x + 40, pos.y, pos.x + 70, pos.y + 20 - vel.y * 2);
    
    noStroke();
    h += ((baseh + vel.y * 2) - h) * 0.3;
    ellipse(pos.x, pos.y, w, h);
    
    stroke(0);
    line(pos.x - 40, pos.y, pos.x - 70, pos.y + 20 - vel.y * 2);
    
    fill(0);
    rect(pos.x - 10, pos.y + 20, 20 + state * 3, ((floor - baseh/2) - pos.y) * 0.05);
  
    fill(250);
    noStroke();
    ellipse(pos.x - 5, pos.y - 10, 20, 30);
    ellipse(pos.x + 30, pos.y - 10, 20, 30);
    
    fill(0);
    ellipse(pos.x - 5, pos.y - 10, 10, 10 + abs(vel.y));
    ellipse(pos.x + 30, pos.y - 10, 10, 10 + abs(vel.y));
    
  }
  
  
  void update() {
    switch (state) {
      case 0:
        vel.y = 0;
        break;
      case 1:
        pos.add(vel);
        vel.y += grav;
        if (pos.y + vel.y > floor - baseh/2) {
          state = 0;
          pos.y = floor - baseh/2;
        }
        break;
      default:
        break;
    }
  }
  
  void handleInput(char k) {
    println(k);
    switch (state) {
      case 0:
        if (k == ' ') {
          state = 1;
          vel.y = -20;
        }
        break;
      case 1:
        break;
      default:
        break;
    }
  }
}