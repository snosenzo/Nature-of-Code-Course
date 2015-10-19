//Sam Nosenzo
//8/19/15
//Nature of Code 8.3 Cantor Set Recursive Function


void setup(){
  strokeCap(SQUARE);
  size(600, 600);
  background(255);
  cantor(width/2, height/2 , 200, 0, theta1);
  //saveFrame("cantor-V"+int(random(200000))+".png");
}
float theta1 = 0;
float mot = 0;
void draw(){
  background(255);
  mot = map(sin(theta1),-1, 1, 20, 80);
  cantor(width/2, height/2, 250, 0, mot);
  theta1+=.01;
}
  
  
  
