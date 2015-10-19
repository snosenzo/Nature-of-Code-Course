import java.util.Iterator;

ParticleSystem ps;
ArrayList<Repeller> reps;


void setup(){
  size(640, 640);
  background(255);
  ps = new ParticleSystem(new PVector(width/2, height/2-50));
  reps = new ArrayList<Repeller>();
  for(int i = 0; i < 5; i++){
    reps.add(new Repeller(random(100, width-100), random(100, height-100)));
  }
}

void draw(){
  background(255);
  Iterator<Repeller> it = reps.iterator();
  while ( it.hasNext()){
    Repeller r = it.next();
    r.display();
    ps.applyRepeller(r);
  }
  PVector gravity = new PVector(0, 0.1);
  //ps.applyForce(gravity);
  
  ps.run();
  
  
  
  
}