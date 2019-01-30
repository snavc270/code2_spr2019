//2D 

//color 
//size 
//some conditional to see if we're 
//clicking on the square
//boolean 2d array 
int num = 60; // refer to the number of rows & cols
color c [][]; 
boolean clicked[][]; 
int size; 

void setup(){
  size(600, 600); 
  size = width/num; 
  
  c = new color[num][num];
  clicked = new boolean[num][num]; 
  
  noStroke(); 
  for(int i = 0; i<num; i++){
    for(int j = 0; j<num; j++){
      c[i][j] = color(random(0,255), random(0,255),
      random(0,255));
      clicked[i][j] = false; 
    }
  }
}

void draw(){
  for(int i=0; i<num; i++){
    for(int j = 0; j<num; j++){
      if(mouseX>i*size && mouseX<= (i+1)*size 
        && mouseY>j*size && mouseY<= (j+1)*size
        && mousePressed){
        clicked[i][j] = true;    
        println(i + " i: " + j + " j: " + clicked[i][j]); 
      }
      
      if(clicked[i][j]){
         fill(c[i][j]); 
      }else{
         fill(255); 
      }
      
      rect(i*size, j*size, size, size); 
    }
  }
  
}