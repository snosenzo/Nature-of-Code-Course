import java.util.Iterator;

class ParticleSystem{
  PVector origin;
  
  ArrayList<Particle> particles;
  
  ParticleSystem(PVector l){
    origin = l.get();
    particles = new ArrayList<Particle>();
  }
  
  void addParticle(){
    float r = random(1);
    if( r < .5){ particles.add(new Particle(origin));}
    else{particles.add(new Confetti(origin));}
  }
  
  void run(){
    addParticle();
    Iterator<Particle> it = particles.iterator();
    
    while(it.hasNext()){
      Particle p = it.next();
      p.run();
    }
  }
}