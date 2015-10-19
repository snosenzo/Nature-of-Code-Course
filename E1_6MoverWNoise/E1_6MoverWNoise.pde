class Mover {
  
  PVector location;
  PVector velocity;
  PVector acceleration;
  
  float tx;
  float ty;
  float topspeed;
  
  Mover() {
    location = new PVector(width/2, height/2);
    velocity = new PVector(0,0);
    acceleration = new PVector(0,0);
    topspeed = 10;
    tx = 0;
    tx = 1000;
  
  }
  
  void update(){
    acceleration.x = map(noise(tx), 0, 1, -.1, .1);
    acceleration.y = map(noise(ty), 0, 1, -.1, .1);
    
    velocity.add(acceleration);
    location.add(velocity);
    velocity.limit(topspeed);
    tx+=.005;
    ty+=.005;
    
  }
  
  void display(){
    stroke(0);
    fill(175);
    
    ellipse(location.x, location.y, 16, 16);
  }
  
  void checkEdges(){
    if(location.x > width){
      location.x = 0;
    } else if (location.x < 0){
      location.x = width;
    }
    
    if(location.y > height){
      location.y = 0;
    } else if (location.y <0){
      location.y = height;
    }
  }
}

Mover mover;

void setup(){
  size(640, 360);
  background(255);
  mover = new Mover();
}

void draw(){
  background(255);
  mover.update();
  mover.checkEdges();
  mover.display();
}
