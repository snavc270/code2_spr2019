### Question 1 
Fix the sketch for all syntax and logic errors so it matches the example gif. 

![](https://github.com/snavc270/code2_spr2019/blob/master/MIDTERM/question1.gif?raw=true "")

```
float radius;
int scale = 5; 

void setup(){
  size(500, 500); 
}

void draw(){
  background(0); 
  
  
  text(printText(), width*.1, height*.1); 
  ellipse(width/2, height/2, radius, radius);  
}

float printText(){
 
}
``` 





### Question 2
Fix the sketch so that the object is attracted to the mouse position. 
![](https://github.com/snavc270/code2_spr2019/blob/master/MIDTERM/question2.gif?raw=true "")

```
Object myObject; 

void setup(){
  size(600, 600); 
  
  myObject = new Object(); 
}

void draw(){
  background(255); 
  myObject.move(); 
  myObject.checkBoundaries(); 
  myObject.display(); 
}


class Object{
  PVector pos, vel, accel; 
  
  Object(){
    pos = new PVector(width/2, height/2); 
    vel = new PVector(0, 0); 
    
  }
  
  void move(){
    PVector mouse = new PVector(mouseX,mouseY);
    accel = PVector.sub(mouse,pos);
    
    //normalize your accel vector here
    
    vel.limit(4); 
    
    //basic movement vector addition here...
  }
  
  void display() {
    stroke(0);
    fill(175);
    ellipse(pos.x,pos.y,30,30);
  }
  
  void checkBoundaries(){
    //add logic here so when the ellipse gets to the edge of the 
    //it is positioned on the opposite side
  }
}
```




### Question 3 
Currently the sketch is set up for a single object. Add a new object every time you click the mouse, add gravity and wind to the objects. 
![](https://github.com/snavc270/code2_spr2019/blob/master/MIDTERM/question2.gif?raw=true "")

```

Object myObject;  

void setup(){
  size(600, 600); 
  
  myObject = new Object(width/2, height/2); 
}

void draw(){
  background(255); 
  
  PVector gravity = new PVector(0, .1*o.mass); 
  PVector wind = new PVector(0.1, 0); 

  myObject.move(); 
  myObject.checkBoundaries(); 
  myObject.display(); 
   
}

void mousePressed(){

}


class Object{
  PVector pos, vel, accel; 
  float mass; 
  
  Object(float x, float y){
    pos = new PVector(x, y); 
    vel = new PVector(0, 0); 
    accel = new PVector(0, 0); 
    
    mass = random(5, 20); 
  }
  
  void move(){
    vel.add(accel); 
    pos.add(vel); 
    
    accel.mult(0); 
  }
  
  void display() {
    stroke(0);
    fill(175);
    ellipse(pos.x,pos.y,mass*3,mass*3);
  }
  
  void checkBoundaries() {
    if (pos.x > width) {
      pos.x = width;
      vel.x *= -1;
    } else if (pos.x < 0) {
      vel.x *= -1;
      pos.x = 0;
    }
 
    if (pos.y > height) {
      vel.y *= -1;
      pos.y = height;
    }
  } 
  
  void addForce(PVector force){
    
  }
}

```

### Question 4 
Create a state machine with 4 different scenes using a switch. (no example sketch, I'll just be looking to make sure your switch is working properly)




### Question 5 
Export the color of the background to a csv file so that when you reload the scene it loads with same color as when the sketch was closed. 

```
float r; 
color bgColor; 

void setup(){
  size(600, 600); 

}

void draw(){
  background(bgColor); 
  text("back ground # : " + bgColor, 100, 100); 
}

void mousePressed(){
  bgColor = color(random(0,255), random(0,255), random(0,255)); 
  ellipse(mouseX, mouseY, 50, 50); 
}
```

