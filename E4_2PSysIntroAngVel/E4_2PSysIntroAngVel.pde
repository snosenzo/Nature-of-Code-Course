Particle p;

void setup(){
  background(255);
  size(640, 640);
  p = new Particle(new PVector(width/2, 50), 3 );
  
}

void draw(){
  background(255);
  PVector wind = new PVector(.1, 0);
  p.applyForce(wind);
  p.run();

  if(p.isDead()){
    println("Particle Dead!!!");
    p = new Particle(new PVector(width/2, 50), 3);
  }
}
