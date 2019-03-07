Obj myObject; 

void setup(){
  size(800, 600); 
  
  myObject = new Obj();  
}

void draw(){
  background(255); 
  
  PVector gravity = new PVector(0, .1*myObject.mass); 
  PVector wind = new PVector(0.1, 0); 
  
  myObject.display(); 
  myObject.move(); 
  myObject.checkBoundaries(); 
  myObject.addForce(gravity); 
  myObject.addForce(wind); 
  
  
}

class Obj{
  float mass; 
  PVector pos, vel, accel; 
  
  Obj(){
    pos = new PVector(random(width), random(height)); 
    vel = new PVector(0, 0); 
    accel = new PVector(0, 0); 
    
    mass = 10.0; 
  }
  
  void display(){
    fill(50, 60) ;
    ellipse(pos.x, pos.y, mass*10, mass*10); 
  }
  
  void move(){
    vel.add(accel); 
    pos.add(vel); 
    
    accel.mult(0); 
  }

  void checkBoundaries() {
    if (pos.x > width) {
      pos.x = width;
      vel.x *= -1;
    } else if (pos.x < 0) {
      vel.x *= -1;
      pos.x = 0;
    }
 
    if (pos.y > height) {
      vel.y *= -1;
      pos.y = height;
    }
  }
  
  void addForce(PVector force){
    force.div(mass); 
    accel.add(force); 
  }
}