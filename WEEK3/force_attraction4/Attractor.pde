class Attractor{
  float mass; //the weight of the object based on size
  float G; //gravitational force
  PVector position; 
  PVector dragOffset; 
  
  //booleans to detect if attractor is being clicked and dragged
  boolean rollover = false; 
  boolean dragging = false; 
  Attractor(){
    position = new PVector(width/2, height/2); //setting up the initial position for our
    //acctractor 
    
    mass = 30; 
    G = .98; 
    dragOffset = new PVector(0.0, 0.0); 
  }
  
   //we are calling our Mover class inside of our Attractor class
   //calculating the force of our attraction here and storing it in a PVector
  PVector attract(Mover m){
    //using the subtract method to calculate the distance between our attractor position
    //and the position of our mover
     PVector force = PVector.sub(position, m.position); 
     
     //using the magnitude method to get the magnitude of our vector (does not include direction)
     float d = force.mag(); 
     
     //constraining the maximum distance that our movers can go
     d = constrain(d, 5.0, 25.0); 
     force.normalize(); //remember magintude only returns a value; we need to normalize the vector
     //to get the direction of the force vector
     float strength = (G* mass * m.mass) / (d*d); //calculating the strength of our gravitational pull
     force.mult(strength); //our final force vector is --> magnitude * direction
     return force; //we return the value of our force here and store it in our attract PVector
  }
    // Method to display
  void display() {
    ellipseMode(CENTER);
    //fill(0, 100, 100); 
    if (dragging){
      fill (255, 255, 0);
    }
    else if (rollover){
      fill(100);
      fill(255, 150, 0); 
    }
    else{
      fill(0, 255, 255); 
    }
    ellipse(position.x,position.y,mass*2,mass*2);
  }
  
  void clicked(int mX, int mY){
    float d = dist(mX, mY, position.x, position.y); //calculating the position between the 
    //mouse and the attractor
    if(d < mass){ //if the distances is smaller than the size of the attractor
      dragging = true; 
      dragOffset.x = position.x - mX; //offsetting the position of attractor based on mouse
      dragOffset.y = position.y - mY; 
    } 
  }
  
void hover(int mx, int my) {
    float d = dist(mx,my,position.x,position.y);
    if (d < mass) {
      rollover = true;
    } 
    else {
      rollover = false;
    }
  }

  void stopDragging() {
    dragging = false;
  }

  void drag() {
    //if dragging is true, set the position of the attractor based on your mouse position
    if (dragging) {
      position.x = mouseX + dragOffset.x;
      position.y = mouseY + dragOffset.y;
    }
  }

}