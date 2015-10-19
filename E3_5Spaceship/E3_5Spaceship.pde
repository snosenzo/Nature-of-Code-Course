class Car{
  
  PVector loc, vel, acc;
  float angle = PI/4;
  
  Car(){
    loc = new PVector(width/2, height/2);
    vel = new PVector(0, 0);
    acc = new PVector(0, 0);
  }
  
  void display(){
    pushMatrix();
      translate(loc.x, loc.y);
      fill(0, 50);
      stroke(0);
      strokeWeight(2);
      rotate(angle);
      rectMode(CENTER);
      rect(0, 0, 50, 25);
    popMatrix();
  }
  
  void update(){
    vel.add(acc);
    loc.add(vel);
    acc.mult(0);
    
  }
  
  void thrust(){
    float x = cos(angle);
    float y = sin(angle);
    PVector T = new PVector(x, y);;
    T.normalize();
    T.mult(.1);
    acc.add(T);
  }
  
  void turn(int dir){
    if(dir == 0){
      angle-=.1;
    }
    if(dir == 1){
      angle+=.1;
    }
  }
  
  void checkEdges(){
    if (loc.x < 0){
      loc.x = width;
    }else if( loc.x > width){
      loc.x = 0;
    }
    
    if (loc.y < 0){
      loc.y = height;
    } else if( loc.y > height){
      loc.y = 0;
    }
  }
  
}

Car car;

void setup(){
  size(640, 640);
  background(255);
  car = new Car();
}

void draw(){
  background(255);
  car.update();
  car.display();
  car.checkEdges();
  if(keyPressed){
    if (key == 'w'){
      car.thrust();
    }
    if(key == 'a'){
      car.turn(0);
    }
    if(key == 'd'){
      car.turn(1);
    }
  }
}


  
  
    
