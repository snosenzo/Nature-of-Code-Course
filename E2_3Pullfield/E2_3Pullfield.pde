class Mover {
  
  PVector location;
  PVector velocity;
  PVector acceleration;
  PVector mouse;
  float mass;
  

  float topspeed;
  
  Mover(float m, float x, float y) {
    mass = m;
    location = new PVector(x, y);
    velocity = new PVector(0,0);
    acceleration = new PVector(0,0);
  }
  
  void update(){
    velocity.add(acceleration);
    location.add(velocity);
    acceleration.mult(0);

  }
  
  void display(){
    stroke(0);
    fill(0, 50);
    ellipse(location.x, location.y, mass*16, mass*16);
  }
  
  void checkEdges(){
    if (location.x < 0 || location.x > width){
      velocity.x = velocity.x * -1;
    }
    
    if (location.y < 0 || location.y > height){
      velocity.y = velocity.y * -1;
    }
  }
  
  void applyForce(PVector force){
    PVector f = force.get();
    f.div(mass);
    acceleration.add(f);
  }
}

Mover[] movers = new Mover[100];

void setup(){
  size(640, 360);
  background(255);
  for(int i = 0; i<movers.length; i++){
    movers[i] = new Mover(random(.1, 5), 0, 0);
  }
}

void draw(){
  background(255);
  for(int i = 0; i<movers.length; i++){
    
    PVector bot = new PVector(0, map(dist(0, movers[i].location.y, 0, 0), 0, height, 0, -3));
    PVector top = new PVector(0, map(dist(0, movers[i].location.y, 0, 0), 0, height, 3, 0));
    PVector left = new PVector(map(dist(movers[i].location.x, 0, 0, 0), 0, width, 3, 0), 0);
    PVector right = new PVector(map(dist(movers[i].location.x, 0, 0, 0), 0, width, 0, -3), 0);
    movers[i].applyForce(bot);
    movers[i].applyForce(top);
    movers[i].applyForce(left);
    movers[i].applyForce(right);
    movers[i].update();
    movers[i].checkEdges();
    movers[i].display();
  }

}
