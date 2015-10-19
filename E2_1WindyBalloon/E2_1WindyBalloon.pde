class Bloon {
  PVector loc;
  PVector vel;
  PVector acc;
  float r = 50;
  
  
  Bloon() {
    loc = new PVector(width/2, random(height));
    vel = new PVector(0, 0);
    acc = new PVector(0, -.2);
  }
  
  void update(){
    vel.limit(10);
    vel.add(acc);
    
    loc.add(vel);
    acc.x = 0;
  }
  
  void disp(){
    stroke(0);
    fill(255, 0, 0);
    ellipse(loc.x, loc.y, r, r);
  }
  
  void edge(){
    if (loc.y < r/2){
      vel.y = vel.y * -1;
    }
    if (loc.x > width){
      loc.x = 0;
    }
    if (loc.x < 0){
      loc.x = width;
    }
  }
  
  void force(PVector F){
    acc.add(F);
  }
}

Bloon loon;

void setup(){
  size(640, 640);
  background(255);
  loon = new Bloon();
}
PVector wind = new PVector(0,0);
float time = 0;
void draw(){
  background(255);
  wind.x = map(noise(time), 0, 1, -.2, .2);
  loon.force(wind);
  loon.update();
  loon.edge();
  loon.disp();
  time+=.01;
}
      
    
