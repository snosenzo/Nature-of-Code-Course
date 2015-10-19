class CA {
  int genrad;
  int[] cells;
  int[] ruleset = {0,1,0,1,1,0,1,0};
  int gen = 0;
  int numpts = 360;
  CA() {
    genrad = 5; 
    cells = new int[numpts];
    


    for(int i = 0; i < cells.length; i++){
      /*if(random(1) < .15) cells[i] = 1;
      else 
      */
      cells[i] = 0;
    }
   
    //center cell starts with an on state
    cells[cells.length/2] = 1;
  }
  
  void generate(){
    int[] nextgen = new int[cells.length];
    for(int i = 1; i < cells.length-1; i++){
      int left = cells[i-1];
      int me = cells[i];
      int right = cells[i+1];
     /* 
      if (cells[i] == 1) fill(0);
      else fill(255);
      rect(i*w, 0, w, w);
      */
      nextgen[i] = rules(left, me, right);
    }
    cells = nextgen;
    gen++;
 
  }
  
  int rules(int a, int b, int c){
    String s = "" + a + b + c;
    int index = Integer.parseInt(s, 2);
    return ruleset[index];
  }
  void display(){
    stroke(0);
    noFill();
    pushMatrix();
    translate(width/2, height/2);
    beginShape();
    for(int i = 0; i < cells.length; i++){
      float rad = 0;
      if(cells[i] == 1){ 
        rad = genrad*2;
      }
      else{
        rad = genrad;
      }
      
      float offset = TWO_PI/numpts;
      float x = (gen*genrad+rad)*cos(offset*i);
      float y = (gen*genrad+rad)*sin(offset*i);
      vertex(x, y);
    }
    endShape(CLOSE);
    popMatrix();
    if(gen*genrad > height/2*sqrt(2)){
      for(int i = 0; i < cells.length; i++){
        /*
        if(random(1) < .15) cells[i] = 1;
        else
        */
        cells[i] = 0;
       
      }
      saveFrame("CA"+ int(random(1000000)) + ".png");
       background(255);
      //center cell starts with an on state
      cells[cells.length/2] = 1;
      newRule();
      gen = -1;
    }
  }
  
  void newRule(){
    for(int i = 0; i < ruleset.length; i++){
      if(random(1) < .5) ruleset[i] = 1;
      else ruleset[i] = 0;
    }
  }
  
 
  
}

  
