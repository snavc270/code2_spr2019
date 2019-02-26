String [] lines; 
int index = 0; 

void setup(){
  size(600, 600); 
  background(0); 
  //this is the text file we wrote in the export data example; 
  //should be located in a folder named data 
  lines = loadStrings("lines.txt"); 
  noSmooth(); 
}

void draw(){
  
  fill(0, 0, 255); 
  if(index <lines.length){
    //for as many lines are in our data table, split the data wherever there is a tab (every column) 
    //store this in a string array called pieces 
    String[] pieces = split(lines[index], "\t"); 
    
    //if there are two columns in our pieces array
    if(pieces.length == 2){
       int x = int(pieces[0]); 
       int y = int(pieces[1]); 
       ellipse(x, y, 10, 10); 
    }
    index++; 
    //increment through all of the lines of our data table
  }
  
  ///////////////////////////////////////////////////////////////////////////
  //EXTRA CREDIT
  //RECREATE THE EXACT SHAPE THAT WAS GENERATED IN THE EXPORTING DATA SKETCH 
  //HINT STORE X AND Y COORDINATES IN AN ARRAY 
  //USE THESE AS YOUR VERTICES FOR YOUR SHAPE
  
}