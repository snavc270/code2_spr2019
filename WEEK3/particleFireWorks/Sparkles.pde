// Daniel Shiffman
// http://codingtra.in
// http://patreon.com/codingtrain
// Code for: 

// A class to describe a group of Particles
// An ArrayList is used to manage the list of Particles 

class Sparkles {

  ArrayList<Particle> particles;    // An arraylist for all the particles
  Particle sparkle;
  float hu;
  float xPos, yPos; 
  PVector gravity = new PVector(0, 0.2);
  Sparkles(float _xPos, float _yPos) {
    hu = random(255);
    xPos = _xPos;
    yPos = _yPos; 
    sparkle = new Particle(xPos, yPos, hu);
    particles = new ArrayList<Particle>();   // Initialize the arraylist
  }
  
  boolean done() {
    if (sparkle == null && particles.isEmpty()) {
      return true;
    } else {
      return false;
    }
  }

  void run() {
    if (sparkle != null) {
      fill(hu,255,255);
      sparkle.applyForce(gravity);
      sparkle.update();
      sparkle.display();

      if (sparkle.explode()) {
        for (int i = 0; i < 40; i++) {
          particles.add(new Particle(sparkle.location, hu));    // Add "num" amount of particles to the arraylist
        }
        sparkle = null;
      }
    }

    for (int i = particles.size()-1; i >= 0; i--) {
      Particle p = particles.get(i);
      p.applyForce(gravity);
      p.run();
      if (p.isDead()) {
        particles.remove(i);
      }
    }
  }


  // A method to test if the particle system still has particles
  boolean dead() {
    if (particles.isEmpty()) {
      return true;
    } else {
      return false;
    }
  }
}