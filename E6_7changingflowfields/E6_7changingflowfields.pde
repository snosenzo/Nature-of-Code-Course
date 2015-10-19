//Sam Nosenzo
//7/21/15
//Nature of Code Chapter 6.6
//Implementaion of a flow field in the vehicles steering behavior



ArrayList<Vehicle> vs;
int numv = 1000;
FlowField f;
void setup(){
  size(800, 800);
  background(0);
  vs = new ArrayList<Vehicle>();
  for(int i = 0; i < numv; i++){
    Vehicle v = new Vehicle(random(width), random(height));
    vs.add(v);
  }
  f = new FlowField();
}

void draw(){
  //background(0);
   f.step();
  for(Vehicle v: vs){
   
    v.follow(f);
    
    //v.seek(new PVector(mouseX, mouseY));
    v.update();
    v.display();
  }
  
  //ellipse(mouseX, mouseY, 20, 20);
}
