//derived from Circle with Swapping Velocites, Ira Greenberg

class Ball{
  PVector position; 
  PVector velocity; 
  
  float size, mass; 
  

  
  Ball(float x, float y, float size){
    position = new PVector(x, y); 
    velocity = PVector.random2D(); //.random2D method generates a random 2dimensional vector
    //the value it returns is normalized, meaning only has direction with a unit value of 1
    
    velocity.mult(random(2,4)); //because the velocity vector only has direction, 
    //we multiple it by a random value between 2 and 4 to give it magnitude 
    
    this.size = size; 
    mass = size*.1; //assigning a mass to our ball that is 1/10 its radius
  }
  
  void update(){
    position.add(velocity); 
  }
  
  void checkBoundaries(){
    if(position.x> width-size || position.x<= size){
      velocity.x = -velocity.x; 
    }
    if(position.y> height-size || position.y<= size){
      velocity.y = -velocity.y; 
    }
  }
  
  void checkCollision(Ball otherB){
    for(int i = 0; i<n; i++){
      PVector dist = PVector.sub(otherB.position, position); //calculating the 
      //distance between the ball instances by subtracting their position vectors
      
      float distMag = dist.mag(); // remember magnitude is the value of our 
      //vector without direction. think of it like the absolute value for your vector
      
     float minDist = size + otherB.size; //calculating the distance at which the balls will
     //be touching
     
     if(distMag < minDist){ //if the distance between our positions is less than the 
     //distance between the balls radii 
        float distCorrection = (minDist - distMag)/2; 
        //calculates how much we need to correct our vector vel by 
        //calculates the direction that our ball bounces in after collision 
        
        PVector d = dist.copy(); // 
        PVector correctionVector = d.normalize().mult(distCorrection); //multiples 
        //our original dist vector by the new direction the ball needs to move in 
        
        otherB.position.add(correctionVector); //adds our new calculated vector to the other b
        position.sub(correctionVector); //subtracts the corrected direction 
       
        float theta = dist.heading(); //method that calculates the angle of rotation of a vector in 2 dimensions
        
        PVector[] bTemp = {new PVector(), new PVector()}; //we set up an 
       // array to store the current value and previous value of our ball positions
  
        bTemp[1].x  = cos(theta) * dist.x + sin(theta) * dist.y;
        bTemp[1].y  = cos(theta) * dist.y - sin(theta) * dist.x;
        
        PVector[] vTemp = {new PVector(), new PVector()}; 
        //do the same with the velocity 
        
        vTemp[0].x = cos(theta)*velocity.x + sin(theta)*velocity.y; 
        vTemp[0].y = cos(theta)*velocity.y - sin(theta)*velocity.x; 
        vTemp[1].x = cos(theta)*otherB.velocity.x + sin(theta)*otherB.velocity.y; 
        vTemp[1].y = cos(theta)*otherB.velocity.y - sin(theta)*otherB.velocity.x; 
        
        
        //our final vel is based on the conservation of momentum 
        //the rate of change in momentum is equal and opposite
        
        //for two obejcts A & B: 
        //massA * change in Velocity A = -massB * change in Velocity of B
        //massA * (velFinalA - initialVelocityA) = massB * (velFinalB - initialVelocityB)
        PVector[] vFinal = {new PVector(), new PVector()};
        
        
        //solving for the final velocity of object a in our above equation 
        vFinal[0].x = ((mass - otherB.mass) * vTemp[0].x + 2 * otherB.mass * vTemp[1].x) / (mass + otherB.mass);
        vFinal[0].y = vTemp[0].y;
  
        // final rotated velocity for b[0]
        vFinal[1].x = ((otherB.mass - mass) * vTemp[1].x + 2 * mass * vTemp[0].x) / (mass + otherB.mass);
        vFinal[1].y = vTemp[1].y;
  
        // hack to avoid clumping
        bTemp[0].x += vFinal[0].x;
        bTemp[1].x += vFinal[1].x;
  
  
        // rotate balls
        PVector[] bFinal = { 
          new PVector(), new PVector()
        };
  
        bFinal[0].x = cos(theta) * bTemp[0].x - sin(theta) * bTemp[0].y;
        bFinal[0].y = cos(theta) * bTemp[0].y + sin(theta) * bTemp[0].x;
        bFinal[1].x = cos(theta) * bTemp[1].x - sin(theta) * bTemp[1].y;
        bFinal[1].y = cos(theta) * bTemp[1].y + sin(theta) * bTemp[1].x;
  
        // update balls to screen position
        otherB.position.x = position.x + bFinal[1].x;
        otherB.position.y = position.y + bFinal[1].y;
  
        position.add(bFinal[0]);
  
        // update velocities
        velocity.x = cos(theta) * vFinal[0].x - sin(theta) * vFinal[0].y;
        velocity.y = cos(theta) * vFinal[0].y + sin(theta) * vFinal[0].x;
        otherB.velocity.x = cos(theta) * vFinal[1].x - sin(theta) * vFinal[1].y;
        otherB.velocity.y = cos(theta) * vFinal[1].y + sin(theta) * vFinal[1].x;
      }
    }
  }
  
  void display(){
    fill(255); 
    noStroke();
    ellipse(position.x, position.y, size*2, size*2); 
  }
}  