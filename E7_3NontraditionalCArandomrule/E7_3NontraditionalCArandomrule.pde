//Sam Nosenzo
//8/11/15
//The Nature of Code
//Cellular Automata: 7.4 Drawing Elementary CA

CA ca;

void setup(){
  size(800, 800);
  background(255);
  
  ca = new CA();
}

void draw(){
  //background(255);
  ca.display();
  ca.generate();
}
