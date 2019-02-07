// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

int num = 15; 
ArrayList<Mover> movers; 
Attractor a; 

void setup(){
   size(500, 500); 
    
   movers = new ArrayList<Mover>(); 
   a = new Attractor(); 
   noStroke(); 
   smooth(); 
}

void draw(){
  fill(0, 70); 
  rect(0, 0, width, height); 
  
  
  a.display(); 
  a.drag();
  a.hover(mouseX, mouseY);

  for(int i = 0; i< movers.size(); i++){
    Mover m = movers.get(i); 
    PVector force = a.attract(m);
    m.applyForce(force); 
    m.update(); 
    m.display(); 
    
    if(m.position.y < 0 || m.position.y > height || m.position.x < 0 || m.position.x > width){
      movers.remove(i); 
    }
  }
  
}

void mousePressed() {
  a.clicked(mouseX, mouseY);
  movers.add(new Mover(random(.1, .5), mouseX, mouseY)); 
}


void mouseReleased() {
  a.stopDragging();
}