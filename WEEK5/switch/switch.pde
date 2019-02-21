int sceneNumber = 0; 

void setup(){
  fullScreen(2); 
}

void draw(){
  switch(sceneNumber){
    case 0 :
      scene0(); 
      break; 
    case 1: 
      scene1(); 
      break; 
    case 2: 
      scene2(); 
      break; 
    case 3: 
      scene3(); 
      break; 
    case 4:
      sceneNumber = 0; 
      break; 
  }
  
  fill(255); 
  rect(width/2, height/2, 100, 100); 
  rectMode(CENTER); 
  
}

void mousePressed(){
  if(mouseX> (width/2 -50) && mouseX<(width/2+50)
     && mouseY > (height/2 - 50) && mouseY <(height/2 +50)){
      sceneNumber ++;   
      println("this worked"); 
  }
}

void scene0(){
  background(255, 0, 255); 
}

void scene1(){
  background(0, 0, 255); 
}

void scene2(){
  background(0, 255, 255); 
}

void scene3(){
  background(255, 0, 0); 
}