void setup(){
  size(600, 600); 
  background(255); 
  noFill(); 
  rectMode(CENTER); 
}

void draw(){
  background(255); 
  drawRect(width/2, height/2, width); 
}

void drawRect(int x, int y, float radius){
  rect(x, y, radius, radius); 
  
  if(radius > 10){ //base case 
    radius *= .75; 
    pushMatrix(); 
    translate(x, y); 
    float theta = mouseY/2; 
    //theta+=30; 
    rotate(radians(theta)); 
    //drawRect(x/4, y/4, radius/2);
    drawRect(0, 0, radius);
    popMatrix(); 
  }
}