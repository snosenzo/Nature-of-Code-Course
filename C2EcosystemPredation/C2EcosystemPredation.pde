class Pred{
  PVector loc;
  PVector vel;
  PVector acc;
  float spd;
  float mass;
  boolean first = true;
  int newtime;
  Pred(float x, float y, float speed, float mass_){
    spd = speed;
    loc = new PVector(x, y);
    vel = new PVector(0, 0);
    acc = new PVector(0, 0);
    mass = mass_;
    newtime = (int) random(1, 300);
    
  }
  
  void update(){
    vel.add(acc);
    loc.add(vel);
    acc.mult(0);
    vel.mult(0);
  }
  
  void display(){
    stroke(0, 0, 255);
    fill(0);
    ellipse( loc.x, loc.y, mass, mass);
  }
  
    int counter = 0;
   PVector newDest;
  void findPrey(Prey p){
   
    float accuracy  = 50;
    if (first == true){
      float x = random(p.loc.x - accuracy, p.loc.x + accuracy);
      float y = random(p.loc.y - accuracy, p.loc.y + accuracy);
      newDest = new PVector(x, y);
      first = false;
    }
    
    PVector force = PVector.sub(newDest, loc);
    force.div(mass);
    acc.add(force);
    
    if (  counter%newtime == 0 && dist(loc.x, loc.y, newDest.x, newDest.y)< 50){
      first = true;
    }
    
  }
  void feast(Prey p){
    float d = dist(p.loc.x, p.loc.y, loc.x, loc.y);
    if(d < mass/2){
       mass+=p.mass/10;
     } 
  }
    
  
  
}


//PREY CLASS

class Prey{
  PVector loc;
  PVector vel;
  PVector acc;
  float spd;
  float mass;
  PVector newDest;
  int newtime;
  boolean first = true;
  boolean dead;
  
  Prey(float x, float y, float speed, float mass_){
    spd = speed;
    loc = new PVector(x, y);
    vel = new PVector(0, 0);
    acc = new PVector(0, 0);
    mass = mass_;
    newtime = (int) random(1, 300);
    dead = false;
    
  }
  
   void update(){
    vel.add(acc);
    loc.add(vel);
    acc.mult(0);
    vel.mult(0);
  }
  
  void display(boolean dead){
    if(dead){ 
      stroke(255, 0 , 0);
      for (int i = 0; i < 50; i++){
        float theta1 = radians(random(360));
        float x1 = loc.x + mass *  cos(theta1);
        float y1 = loc.y + mass *  sin(theta1);
        float theta2 = radians(random(360));
        float x2 = loc.x + mass * cos(theta2);
        float y2 = loc.y + mass * sin(theta2);
        line(x1, y1, x2, y2);
      }
      mass-=.2;
    } else {
    stroke(0);
    fill(0, 255, 0);
    ellipse( loc.x, loc.y, mass, mass);
    }
  }
  int counter = 0;
  
  void randDest(){


    if (first == true){
      float x = random(width);
      float y = random(height);
      newDest = new PVector(x, y);
      first = false;
    }
    
    PVector force = PVector.sub(newDest, loc);
    force.div(mass);
    acc.add(force);
    
    if (  counter%newtime == 0 && dist(loc.x, loc.y, newDest.x, newDest.y)< 50){
      first = true;
    }
    
  }
  
  void fear(Pred p){
    float d = dist(p.loc.x, p.loc.y, loc.x, loc.y);
    if( d < 200){
      PVector f = PVector.sub(loc, p.loc);
      float mag = f.mag();
      f.normalize();
      mag = constrain(mag, .5, 30);
      f.mult(mag);
      f.div(mass);
      acc.add(f);
    }
  }
  
  void isEaten(Pred p){
    float d = dist(p.loc.x, p.loc.y, loc.x, loc.y);
     if(d < p.mass/2){
       dead = true;
     } 
  }
  
  void respawn(){
    if(mass < 5){
      mass = random(20, 50);
      loc.x = random(width);
      loc.y = random(height);
      dead = false;
    }
  }
  
   
}
Pred pred;
Prey prey;

void setup(){
  size(640, 640);
  background(255);
  prey = new Prey(width/2, height/2, 2, 30);
  pred = new Pred(0, 0,  2, 30);
}

void draw(){
  background(255);
  prey.randDest();
  prey.update();
  prey.display(prey.dead);
  prey.isEaten(pred);
  prey.fear(pred);
  prey.respawn();
  
  pred.findPrey(prey);
  pred.feast(prey);
  pred.update();
  pred.display();
}



  
    
    
    
