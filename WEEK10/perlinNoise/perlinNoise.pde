color [][] cGrid; 


int cellsize= 10; 
int size = 50; 

//int cLength = size-2; 
//int cRoughness = 90; 
//int cWindyness = 60; 
//
//int x, y; 
//int stepWidth;
//int step; 
//int totalRuns; 


void setup(){
  
  size(650, 640);
  cGrid = new color[width/cellsize][height/cellsize];
 
  //noiseSeed(0);

  
  background(0);
  noiseDetail(7, 0.4);  
  
}


void draw(){
  background(0); 

  float increment = 0.09; 
  float xoff = 0.0;
  for (int x = 0; x < width/cellsize; x++) {
    xoff += increment;
    float yoff = 0.0;
    for (int y = 0; y < height/cellsize; y++) {
      yoff += increment;
      float noiseVal = noise(xoff + millis()*.0005, yoff);
      
      if(noiseVal < 0.6){
         color fillColor = color(map(noiseVal, 0, 0.6, 0, 153),
        map(noiseVal, 0, 0.6, 76, 229), 
        map(noiseVal, 0, 0.6, 153, 255));   
        cGrid[x][y] = fillColor;
      }
      if(noiseVal >= 0.6){
         color fillColor = color(map(noiseVal, 0.6, 1, 153, 255), 
         map(noiseVal, 0.6, 1, 229, 255), map(noiseVal, 0, 0.6, 200, 255)); 
         cGrid[x][y]= fillColor; 
      }
    } 
  }

  for(int i = 0; i<height/cellsize; i++){
    for(int j = 0; j<width/cellsize; j++){
      fill(cGrid[j][i]);
      noStroke(); 
      rect(j*cellsize, i*cellsize, cellsize, cellsize); 
      
    }
  }
   
    
}