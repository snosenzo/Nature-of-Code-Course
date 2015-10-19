import java.util.Iterator;


ArrayList<Particle> parts;

void setup(){
  background(255);
  size(640, 640);
  parts = new ArrayList<Particle>();
  
  
}

void draw(){
  background(255);
  if(mousePressed){
    Particle p = new Particle(new PVector(mouseX, mouseY), random(.1, 3));
    parts.add(p);
  }
  
  Iterator<Particle> it = parts.iterator();
  while(it.hasNext()){
    Particle p = it.next();
    p.run();
    if(p.isDead()){
      it.remove();
    }
  }
  

  
}
