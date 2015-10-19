import java.util.Iterator;

ArrayList<ParticleSystem> systems;
Circ c;


void setup(){
  background(255);
  size(640, 640);
  c = new Circ();
  systems = new ArrayList<ParticleSystem>();
  
  
}

void draw(){

  background(255);
  c.display();
  for(ParticleSystem ps: systems){
    ps.run();
  }
  

  
}

void mousePressed(){
  if(dist(mouseX, mouseY, c.loc.x, c.loc.y) < c.d){
    systems.add(new ParticleSystem(new PVector(mouseX, mouseY), c.mass-1));
    c.shatter();
  }
}
