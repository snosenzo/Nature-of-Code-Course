import java.util.Iterator;


class ParticleSystem{
  
  ArrayList<Particle> particles;
  PVector origin;
  
  float lifeline;
  float maxmass;
  
  ParticleSystem(PVector location, float mxm){
    lifeline = 255;
    maxmass = mxm;
    origin = location.get();
    particles = new ArrayList<Particle>();
  }
  
  
  void addParticle(){
    particles.add(new Particle(origin,  random(.1,maxmass)));
  }
  
  void run(){
    if(lifeline > 0){
      for(int i = 0; i < 2; i++) addParticle();
    }
    Iterator<Particle> it = particles.iterator();

    while(it.hasNext()){
      Particle p = it.next();
      p.run();
      PVector gravity = new PVector(0, 1);
      p.applyForce(gravity);
      if(p.isDead()){
        it.remove();
        
      }
    }
    lifeline-=25;
    
  }
}
