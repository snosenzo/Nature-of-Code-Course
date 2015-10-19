class Pendulum {
  PVector location;
  PVector origin;
  float r;
  float angle;
  float aVel;
  float aAcc;
  float damping;

  Pendulum(float x, float y, float radius) {
    origin = new PVector(x, y);
    location = new PVector();
    angle = PI/2;
    aVel = 0;
    aAcc = 0;
    damping = .999;
    r = radius;
  }

  void update() {

    float gravity = 0.4;
    aAcc = -1 * gravity * sin(angle) / r;

    aVel += aAcc;
    angle += aVel;

    aVel*=damping;
  }

  void display() {
    location.set(r*sin(angle), r*cos(angle));
    location.add(origin);

    stroke(0,20);
    fill(175,20);
    //line(origin.x, origin.y, location.x, location.y);
    noStroke();
    ellipse(location.x, location.y, 16, 16);
  }

  void go() {
    update();
    display();
  }

  void clicked() {
    PVector mouse = new PVector(mouseX, mouseY);
    PVector dir = PVector.sub(mouse, origin);
    angle = dir.heading();
    angle = angle-PI/2;
    angle*=-1;
  }
}

int num = 6;
Pendulum[] p = new Pendulum[num];


void setup() {
  size(640, 640);
  background(255);
  for (int i = 0; i< p.length; i++){
    if( i == 0){
      p[0] = new Pendulum(width/2, height/2, 150);
    }
    else {
      p[i] = new Pendulum(p[i-1].location.x, p[i-1].location.y, random(50));
    }
  }
}

void draw() {
  //background(255);
  if (mousePressed) {
    p[0].clicked();
    p[0].display();
    for (int i = 1; i<p.length;  i++){
      p[i].clicked();
      p[i].display();
    }
  } else {
    for (int i = 0; i < p.length; i++){
      if(i == 0){
        
        p[i].update();
        p[i].display();
      }
      else{
        p[i].origin.x = p[i-1].location.x;
        p[i].origin.y = p[i-1].location.y;
        p[i].update();
        p[i].display();
      }
    }
  }
  if( keyPressed){
    if( key == 's'){
      saveFrame("dualpend"+random(30000)+".png");
    }
    if (key == 'c'){
      background(255);
    }
  }
}

