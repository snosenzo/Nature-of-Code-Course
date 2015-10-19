class FlowField {
  
  PVector[][] field;
  int cols, rows;
  int resolution;
  
  FlowField(){
    resolution = 10;
    cols = width/resolution;
    rows = height/resolution;
    field = new PVector[cols][rows];
    init();
  }
  float zoff = 0;
  void init(){
    float xoff= 0;
    for(int i = 0; i < cols; i++){
      float yoff = 0;
      for(int j = 0; j < rows; j++){
       
        //field[i][j] = new PVector(1, 0);  //vector to the right
        
        //field[i][j] = PVector.2D(); //random Pvector
        
        //2D Perlin Noise
        float theta = map(noise(xoff, yoff, zoff), 0, 1, 0, TWO_PI);
        field[i][j] = new PVector(cos(theta), sin(theta));
        yoff+=.1;
        
        //center of window
        /*
        PVector v = PVector.sub(new PVector(i*resolution, j*resolution), new PVector(width/2, height/2));
        v.normalize();
        field[i][j] = v;
        */
      }
      //noise x
      xoff+=.1;
    }
    zoff+=.1;
  }
  int counter = 0;
  void step(){
    if(counter%4 == 0){
    init();
    }
    counter++;
  }
    
  
  PVector lookup(PVector lookup){
    int column = int(constrain(lookup.x/resolution, 0, cols-1));
    int row = int(constrain(lookup.y/resolution, 0, rows-1));
    
    return field[column][row].get();
  }
}
  
