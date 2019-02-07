ArrayList<Sparkles> mySparkles; 


void setup(){
  //fullScreen(); 
  size(800, 800); 
  mySparkles = new ArrayList<Sparkles>(); 
}

void draw(){
  background(0); 
  
    for (int i = mySparkles.size()-1; i >= 0; i--) {
    Sparkles s = mySparkles.get(i);
    s.run();
    if (s.done()) {
      mySparkles.remove(i);
    }
  }

}

void mousePressed(){
   mySparkles.add(new Sparkles(mouseX,mouseY)); 
}