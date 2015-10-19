import java.util.Iterator;

ParticleSystem ps;


void setup(){
  background(255);
  size(640, 640);
  
  ps = new ParticleSystem(new PVector(width/2, height/2));
  
}

void draw(){
  ps.origin.x = mouseX;
  ps.origin.y = mouseY;
  ps.newM.x = mouseX;
  ps.newM.y = mouseY;
  background(255);
  ps.run();
  ps.oldM.x = ps.newM.x;
  ps.oldM.y = ps.newM.y;
  

  
}
