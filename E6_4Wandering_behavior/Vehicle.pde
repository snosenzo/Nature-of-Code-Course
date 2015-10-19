class Vehicle{
  PVector location, velocity, acceleration;
  float maxspeed, maxforce;
  float r;
  float theta = 0;
  Vehicle(float x, float y){
    acceleration = new PVector(0, 0);
    velocity = new PVector(0, 0);
    location = new PVector(x, y);
    r = 1;
    
    maxspeed = 1;
    maxforce = .1;
  }
  
  void update(){
    velocity.add(acceleration);
    velocity.limit(maxspeed);
    location.add(velocity);
    acceleration.mult(0);
  }
  
  void display(){
    detectBoundary();
    theta = velocity.heading() + PI/2;
    noFill();
    stroke(255, 15);
    pushMatrix();
    translate(location.x, location.y);
    rotate(theta);
    beginShape();
    vertex(0, -r*2);
    vertex(-r, r*2);
    vertex(r, r*2);
    endShape(CLOSE);
    createTarget();
    popMatrix();
  }
  
  void detectBoundary(){
    if(location.x < 0){
      location.x = width;
    } else if(location.x > width){
      location.x = 0;
    }
    if(location.y < 0){
      location.y = height;
    } else if(location.y > height){
      location.y = 0;
    }
  }
  
  
  
  float nx = random(10000);
  void createTarget(){
    //line(0, -r*2, 0, -r*10);
    //ellipse(0, -r*10, r*6, r*6);
    float angle = map(noise(nx), 0, 1, 0, TWO_PI);
    nx+=.01;
    PVector target= new PVector();
    target.x = r*3*cos(angle);
    target.y = -r*10 + r*3*sin(angle);
    
    //ellipse(target.x, target.y, 5, 5);
    target.y+=r*10;
    target.add(location);
    seek(target);
  }
    
  
  
  void seek(PVector target){
    PVector desired = PVector.sub(target, location);
    float d = desired.mag();
    desired.normalize();
    
 
     desired.mult(maxspeed); //scale vector to maxspeed;
    
   
    
    PVector steer = PVector.sub(desired, velocity); //Reynolds formula for steering force
    steer.limit(maxforce);
    
    applyForce(steer); //apply the force asa the object acceleration
    
  }
  
  void applyForce(PVector force){
    acceleration.add(force);
  }
}
  
  
  
    
