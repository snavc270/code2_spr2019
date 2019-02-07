// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

//single attraction point 
Mover mover; 
Attractor a; 

void setup(){
   size(500, 500); 
   mover = new Mover(random(.1, 2), random(width), random(height)); 
   a = new Attractor(); 
   
}

void draw(){
  background(0); 
  
  a.display(); 
  
  PVector force = a.attract(mover); 
  
  mover.applyForce(force); 
  mover.update(); 
  mover.display(); 
  
}