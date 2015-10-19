
//Sam Nosenzo
//7/25/15
//Chatper 6.9 Vehicle following path
//Program shows a vehicle following a specified path within a certain radius
//This time the path will be multiple segments

ArrayList<Vehicle> vs;
Path p;
int numv = 100;
float theta = 0;
void setup(){
  size(800, 800);
  background(255);
  
  p = new Path();
  for(int i = 0; i <= width; i+=2){
    float offset = (PI)/(width/2)*i + theta;
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
  
  for(int i = 0; i <= width; i+=2){
    PVector pp = p.points.get(i/2);
    float offset = (PI)/(width/10)*i + theta;
    float y = sin(offset)*map(noise(theta, offset), 0, 1, -150, 150)+i;
    pp.y = y;
    
  }
  
  p.display();
  for(Vehicle v: vs){
    v.follow(p);
    v.update();
    v.display();
  }
  theta+=0.01;
}
