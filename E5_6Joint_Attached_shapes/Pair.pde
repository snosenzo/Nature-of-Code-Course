class Pair{
  Jax j1;
  Jax j2;
  
  float len = 32;
  
  Pair(float x, float y){
    j1 = new Jax(x, y, random(3, 10));
    j2 = new Jax(x+random(-20,20), y+random(-20, 20), random(3, 10));
    
    DistanceJointDef djd = new DistanceJointDef();
    djd.bodyA = j1.b;
    djd.bodyB = j2.b;
    djd.length = box2d.scalarPixelsToWorld(len);
    djd.frequencyHz = 3;//try a value less than 5
    djd.dampingRatio = .9; // Ranges between 0 and 1
    
    
    DistanceJoint dj = (DistanceJoint) box2d.world.createJoint(djd);
  }
  
  void display(){
    Vec2 pos1 = box2d.getBodyPixelCoord(j1.b);
    Vec2 pos2 = box2d.getBodyPixelCoord(j2.b);
    stroke(0);
    line(pos1.x, pos1.y, pos2.x, pos2.y);
    
    j1.display();
    j2.display();
  }
}
