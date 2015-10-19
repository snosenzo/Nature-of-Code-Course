ParticleSystem ps;

void setup(){
  size(640, 640);
  background(255);
  ps = new ParticleSystem(new PVector(width/2, height/2));
}

void draw(){
  background(255);
  ps.run();
}