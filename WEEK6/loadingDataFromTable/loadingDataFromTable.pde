// DT Bootcamp 2014, Parsons the New School for Design. 
// Day 7, Arrays - loadTable
//
// How to load table with high and low record temps of NYC in January
// and use those values to plot a bar chart

Table table; 
int numRows; 
int largestHigh, smallestHigh; 
int largestLow, smallestLow; 

void setup(){
  background(255); 
  size(displayWidth, displayHeight); 
  table = loadTable("nyWeather.csv", "header"); 
  //csv is a file type common with storing data
  
  //instead of writing our own forLoop here, we can use .getRowCount(); 
  numRows = table.getRowCount(); 
  println(numRows); 
  
  //creating arrays to store data from the columns; all should have the same size
  int[] year = new int[numRows];
  int[] high = new int[numRows];
  int[] low = new int[numRows];
  int[] yearMap = new int[numRows];
  int[] highMap = new int[numRows];
  int[] lowMap = new int[numRows];
  
  //our data is a table with 3 columns and 115 rows 
  for(int i = 0; i<numRows; i++){
    //get int function gets the integer from that row and column
    //first parameter is the row, second is the column 
    year[i] = table.getInt(i, 0); 
    low[i] = table.getInt(i, 1); 
    high[i] = table.getInt(i, 2); 
  }
  
  //here we set the largest and smallest values to the first item in the high column
  largestHigh = high[0]; 
  smallestHigh = high[0];
  
  for(int i = 0; i<numRows-1; i++){
    //if the row in the high column is bigger than the largest High, 
    //reset the value for the largestHigh to the newest value
    //will loop through the entire column until we have the largest value
    if(high[i] > largestHigh){
      largestHigh = high[i]; 
    }
    
    if(high[i]<smallestHigh){
       smallestHigh=high[i]; 
    }
    
    if(low[i] < smallestLow){
      smallestLow = low[i]; 
    }
    
    if(low[i] > largestLow){
      largestLow = low[i]; 
    }
  }
  
  //how would we do this for the low temperatures? 
  
  for(int i=0; i<numRows; i++){
    //mapping the values from our columns to the width and height of the screen 
    yearMap[i] = int(map(year[i], 1900, 2014, 0, width));
    highMap[i] = int(map(high[i], smallestLow, largestHigh, 0, height/2));
    lowMap[i] = int(map(low[i], smallestLow, largestHigh, 0, height/2));

    fill(0);
    line(0,height/2, width, height/2);
    
    //plot red rectangles for high temp records
    fill(255, 0, 0);
    rect(yearMap[i],height/2-highMap[i],2.5,highMap[i]);
    
    //check to see if low temps are negative, and if so shift the
    //x and y value of the rect corner
    if(low[i]>0){
      //plot blue rectangles for low temp records
      fill(0, 0, 255);
      rect(yearMap[i]+2.5,height/2-lowMap[i],2.5,lowMap[i]);
    }else if(low[i]<0){
      //plot blue rectangles for low temp records
       fill(0, 0, 255);
       rect(yearMap[i]+2.5,height/2,2.5,abs(lowMap[i]));
    }
  }
}