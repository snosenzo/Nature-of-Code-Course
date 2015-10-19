

void setup(){
  size(640, 640);
  background(255);
  stroke(0);
  fill(0, 50);
}

float theta = PI/2;
float y;
float amp = 320;
float initamp = amp;
float damp = 2;

void draw(){
  background(255);
  y = map(sin(theta)*amp, -1*initamp, initamp, 0, height ) ;
  line(width/2, 0, width/2, y);
  ellipse(width/2, y,  25, 25);
  ellipse(width/2, height/2, 50, 50);
  theta+=.05;
  if(amp>0){
    amp-=damp;
  }
  println(amp);
}
  
  
  
