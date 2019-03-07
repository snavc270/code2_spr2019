float xPos, yPos; 


void setup(){
  size(500, 500); 
  float theta; 
}

void draw(){
  background(255); 
  
  theta+=.01; 
  
  
  xPos = sin(theta)*width/2; 
  yPos = cos(theta)*height/2; 
  
  fill(255); 
  ellipse(xPos, yPos, 50, 50); 
  fill(0); 
  text(str(addition(xPos, yPos)), xPos-15, yPos);     
}

int addition(float a, float b){
  int sum = a + b; 
}