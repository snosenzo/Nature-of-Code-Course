class Particle{
  PVector location, velocity, acceleration;
  float lifespan;
  float mass;
  boolean dead = false;
  
  Particle(PVector l){
    mass = 1;
    lifespan = 255;
    acceleration = new PVector(0, 0);
    velocity = new PVector(random(-1, 1), random(-2, 0));
    location = l.get();
  }
  
  void run(){
      update();
      display();
      dead = isDead();
    }
    
    void update(){
      velocity.add(acceleration);
      location.add(velocity);
      
      acceleration.mult(0);
      lifespan-=2;
    }
    
    void display(){
      stroke(0, lifespan);
      fill(0, lifespan);
      ellipse(location.x, location.y, 8, 8);
    }
    
    void applyForce(PVector force){
      PVector f = force.get();
      f.div(mass);
      acceleration.add(f);
    }
    
    boolean isDead(){
      if( lifespan < 0.0){
        return true;
      }
      else {
        return false;
      }
    }
    
    void behave(Particle p){
       PVector force = PVector.sub(location, p.location);
       float distance = force.mag();
       
       force.normalize();
       float mag;
       
       
       if(distance < 50){
         distance = constrain(distance, 5, 50);
         mag = -1 * 100 / (distance * distance);
         force.mult(mag);
       }
       else if(distance > 50 && distance < 150){
         force.mult(0);
       } else {
         distance = constrain(distance, 5, 10);
         mag = 3000 / (distance * distance);
         force.mult(mag);
       }
       
       applyForce(force);
    }
         
    
    
}

class Confetti extends Particle{
  float angle, aVel, aAcc;
  Confetti(PVector l){
    super(l);
    angle = random(TWO_PI);
    aVel = 0;
    aAcc = 0;
 
  }
  
  void update(){
    super.update();
    aAcc = velocity.mag()/1000;
    aVel+=aAcc;
    angle+=aVel;
    
  }
  
  
  
  void display(){
    rectMode(CENTER);
    fill(175, lifespan);
    stroke(0, lifespan);
    pushMatrix();
      translate(location.x, location.y);
      rotate(angle);
      rect(0,0, 10, 5);
    popMatrix();
  }
}