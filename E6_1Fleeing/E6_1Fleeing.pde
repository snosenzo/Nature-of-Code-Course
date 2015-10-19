//Sam Nosenzo
//7/19/15
//Nature of Code Chapter 6.3
//Give a vehicle the ability to steer to its target

ArrayList<Vehicle> vs;
int numv = 2000;
void setup(){
  size(800, 800);
  background(0);
  vs = new ArrayList<Vehicle>();
  for(int i = 0; i < numv; i++){
    Vehicle v = new Vehicle(random(width), random(height));
    vs.add(v);
  }
}

void draw(){
  background(0);
  for(Vehicle v: vs){
    v.seek(new PVector(mouseX, mouseY));
    v.update();
    v.display();
  }
  
  ellipse(mouseX, mouseY, 20, 20);
}
