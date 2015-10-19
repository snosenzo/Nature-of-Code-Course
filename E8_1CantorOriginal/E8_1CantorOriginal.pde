//Sam Nosenzo
//8/19/15
//Nature of Code 8.3 Cantor Set Recursive Function


void setup(){
  strokeCap(SQUARE);
  size(600, 600);
  background(255);
  cantor(width/2, height/2 , 200, 0);
  saveFrame("cantor-V"+int(random(200000))+".png");
}
