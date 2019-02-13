Ball[] myBalls = {new Ball(100, 100, random(40, 80)), new Ball(400, 400, random(20, 30))}; 

void setup(){
  size(600, 600); 
}

void draw(){
  background(185,255,250); 
  
  for(Ball b: myBalls){//loops through the objects in the myBalls array
    b.update(); 
    b.display(); 
    b.checkBoundaries(); 
  }
  myBalls[0].checkCollision(myBalls[1]); 
}