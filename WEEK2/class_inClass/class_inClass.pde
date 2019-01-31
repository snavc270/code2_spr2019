Snowflakes s;
ArrayList <Snowflakes> mySnow; 
void setup(){
  size(800, 600); 
  noStroke(); 
  s = new Snowflakes(random(0, width), 0);
  
  mySnow = new ArrayList<Snowflakes>(); 
}

void draw(){
  background(81, 123, 155); 
  
  for(int i = 0; i<mySnow.size(); i++){
    Snowflakes s = mySnow.get(i); 
    s.display(); 
    s.fall(); 
    
    if(s.isAlive() == false){
      mySnow.remove(i); 
    }
  }
  
  if(frameCount % 10 == 0){
    mySnow.add(new Snowflakes(random(0,width), 0)); 
  }
  //s.display(); 
  //s.fall(); 
  //if(s.isAlive() == false){
    
  //}
}