class Particle{
  PVector location, velocity, acceleration;
  float lifespan;
  float mass;
  
  Particle(PVector l, float m){
    location = l.get();
    acceleration = new PVector();
    velocity = new PVector();
    lifespan = 255;
    mass = m;
    mass = constrain(mass, 1, 6);
  }
  void update(){
    velocity.add(acceleration);
    location.add(velocity);
    lifespan -=2;
    acceleration.mult(0);
  }
  
  void display(){
    stroke(0, lifespan);
    fill(175, lifespan);
    ellipse(location.x, location.y, mass*10, mass*10);
  }
  
  void run(){
    update();
    display();
  }
  
  boolean isDead(){
    if(lifespan < 0.0){
      return true;
    } else{
      return false;
    }
  }
  
  void applyForce(PVector f){
    f.div(mass);
    acceleration.add(f);
  }
  
}
