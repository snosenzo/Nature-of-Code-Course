//Sam Nosenzo
//Nature of Code -- Section 5.18
//This program creates a system of connected particles

import toxi.physics2d.*;
import toxi.physics2d.behaviors.*;
import toxi.geom.*;

VerletPhysics2D physics;
ArrayList<Particle> particles = new ArrayList<Particle>();
float len = 20;
int numcol = 20;
int numrow = 20;

void setup(){
  
  size(800, 800);
  background(255);
  physics = new VerletPhysics2D();
  physics.setWorldBounds(new Rect(0, 0, width, height));
  physics.addBehavior(new GravityBehavior(new Vec2D(0, 0.1)));
  for(int i = 0; i < numrow; i++){
    for(int j = 0; j < numcol; j++){
      Particle particle = new Particle(new Vec2D(j*len, i*len));
      physics.addParticle(particle);
      particles.add(particle);
    }
  }
  for(int i = 0; i < particles.size(); i++){
    Particle p1 = particles.get(i);
    for(int j = i+1; j < particles.size(); j++){
      Particle p2 = particles.get(j);
      float d = dist(p1.x, p1.y, p2.x, p2.y);
      if(d <= len){
        VerletSpring2D spring = new VerletSpring2D(p1, p2, len, 1);
        physics.addSpring(spring);
      }
    }
  }
  
}

void draw(){
  background(255);
  stroke(0);
  physics.update();
  for(int i = 0; i < particles.size(); i++){
    Particle p1 = particles.get(i);
      for(int j = i+1; j < particles.size(); j++){
        Particle p2 = particles.get(j);
        float d = dist(p1.x, p1.y, p2.x, p2.y);
          if(d < len*1.2){
            line(p1.x, p1.y, p2.x, p2.y);
          }
      }
   }
   if(mousePressed){
     Particle head1 = particles.get(numcol-1);
     head1.lock();
     head1.x = mouseX+len*numcol;
     head1.y = mouseY-len*numrow;
     head1.unlock();
     Particle head2 = particles.get(0);
     head2.lock();
     head2.x = mouseX-len*numcol;
     head2.y = mouseY-len*numrow;
     head2.unlock();
     Particle head3 = particles.get(particles.size()-numcol+1);
     head3.lock();
     head3.x = mouseX-len*numcol;
     head3.y = mouseY+len*numrow;
     head3.unlock();
     Particle head4 = particles.get(particles.size()-1);
     head4.lock();
     head4.x = mouseX+len*numcol;
     head4.y = mouseY+len*numrow;
     head4.unlock();
     
   } 
}

void keyPressed(){
  if(key == 'c'){
    background(255);
  }
  if(key == 's'){
    saveFrame("meshdrawing" + random(40000) + ".png");
  }
}
 
