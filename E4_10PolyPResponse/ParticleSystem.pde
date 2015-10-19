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
    //The iterator function doesnt work between the particles. I'm not sure  how to make it work
    //come back to later with more information
    
    
    Iterator<Particle> it1 = particles.iterator();
    Iterator<Particle> it2 = particles.iterator();
    while(it1.hasNext()){
      Particle p1 = it1.next();
      while(it2.hasNext()){
        
        Particle p2 = it2.next();
        
          p1.behave(p2);
          
        
        
      }
      p1.run();
     
      
      /*if(p.dead){
        it.remove();

      }*/
    }
  }
  
  void applyForce(PVector f){
    for(Particle p: particles){
      
      p.applyForce(f);
    }
  }
  
  
  void applyRepeller(Repeller r){
    for(Particle p: particles){
      PVector force = r.repel(p);
      p.applyForce(force);
    }
  }
  
  
  
}