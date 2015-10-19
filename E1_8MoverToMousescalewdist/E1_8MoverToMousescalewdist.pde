class Mover {
  
  PVector location;
  PVector velocity;
  PVector acceleration;
  PVector mouse;
  float tx;
  float ty;
  float topspeed;
  
  Mover() {
    location = new PVector(width/2, height/2);
    velocity = new PVector(0,0);
    acceleration = new PVector(0,0);
    mouse = new PVector(0, 0);
    topspeed = 10;
    tx = 0;
    tx = 1000;
  
  }
  
  void update(){
    mouse.x = mouseX;
    mouse.y = mouseY;
    acceleration = PVector.sub(mouse, location);
    acceleration.normalize();
    acceleration.mult(map(dist(mouse.x, mouse.y, location.x, location.y), 0, 700, 0, 1));
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
