class Mover {
  
  PVector location;
  PVector velocity;
  PVector acceleration;
  PVector mouse;
  float mass;
  float topspeed;
  float r;
  Mover(float m, float x, float y) {
    mass = m;
    location = new PVector(x, y);
    velocity = new PVector(0,0);
    acceleration = new PVector(0,0);
    r = random(100);
  }
  
  void update(){
    velocity.limit(10);
    velocity.add(acceleration);
    location.add(velocity);
    acceleration.mult(0);

  }
  
  void display(){
    stroke(0);
    fill(0, 50);
    rectMode(CENTER);
    rect(location.x, location.y, r, r);
    rectMode(CORNER);
  }
  
  void checkEdges(){
    if (location.x < 0){
      location.x = 0;
      velocity.x = velocity.x * -1;
    }else if( location.x > width){
      location.x = width;
      velocity.x = velocity.x * -1;
    }
    
    if (location.y < 0){
      location.y = 0;
      velocity.y = velocity.y * -1;
    } else if( location.y > height){
      location.y = height;
      velocity.y = velocity.y * -1;
    }
  }
  
  void applyForce(PVector force){
    PVector f = force.get();
    f.div(mass);
    acceleration.add(f);
  }
  
  boolean isInside(Liquid l){
    if ( location.x>l.x && location.x<l.x+l.w && location.y>l.y && location.y<l.y+l.h){
      return true;
    } else {
      return false;
    }
  }
  void drag(Liquid l){
    float speed = velocity.mag();
    float dragMagnitude = l.c * speed * speed * r/30;
    
    PVector drag = velocity.get();
    drag.mult(-1);
    
    drag.normalize();
    
    drag.mult(dragMagnitude);
    
    applyForce(drag);
  }
  
}

class Liquid{
  float x, y, w, h;
  float c;
  
  Liquid(float ux, float uy, float uw, float uh, float uc){
    x = ux;
    y = uy;
    w = uw;
    h = uh;
    c = uc;
  }
  
  void display(){
    noStroke();
    fill(175);
    rect(x, y, w, h);
  }
}

Mover[] movers = new Mover[10];
Liquid liquid;

void setup(){
  size(640, 360);
  background(255);
  liquid = new Liquid(0, height/2, width, height/2, 0.1);
  for(int i = 0; i<movers.length; i++){
    movers[i] = new Mover(random(.2, 5), random(width), random(0, height/2-50));
  }
}




void draw(){
  background(255);
  liquid.display();
  for(int i = 0; i<movers.length; i++){
    if(movers[i].isInside(liquid)){
      movers[i].drag(liquid);
    }
    float m = movers[i].mass;
    PVector grav = new PVector(0, 0.1*m);
    movers[i].applyForce(grav);
    movers[i].update();
    movers[i].checkEdges();
    movers[i].display();
  }

}
