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

Mover[] movers = new Mover[10];
int len = 5;
PVector[] pockets = new PVector[len];
float[] radii = new float[len];
void setup(){
  size(640, 360);
  background(255);
  for(int i = 0; i<movers.length; i++){
    movers[i] = new Mover(random(.1, 5), 0, 0);
  }
  for(int j = 0; j < pockets.length; j++){
    pockets[j] = new PVector(random(width), random(height));
    radii[j] = random(50);
  }
    
}

void draw(){
  background(255);
  for(int i = 0; i<movers.length; i++){
    for (int j = 0; j<pockets.length; j++){
      ellipse(pockets[j].x, pockets[j].y, radii[j]*2, radii[j]*2);
      float d = dist(movers[i].location.x, movers[i].location.y, pockets[j].x, pockets[j].y);
      if( d < radii[j]){
        float c = .1;
        PVector friction = movers[i].velocity.get();
        friction.normalize();
        friction.mult(-1);
        friction.mult(c);
        movers[i].applyForce(friction);
      }
    }
    PVector wind = new PVector(.01, 0);
    float m = movers[i].mass;
    PVector grav = new PVector(0, 0.1*m);

    movers[i].applyForce(wind);
    movers[i].applyForce(grav);
    movers[i].update();
    movers[i].checkEdges();
    movers[i].display();
  }

}
