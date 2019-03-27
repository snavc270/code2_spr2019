char c = 'b'; 

void setup(){
  size(400, 400); 
}

void draw(){
  println(stateProb()); 
}

char stateProb(){
  float r = random(0,1); 
  //if our state is already in a, there is a 50% chance it will stay in a or go to b
  if(c == 'a'){
    if(r<=.5){
      c = 'a'; 
    }else{
      c = 'b'; 
    }
  }
  if(c == 'b'){
    if(r>=.5){
      c = 'b'; 
    }else{
      c = 'a'; 
    }
  }
  return c; 
}