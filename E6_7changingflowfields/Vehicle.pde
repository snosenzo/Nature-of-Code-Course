class Vehicle{
  PVector location, velocity, acceleration;
  float maxspeed, maxforce;
  float r;
  
  Vehicle(float x, float y){
    acceleration = new PVector(0, 0);
    velocity = new PVector(0,0);
    location = new PVector(x, y);
    r = 1;
    
    maxspeed = 5;
    maxforce = .5;
  }
  
  void update(){
    //checkwalls();
    checkbound();
    velocity.add(acceleration);
    velocity.limit(maxspeed);
    location.add(velocity);
    acceleration.mult(0);
  }
  
  void display(){
    float theta = velocity.heading() + PI/2;
    noFill();
    stroke(255, 20);
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
  
  void checkwalls(){
    if(location.x > width-50){
      PVector desired = new PVector(-maxspeed, velocity.y);
      PVector steer = PVector.sub(desired, velocity);
      steer.limit(maxforce);
      applyForce(steer);
    } else if(location.x < 50){
      PVector desired = new PVector(maxspeed, velocity.y);
      PVector steer = PVector.sub(desired, velocity);
      steer.limit(maxforce);
      applyForce(steer);
    }
    if(location.y > height-50){
      PVector desired = new PVector(velocity.x, -maxspeed);
      PVector steer = PVector.sub(desired, velocity);
      steer.limit(maxforce);
      applyForce(steer);
    } else if(location.y < 50){
      PVector desired = new PVector(velocity.x, maxspeed);
      PVector steer = PVector.sub(desired, velocity);
      steer.limit(maxforce);
      applyForce(steer);
    }
  }
  
  void checkbound(){
    if(location.x < 0){
      location.x = width;
    } else if(location.x > width){
      location.x = 0;
    }
    
    if(location.y < 0){
      location.y = height;
    }else if(location.y > height){
      location.y = 0;
    }
  }
  
  void seek(PVector target){
    PVector desired = PVector.sub(target, location);
    desired.normalize();
    desired.mult(maxspeed); //scale vector to maxspeed;
    
    PVector steer = PVector.sub(desired, velocity); //Reynolds formula for steering force
    steer.limit(maxforce);
    
    applyForce(steer); //apply the force asa the object acceleration
    
  }
  
  void follow(FlowField flow){
    PVector desired = flow.lookup(location);
    desired.mult(maxspeed);
    
    PVector steer = PVector.sub(desired, velocity);
    steer.limit(maxforce);
    applyForce(steer);
  }
  
  void applyForce(PVector force){
    acceleration.add(force);
  }
}
  
  
  
    
