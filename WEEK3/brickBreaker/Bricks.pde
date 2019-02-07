class Bricks{
  float w, h; 
  float x, y; 
  int o = 255; 
  
  Bricks(float x, float y, int w, int h){
    this.x = x; 
    this.y = y; 
    
    this.w = w; 
    this.h = h; 
  }

  void display(color c){
    fill(c, o); 
    rect(x, y, w, h); 
  }
}