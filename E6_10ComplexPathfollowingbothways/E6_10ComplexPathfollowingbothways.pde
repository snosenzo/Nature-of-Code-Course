
//Sam Nosenzo
//7/25/15
//Chatper 6.9 Vehicle following path
//Program shows a vehicle following a specified path within a certain radius
//This time the path will be multiple segments

ArrayList<Vehicle> vs;
Path p;
int numv = 10;

void setup(){
  size(800, 800);
  background(255);
  
  p = new Path();
  for(int i = 0; i <= width; i+=100){
    float offset = (PI)/(width/2)*i;
    float y = sin(offset)*150+i;
    p.addPoint(i,  y);
  }
  vs = new ArrayList<Vehicle>();
  
  for(int i = 0; i < numv; i++){
    Vehicle v = new Vehicle(random(width), random(height));
    vs.add(v);
  }
}

void draw(){
  background(255);
  //p.display();
  for(Vehicle v: vs){
    v.follow(p);
    v.update();
    v.display();
  }
}
