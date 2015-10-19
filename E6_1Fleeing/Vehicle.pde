class Vehicle{
  PVector location, velocity, acceleration;
  float maxspeed, maxforce;
  float r;
  
  Vehicle(float x, float y){
    acceleration = new PVector(0, 0);
    velocity = new PVector(0, 0);
    location = new PVector(x, y);
    r = 3.0;
    
    maxspeed = 100;
    maxforce = .1;
  }
  
  void update(){
    velocity.add(acceleration);
    velocity.limit(maxspeed);
    location.add(velocity);
    acceleration.mult(0);
  }
  
  void display(){
    float theta = velocity.heading() + PI/2;
    fill(0);
    stroke(255);
    pushMatrix();
    translate(location.x, location.y);
    rotate(theta);
    beginShape();
    vertex(0, -r*2);
    vertex(-r, r*2);
    vertex(r, r*2);
    endShape(CLOSE);
    popMatrix();
  }
  
  
  void seek(PVector target){
    float d = dist(target.x, target.y, location.x, location.y);
    if(d < 100){
      PVector desired = PVector.sub(target, location);
      desired.normalize();
      desired.mult(-maxspeed); //scale vector to maxspeed;
      
      PVector steer = PVector.sub(desired, velocity); //Reynolds formula for steering force
      steer.limit(maxforce);
      
      applyForce(steer); //apply the force asa the object acceleration
    }  
  }
  
  void applyForce(PVector force){
    acceleration.add(force);
  }
}
  
  
  
    
