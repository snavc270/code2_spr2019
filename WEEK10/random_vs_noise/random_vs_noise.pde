float rX, nX = 0; 
float rY, nY; 
float t; 

void setup(){
  size (800, 400); 
  background(255); 
}

void draw(){
  //using random function 
  if(rX < width){
    rX ++; 
    rY = random(0, height/2); 
  }
  
  
  //using noise 
  float n = noise(t); 
  float nY = map(n, 0, 1, height/2, height); 
  if(nX <width){
    nX ++;
  }

  rect(rX, rY, 2, 2); 
  rect(nX, nY, 2, 2);
  
  t+= 0.01; 
}