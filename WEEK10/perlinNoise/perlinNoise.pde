int cellSize = 10; 
color colors[][]; 
int cols, rows; 
void setup(){
  size(1000, 1000); 
  noStroke(); 
  cols = width/cellSize; 
  rows = height/cellSize; 
  
  colors = new color[cols][rows]; 

}

void draw(){
  float inc = 0.09; 
  float xoff = 0.0; 
  for(int i = 0; i<cols; i++){
    float yoff = 0.0; 
    xoff += inc;
    for(int j = 0; j<rows; j++){
      //colors[i][j] = color(0, 0, random(100, 255));
      yoff += inc; 
      float noiseVal = noise(xoff + millis()*.0001, yoff);
      
        
      if(noiseVal< .6){
       color fillColor = color(map(noiseVal, 0, .6, 0, 150), 
        map(noiseVal, 0, .6, 76, 225), 
        map(noiseVal, 0, .6, 175, 255)); 
        colors[i][j] = fillColor; 
      }
      if(noiseVal>=.6){
        color fillColor = color(map(noiseVal, .6, 1, 153, 255), 
        map(noiseVal, .6, 1, 229, 255), 
        map(noiseVal, .6, 1, 200, 255));
        colors[i][j] = fillColor; 
      }
      
      println(noiseVal); 
      fill(colors[i][j]); 
      rect(i*cellSize, j*cellSize, cellSize, cellSize);
    }
  }
}