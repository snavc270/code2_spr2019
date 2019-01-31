class Snowflakes{
  //position
  //color 
  //opacity 
  float x, y; 
  color c; 
  int o = 255; 
  float gravity; 
  float size; 

  Snowflakes(float _x, float _y){
    x = _x; 
    y = _y; 
    
    gravity = random(1,3); 
    size = random(5,15); 
  }
  
  void display(){
    fill(255, o); 
    ellipse(x, y, size, size); 
  }
  //draw
  
  void fall(){
    y += gravity; 
    o --; 
  }
  
  boolean isAlive(){
    if(y<height){
      return true; 
    }else{
      return false; 
    }
  }
  //fall 
    //gravity 
    //opacity 

  //boolean to check if our snowflake is alive 
}