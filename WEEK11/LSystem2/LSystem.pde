class LSystem {

  int steps = 0;

  String axiom;
  String rule;
  String production;

  float startLength;
  float drawLength;
  float theta;

  int generations;

  LSystem() {

    axiom = "F";
    rule = "F+F-F";
    startLength = 90.0;
    theta = radians(120.0);
    reset();
  }
  

  void reset() {
    production = axiom;
    drawLength = startLength;
    generations = 0;
  }

  int getAge() {
    return generations;
  }
  
  void render() {
    translate(width/2, height/2);
    steps += 5;          
    if (steps > production.length()) {
      steps = production.length();
    }
    for (int i = 0; i < steps; i++) {
      //where rules are happening 
      char step = production.charAt(i);
      if (step == 'F') {
        rect(0, 0, -drawLength, -drawLength);
        noFill();
        translate(0, -drawLength);
      } 
      else if (step == '+') {
        rotate(theta);
      } 
      else if (step == '-') {
        rotate(-theta);
      } 
      else if (step == '[') {
        pushMatrix();
      } 
      else if (step == ']') {
        popMatrix();            
      }
    }
  }
  //sets a limit for how many generations the system will produce
  void simulate(int gen) {
    while (getAge() < gen) {
      production = iterate(production, rule);
    }
  }
  //iterates through our L system 
// returns whatever string was calculated based on our generation
  String iterate(String prod_, String rule_) {
    drawLength = drawLength * 0.6; //think of our tree branches
    generations++; 
    String newProduction = prod_;     //same as replacing nextString with Current String     
    newProduction = newProduction.replaceAll("F", rule_);
    return newProduction; 
  }
}