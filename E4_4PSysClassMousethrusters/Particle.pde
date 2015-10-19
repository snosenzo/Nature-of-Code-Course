class Particle{
  PVector location, velocity, acceleration;
  float lifespan;
  float a1, a2, a3, x1, y1, x2, y2, x3, y3;
  float mass;
  float angVel;
  float angle =0 ;
  int numlines = 50;
  float errx = .5;
  float erry = .5;
  
  Particle(PVector l, float m, float ang){
    location = l.get();
    acceleration = new PVector();
    
    velocity = PVector.fromAngle(ang+PI);
    velocity.mult(random(3));
    velocity.x = velocity.x + random(-errx, errx);
    velocity.y = velocity.y + random(-erry, erry);
    lifespan = 255;
    mass = m;
    //mass = constrain(mass, 1, 6);
    angVel = .1;
    for(int i = 0; i < numlines; i++){
        a1 = random(PI);
        a2 = random(PI, TWO_PI);
        a3 = random(TWO_PI);
        x1 = 10*mass*cos(a1);
        y1 = 10*mass *sin(a1);
        x2 = 10 * mass * cos(a2);
        y2 = 10 * mass * sin(a2);
        x3 = 10 * mass * cos(a3);
        y3 = 10 * mass * sin(a3); 

      }
  }
  void update(){
    velocity.add(acceleration);
    location.add(velocity);
    lifespan -=2;
    acceleration.mult(0);
    angle+=angVel;
  }
  
  void display(){
    stroke(0, lifespan);
    fill(0, lifespan);
    pushMatrix();
      translate(location.x, location.y);
      rotate(angle);
      triangle(x1, y1, x2, y2, x3, y3);
    popMatrix();
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
