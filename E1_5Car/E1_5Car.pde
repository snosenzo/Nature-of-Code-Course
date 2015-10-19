class Car{
  
  PVector loc;
  PVector vel;
  PVector acc;
  float topspeed = 20;
  
  Car (){
    loc = new PVector(width/2, height/2);
    vel = new PVector(0, 0);
    acc = new PVector(0, 0);
  }
  
  void update(){
    vel.limit(topspeed);
    vel.add(acc);
    loc.add(vel);
    
  }
  
  void display(){
    rectMode(CENTER);
    rect(loc.x, loc.y, 25, 50);
  }
  
  void up(){
    acc.y -=.001;
  }
  
  void down(){
    acc.y +=.001;
  }
  
  void right(){
    acc.x +=.001;
  }
  
  void left(){
    acc.x -=.001;
  }
  void checkEdges(){
    if(loc.x > width){
      loc.x = 0;
    } else if (loc.x < 0){
      loc.x = width;
    }
    
    if(loc.y > height){
      loc.y = 0;
    } else if (loc.y <0){
      loc.y = height;
    }
  }
}
Car car1;

void setup(){
  background(255);
  size(320, 640);
  car1 = new Car();
  fill(0);
}

void draw(){
  background(255);
  car1.update();
  car1.display();
  car1.checkEdges();
  if (keyPressed){
    if (key == CODED){
      if(keyCode == UP){
        car1.up();
      }
      if(keyCode == DOWN){
        car1.down();
      }
      if(keyCode == RIGHT){
        car1.right();
      }
      if(keyCode == LEFT){
        car1.left();
      }
    }
  }
}
  
  
  
  
