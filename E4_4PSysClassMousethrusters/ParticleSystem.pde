import java.util.Iterator;


class ParticleSystem{
  
  ArrayList<Particle> particles;
  PVector origin;
  float angle;
  PVector oldM, newM;

  
  ParticleSystem(PVector location){
    origin = location.get();
    oldM = new PVector();
    newM = new PVector();
    particles = new ArrayList<Particle>();
  }
  
  
  void addParticle(){

    PVector aVect = PVector.sub(newM, oldM);
    angle = aVect.heading();
    if(oldM.x == newM.x && oldM.y == newM.y){
      angle = random(TWO_PI);
    }
    particles.add(new Particle(origin,  random(.1,2), angle));
  }
  
  void run(){
    for(int i = 0; i<3; i++){ 
      addParticle();
    }
    Iterator<Particle> it = particles.iterator();
    
    while(it.hasNext()){
      Particle p = it.next();
      p.run();
      if(p.isDead()){
        it.remove();
      }
    }
  }
}
