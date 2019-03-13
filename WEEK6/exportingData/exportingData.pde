//example from processing: a programming handbook for visual designers 

//saving data from our sketch to a data file 

//initially our arrays do not contain any data
int [] x = new int[0]; 
int [] y = new int [0]; 

String[] points; 

void setup () {
  size(600, 600); 
  
  points = loadStrings("lines.txt"); 
}

void draw() {
  stroke(0); 
  noFill(); 
  beginShape(); 
  background(0);
  for (int i = 0; i<x.length; i++) {
    //store the vertexes of our shape in our x and y arrays 
    vertex(x[i], y[i]);
    fill(0, 0, 255); 
    ellipse(x[i], y[i], 10, 10); 
  }
  endShape(); 

  //if we have more than 1 vertex in our shape, show a preview of where our next vertex will be drawn
  if (x.length >= 1) {
    stroke(255); 
    //here we draw a line from our current mouse position, to the last position in our x and y arrays 
    line(mouseX, mouseY, x[x.length-1], y[y.length-1]);
  }
}

void mousePressed() {
  //append our x and y arrays with the current mouseX, mouseY positions whenever you click your mouse
  x = append(x, mouseX); 
  y = append(y, mouseY);
  
}

void keyPressed() {
  if (key == 's') {
    //create a string array to store the positions of your vertexes 
    String[] lines = new String[x.length]; 
    for (int i = 0; i<x.length; i++) {
      lines[i] = x[i] + "\t" + y[i]; //adding data from your positions array to the lines of your string array 
      //"\t" is code for tab, creates separate columns in your data table
      points = append(points, lines[i]);   
  }
    //save your data to a .txt file 
    saveStrings("lines.txt", points); 
    exit(); //stops the program when you're not pressing a key
  }
}