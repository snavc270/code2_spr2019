//instead of a single object, make this sketch with 
//100 ojects that all have varrying mass

Obj myObject; 

void setup(){
  size(800, 600); 
  
  myObject = new Obj();  
}

void draw(){
  background(255); 
  
  PVector gravity; 
  PVector wind; 
  
  myObject.display(); 
  myObject.move(); 

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

  }
  
  //cuse the force = mass*acceleration formula to calc here  
  void addForce(PVector force){
     
  }
}