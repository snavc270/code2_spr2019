int num = 20; 
//want to have a grid of ellipses, 
//when click on one ellipse, the color changes 

//we have set up a series of two dimensional arrays; this allows use to 
//store data in two dimentions; think of it like a bingo grid; the first 
//[] stores info for the x coordinate and the second [] stores info for the y coordinate
int [][] grid = new int[num][num]; 
boolean [][] clicked = new boolean[num][num]; 
color [][] c = new color[num][num]; 

int size; 
void setup(){
  size (600, 600); 
  background(0); 
  noStroke(); 
  smooth(); 
  size = width/num; 
  //we technically only need one for loop here. 
  for(int i = 0; i< num; i++){
    for(int j = 0; j<num; j ++){
      
      //here we set up default values for every ellipse in our grid
      //initially won't be clicked and will have a white fill color
      clicked[i][j] = false; 
      c[i][j] = color(255); 
      
      
    }
  } 
}

void draw(){
  
  //we want to change the color only when clicking on a specific ellipse
  //for this we need to be able to keep track of each of the positions of the ellipses
  
  for(int i = 0; i<num; i++){
    for(int j = 0; j<num; j++){
    
      if(clicked[i][j] == false){
        if(mousePressed){
           //conditional to check if the mouse is in between boundaries of the ellipses 
           //for the x, if we plug in 0 for i, checking between 0 and 10 to detect the first ellipse
           //for the y, we are also checking between 0 and 10 for the first ellipse
           //with the double for loop, we can check every possible ellipse boundaries
           if(mouseX>=(i*size) && mouseX<((i+1)*size) && mouseY>=(j*size) && mouseY<((j+1)*size)){
             //here we change the color if it is within the boundaries and if we are pressing our mouse
             c[i][j] = color(random(0,255), random(0,255), random(0,255));
             
             //we need to set our ellipse click boolean to true to make sure the color change only occurs once 
             clicked[i][j] = true; 
           }
        }
      }
       fill(c[i][j]); 
       rect(i*size, j*size, size, size);  
    }
  }
}