//Pentigree L-System by Geraldine Sarmiento. 

//This code was based on Patrick Dwyer's L-System class.

 

PentigreeLSystem ps;

void setup() {
  size(640, 360);
  ps = new PentigreeLSystem();
  ps.simulate(3);
}

void draw() {
  background(0);
  ps.render();
}



//class inheritance 
//when we "extend" a class, we are taking all of the properties from that class 
//and using them in the parent class 
class PentigreeLSystem extends LSystem {

  int steps = 0;
  float somestep = 0.1;
  float xoff = 0.01;

  PentigreeLSystem() {
    axiom = "F-F-F-F-F";
    rule = "F-F++F+F-F-F";
    startLength = 60.0;
    theta = radians(72);  
    reset();
  }

  void useRule(String r_) {
    rule = r_;
  }

  void useAxiom(String a_) {
    axiom = a_;
  }

  void useLength(float l_) {
    startLength = l_;
  }

  void useTheta(float t_) {
    theta = radians(t_);
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
    translate(width/4, height/2);
    steps += 3;          
    if (steps > production.length()) {
      steps = production.length();
    }

    for (int i = 0; i < steps; i++) {
      char step = production.charAt(i);
      if (step == 'F') {
        noFill();
        stroke(255);
        line(0, 0, 0, -drawLength);
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

}