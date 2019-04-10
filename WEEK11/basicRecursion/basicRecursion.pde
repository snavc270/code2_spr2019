//basic recursion 
//calling a function inside of itself 
void setup(){
  size(600, 600); 
  background(255); 
}

void draw(){
    //circles 
    drawCircle(width/2, height/2, width); 
}

void drawCircle(int x, int y, float radius) {
  ellipse(x, y, radius, radius);
  if(radius > 2) {
    radius *= 0.75f;
    //what happens when we add more recursive functions? 
    drawCircle(x, y, radius);
  }
}