class Fly{
  PVector loc;
  PVector vel;
  PVector acc;
  PVector mouse;
  int stop;
  int counter;
  int stime;
  
  Fly(){
    loc = new PVector(random(width), random(height));
    vel = new PVector(0, 0);
    acc = new PVector(0, 0);
    mouse = new PVector(0, 0);
    stime = int(random(1,50))*5;
    stop = 0;
    counter = 0;
    
  }
  
  void update(){
    if (stop == 0){
      mouse.x = mouseX+random(-100, 100);
      mouse.y = mouseY+random(-100, 100);
      
      acc = PVector.sub(mouse, loc);
      acc.normalize();
      acc.mult(1);
      vel.add(acc);
      loc.add(vel);
      vel.limit(10);
    }
  }
  void stopsometimes(){
    counter++; 
    if(counter % stime == 0){
      if(random(1)> map(dist(loc.x, loc.y, mouseX, mouseY), 0, 700, .99, 0)){
        if(stop == 1){
          vel.mult(.5);
          acc.mult(.5);
          stop = 0;
        }
        else if(stop == 0){
          stop = 1;
        }
      }
    }
  }
  
  void display(){
    stroke(0);
    point(loc.x, loc.y);
  }
}

Fly[] flies = new Fly[20];

void setup(){
  strokeWeight(3);
  size(640, 640);
  background(255);
  stroke(0);
  for(int i = 0; i<flies.length; i++){
    flies[i] = new Fly();
  }
}

void draw(){
  background(255);
  for (int i = 0; i<flies.length; i++){
    flies[i].update();
    flies[i].display();
    flies[i].stopsometimes();
  }
  if(keyPressed){
    if(key == 'r'){
      background(255);
    }
  }
}
    
    
