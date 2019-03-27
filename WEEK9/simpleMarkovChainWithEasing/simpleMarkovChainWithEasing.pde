char c = 'b'; 
float xPos = 100; 
float  yPos = height/2;  
float targetX, targetY, easing; 

void setup(){
  size(400, 400); 
  easing = .1; 
}

void draw(){
  background(40); 
  println(stateProb()); 
  
  //you can use a switch here if you have multiple states
  
    if(c == 'a'){
      targetX = 100; 
      targetY = height/2; 
    }else if(c == 'b'){
      targetX = 300; 
      targetY = height/2; 
    }
  
  
  xPos += (targetX-xPos) * easing; 
  yPos += (targetY-yPos) * easing; 
  
  ellipse(xPos, yPos, 30, 30); 
  
  println(xPos); 
}

char stateProb(){
  float r = random(0,1); 
  //if our state is already in a, there is a 50% chance it will stay in a or go to b
  //if(xPos <= 101 || xPos>=299){
  if(c == 'a'){
    if(r<=.5){
      c = 'a'; 
    }else{
      c = 'b'; 
    }
  }
  if(c == 'b'){
    if(r>=.5){
      c = 'b'; 
    }else{
      c = 'a'; 
    }
  }
  //}
  return c; 
}