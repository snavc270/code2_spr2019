class Ball{
  PVector pos; 
  PVector vel; 
  
  int size = 20; 
  
  Ball(float x, float y, float xSpeed, float ySpeed){
    pos = new PVector(x, y); 
    vel = new PVector(xSpeed, ySpeed); 

  }
  
  void bounceSide(){
     vel.x = -vel.x; 

  }
  
  void bounceTop(){
     vel.y = -vel.y; 

  }
  
  void paddleBounce(){
     vel = vel.mult(-1); 
  }
  
  void move(){
    pos.add(vel);   
  }
  
  void display(){
    fill(255); 
    ellipse(pos.x, pos.y, size, size); 
  }
}