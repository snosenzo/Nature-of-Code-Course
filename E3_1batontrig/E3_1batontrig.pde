void setup(){
  size(640, 640);
  background(255);
  stroke(0);
  fill(100);
}

float x1, x2, y1, y2;
float theta = 0;
float r = 100;
void draw(){
  x1 = r * cos(theta);
  y1 = r * sin(theta);
  x2 = r * cos(theta + PI);
  y2 = r * sin(theta + PI);
  translate( mouseX, mouseY);
  line(x1, y1, x2, y2);  
  ellipse(x1, y1, 50, 50);
  ellipse(x2, y2, 50, 50);
  theta+=.1;

  
}
