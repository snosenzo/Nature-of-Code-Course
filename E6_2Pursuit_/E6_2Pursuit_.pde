//Sam Nosenzo
//7/19/15
//Nature of Code Chapter 6.3
//Exercise 6.2 Pursuit
//Give the vehicle the ability to predict where the target will be based on velocity and travel to its future location rather than its current location

ArrayList<Vehicle> vs;
int numv = 1000;
void setup(){
  size(800, 800);
  background(0);
  vs = new ArrayList<Vehicle>();
  for(int i = 0; i < numv; i++){
    Vehicle v = new Vehicle(random(width), random(height));
    vs.add(v);
  }
}
PVector mloc0 = new PVector(width/2, height/2);
PVector mloc1 = new PVector();
PVector vel = new PVector();
PVector pursloc = new PVector();
void draw(){
  background(0);
  mloc1.x = mouseX;
  mloc1.y = mouseY;
  vel = PVector.sub(mloc0, mloc1);
  pursloc = PVector.add(mloc1, vel);
  for(Vehicle v: vs){
    v.seek(pursloc);
    v.update();
    v.display();
  }
  
  ellipse(mouseX, mouseY, 20, 20);
  mloc0.x = mouseX;
  mloc0.y = mouseY;
}
