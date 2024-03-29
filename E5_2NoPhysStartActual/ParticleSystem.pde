import java.util.Iterator;


class ParticleSystem{
  
  ArrayList<Particle> particles;
  PVector origin;
  
  
  
  ParticleSystem(PVector location){
    origin = location.get();
    particles = new ArrayList<Particle>();
  }
  
  
  void addParticle(){
    particles.add(new Particle(origin,  random(.1,2)));
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
