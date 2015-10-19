class Rev{
  
  RevoluteJoint[] joints = new RevoluteJoint[4];
  Jax jx1;
  Jax[] jx = new Jax[4];
  
  Rev(float x, float y){
    jx1 = new Jax(x, y, random(15,20));
    jx[0] = new Jax(x, y,  random(45, 50));
    jx[1] = new Jax(x, y, random(10, 15));
    jx[2] = new Jax(x, y, random(10, 15));
    jx[3] = new Jax(x, y, random(10, 15));
    
    
    for (int i = 0; i < 4; i++){
      makeJoint(i);
    }
  }
  
  void display(){
    jx1.display();
    for(int i = 0; i < 4; i++){
      jx[i].display();
    }
  }
    
  void makeJoint(int i){  
    RevoluteJointDef rjd = new RevoluteJointDef();
    Vec2 Anchpt = jx1.b.getWorldCenter();
    Anchpt.x+=jx1.size*2*cos((PI/2)*float(i));
    Anchpt.y+=jx1.size*2*sin((PI/2)*float(i));
    rjd.initialize(jx1.b, jx[i].b, Anchpt);
    
    rjd.motorSpeed = PI*2;
    rjd.maxMotorTorque = 1000.0;
    rjd.enableMotor = true;

    joints[i] =  (RevoluteJoint) box2d.world.createJoint(rjd);
  }
}
