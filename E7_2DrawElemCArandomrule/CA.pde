class CA {
  int w;
  int[] cells;
  int[] ruleset = {0,1,0,1,1,0,1,0};
  int gen = 0;
  CA() {
    w = 2; 
    cells = new int[width/w];
    


    for(int i = 0; i < cells.length; i++){
      if(random(1) < .15) cells[i] = 1;
      else cells[i] = 0;
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
    noStroke();
    for(int i = 0; i < cells.length; i++){
      if(cells[i] == 1) fill(0);
      else              fill(255);
      rect(i*w, gen*w, w, w);
    }
    if(gen*w > height){
      for(int i = 0; i < cells.length; i++){
        if(random(1) < .15) cells[i] = 1;
        else cells[i] = 0;
      }
   
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

  
