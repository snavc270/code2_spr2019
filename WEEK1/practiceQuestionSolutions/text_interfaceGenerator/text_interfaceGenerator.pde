String myStrings [] = {"inspirational quote", "so inspirational", "don't you feel so inspired", "motivating quotes are so motivating"}; 

int xPos[] = new int[4]; 

int size = 100; 

void setup(){
  size(600, 600); 
  
  int spacing = width/4; 
  
  for(int i = 0; i<4; i++){
    xPos[i] = i*spacing + int(size*.75);
  }
}

int indexer = 0; 
void draw(){
  background(255); 
  
 
  for(int i = 0; i<4; i++){
      if(dist(mouseX, mouseY, xPos[i], 100)<size/2 & mousePressed){
        indexer = i; 
        fill(255);
      }else{
        fill(0);
      }
      ellipse(xPos[i], 100, size, size);
  }
  
  displayText(indexer); 
}

void displayText(int n){
  fill(0); 
  textSize(24); 
  text(myStrings[n], width/2-textWidth(myStrings[n])/2, height/2); 
}