float angle = 0;
void cantor(float x, float y, float len, float angle){
  
  //noSmooth();
  strokeWeight(1.5);
  if(len >= 1){
    pushMatrix();
    translate(x, y);
    rotate(radians(angle));
    line(-len/2, 0, len/2, 0);
    popMatrix();
    cantor(x+len*.5*cos(radians(angle)), y+len*.5*sin(radians(angle)), len*.75, angle+40);
    cantor(x-len*.5*cos(radians(angle)), y-len*.5*sin(radians(angle)), len*.75, angle-40);
  }
}
