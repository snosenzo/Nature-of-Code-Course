float r = 75; 
float theta = 0;

void setup(){
  size(640, 360);
  background(255);
  frameRate(200);
}

void draw(){
  r = theta*5;
  float x = r * cos(theta);
  float y = r * sin(theta);
  
  noStroke();
  fill(0);
  pushMatrix();
  translate(width/2, height/2);
    ellipse(x, y, 16, 16);
  popMatrix();
  theta +=.01;
}
