
class Walker {
  float x, y;
  float tx, ty;
  PVector loc = new PVector(width/2, height/2);
  PVector vel = new PVector(0, 0);
  
  Walker(){
    tx = random(100000);
    ty = 10000;
  }
  
  void display(){
    stroke(0);
    point(loc.x, loc.y);
    if(loc.x < 0 || loc.x>width){
      loc.x = width/2;
    }
    if(loc.y < 0 || loc.y>height){
      loc.y = height/2;
    }
  }
  
  void step() {
    vel.x = map(noise(tx), 0, 1, -1, 1);
    vel.y = map(noise(ty), 0, 1, -1, 1);
    loc.add(vel);
    tx+=.01;
    ty+=.01;
  }


}

Walker w;

void setup(){

  size(640, 360);
  w = new Walker();
  background(255);
  frameRate(500);
}

void draw(){
  w.step();
  w.display();
}
