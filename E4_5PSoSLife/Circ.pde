class Circ{
  PVector loc;
  float mass;
  float d;
  boolean broken = false;
  Circ(){
    loc = new PVector(width/2, height/2);
    mass = .2;
  }
  
  void display(){
   if(broken == false){
    d = mass* 20;
    stroke(0);
    fill(0);
    ellipse(loc.x, loc.y, d, d);
    mass+=.05;
   }
  }
  
  void shatter(){
    broken = true;
  }
    
  
} 
  
