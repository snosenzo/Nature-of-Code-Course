//Sam Nosenzo
//Nature of code exercise

import java.util.Iterator;
import shiffman.box2d.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.joints.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.collision.shapes.Shape;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;
import org.jbox2d.dynamics.contacts.*;


Box2DProcessing box2d;

ArrayList<Pair> prs;

int counter = 0;
void setup(){
  
  frameRate(60);
  background(255);
  size(640, 640);
  
  box2d = new Box2DProcessing(this);
  box2d.createWorld();
  //box2d.listenForCollisions();
  //custom gravity;
  box2d.setGravity(0, -10);
  
  prs = new ArrayList<Pair>();
  
}

void draw(){
  background(255);
  box2d.step();
  
  for(int i = prs.size()-1; i >= 0; i--){
    Pair pr = prs.get(i);
    pr.display();
    //Particles that leave the screen we delete
    //need to be deleted from the list and the world
    if(pr.j1.done()){
      prs.remove(i);
    }
  }
  
  if(mousePressed){
    prs.add(new Pair(mouseX, mouseY));
  }
}

void mousePressed(){
  //jxs.add(new Jax(mouseX, mouseY, random(3, 10)));
}
  
  
  
