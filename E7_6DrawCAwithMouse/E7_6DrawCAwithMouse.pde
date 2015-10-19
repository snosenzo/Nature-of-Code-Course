//Sam Nosenzo
//8/13/15
//nature of Code: 7.7
//Programming the game of life

CA ca;


void setup(){
  size(600, 600);
  //frameRate(200);
  ca = new CA();
}

void draw(){
  if(mousePressed){
    ca.changeCell(mouseX, mouseY);
  }
  else  ca.nextGen();
  ca.display();

}
