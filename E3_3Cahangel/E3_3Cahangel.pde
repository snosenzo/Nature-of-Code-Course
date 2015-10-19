class Car{
  
  PVector loc, vel, acc;
  float angle = 0;
  
  Car(){
    loc = new PVector(width/2, height/2);
    vel = new PVector(0, 0);
    acc = new PVector(0, 0);
  }
  
  void display(){
    angle = vel.heading();
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
  
  void checkEdges(){
    if (loc.x < 0){
      loc.x = 0;
      vel.x = vel.x * -1;
    }else if( loc.x > width){
      loc.x = width;
      vel.x = vel.x * -1;
    }
    
    if (loc.y < 0){
      loc.y = 0;
      vel.y = vel.y * -1;
    } else if( loc.y > height){
      loc.y = height;
      vel.y = vel.y * -1;
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
      car.acc.y = -.5;
    }
    if(key == 's'){
      car.acc.y = .5;
    }
    if(key == 'a'){
      car.acc.x = -.5;
    }
    if(key == 'd'){
      car.acc.x = .5;
    }
  }
}


  
  
    
