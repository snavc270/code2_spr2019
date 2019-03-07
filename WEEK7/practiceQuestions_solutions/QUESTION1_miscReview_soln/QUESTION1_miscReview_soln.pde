float xPos, yPos; 
float theta; 

void setup(){
  size(500, 500); 
}

void draw(){
  background(255); 
  
  theta+=.01; 
  xPos = sin(theta)*width/2 + width/2 ; 
  yPos = height/2; 
  
  fill(255); 
  ellipse(xPos, yPos, 50, 50); 
  fill(0); 
  text(str(addition(xPos, yPos)), xPos-15, yPos);     
}

float addition(float a, float b){
  float sum = a + b; 
  return round(sum); 
}