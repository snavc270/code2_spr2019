//Ball[] myBalls = {new Ball(100, 100, random(40, 80)), new Ball(400, 400, random(20, 30))}; 
int n = 10; 

Ball [] myBalls; 
void setup(){
  size(600, 600);
  
  myBalls = new Ball[n];
  
  for(int i = 0; i<n; i++){
    myBalls[i] = new Ball(100+random(0,width-200),100+random(0,height-200), random(20,40)); 
  }
}

void draw(){
  background(185,255,250); 
  
  for(Ball b: myBalls){//loops through the objects in the myBalls array
    b.update(); 
    b.display(); 
    b.checkBoundaries(); 
    //b.checkCollision(myBalls); 
  }
  for(int i = 0; i<n; i++){
    for(int j = 0; j<n; j++){
      if(i!=j){
        myBalls[i].checkCollision(myBalls[j]);
      }  
    } 
  }
  //myBalls[0].checkCollision(myBalls[1]); 
}