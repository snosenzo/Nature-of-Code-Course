ArrayList<Vehicle> vehicles;
int numv = 1000;
void setup(){
  size(600, 600);
  vehicles = new ArrayList<Vehicle>();
  for(int i = 0; i < numv; i++){
    vehicles.add(new Vehicle(random(width), random(height)));
  }
}

void draw(){
  background(255);
  for(Vehicle v: vehicles){

    v.applyBehaviors(vehicles);
    v.update();
    v.display();

  }
}
