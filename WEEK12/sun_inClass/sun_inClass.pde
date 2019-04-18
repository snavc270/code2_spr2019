PShape sun, planet1, planet2; 
PImage sunText, planet1Text, planet2Text; 

void setup(){
  fullScreen(P3D, 2); 
  
  sunText = loadImage("sun.jpeg"); 
  planet1Text = loadImage("earth.jpg");
  planet2Text = loadImage("jupiter.jpg"); 
  
  fill(225); 
  noStroke(); 
  
  sun = createShape(SPHERE, 200); 
  sun.setTexture(sunText); 
  
  planet1 = createShape(SPHERE, 150); 
  planet1.setTexture(planet1Text); 
  
  planet2 = createShape(SPHERE, 100); 
  planet2.setTexture(planet2Text);
}

void draw(){
  background(0); 
  
  pushMatrix(); 
  translate(width/2, height/2, -250); //translate the sun
    
    pushMatrix(); //set s new coordinate system for our canvas 
    rotateY(PI * frameCount / 500); 
    shape(sun); 
    popMatrix(); 
    
    rotateY(PI * frameCount / 300); 
    translate(0, 0, 500); 

    shape(planet1); 
    pushMatrix(); 
      rotateY(PI * frameCount / 300); 
    translate(0, 0, 300); 
    shape(planet2); 
    popMatrix(); 
  popMatrix(); 
  
  //translate(.75*width, .6 * height, 50); 

//homework make rotations more realistic 
//create a starfield using classes of spheres, and arrays 
//think about adding point lights/ spotlights 
}