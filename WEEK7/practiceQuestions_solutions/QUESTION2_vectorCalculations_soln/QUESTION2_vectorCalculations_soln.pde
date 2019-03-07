PVector lineCenter[] = new PVector[4]; 
PVector lineEnd[] = new PVector[4]; 

void setup(){
  size(500, 500); 
  smooth(); 
  
  for(int i = 0; i<4; i++){
    lineCenter[i] = new PVector(width/2, i*height*.25 + 50); 
  }
 
}


void draw(){
  background(255);

  //initial value declarations 
  for(int i = 0; i<4; i++){
    lineEnd[i] = new PVector(mouseX, mouseY); 
    lineEnd[i].sub(lineCenter[i]); 
  }
  
  
  //your vector calculations 
  for(int i = 0; i<4; i++){
    
    
    lineEnd[0].normalize(); 
    
    lineEnd[2].mult(0.5);   
   
    lineEnd[3].normalize();  
    lineEnd[3].mult(100);
    
    pushMatrix(); 
    translate(lineCenter[i].x, lineCenter[i].y); 
    line(0,0, lineEnd[i].x, lineEnd[i].y); 
    popMatrix(); 
    
    ellipse(lineCenter[i].x, lineCenter[i].y, lineEnd[i].mag()/2, lineEnd[i].mag()/2);
  } 
}