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
  }
  
  
  //your vector calculations 
  for(int i = 0; i<4; i++){
    //your first line should be normalized 
    
    //your second line should have the magnitude of the 
    //distance between the center point and the mouse position
    
    
    //your third line should have a magintude of half the distance between the mouse 
    //and the center of the line
    
    
    //your forth line should always have a magnitude of 100 
    //it's direction should be based on the mouse position; 
    
    pushMatrix(); 
    translate(width/2, lineCenter[i].y); 
    line(0,0, lineEnd[i].x, lineEnd[i].y); 
    popMatrix(); 
    
    ellipse(lineCenter[i].x, lineCenter[i].y, lineEnd[i].mag()/2, lineEnd[i].mag()/2);
  } 
}