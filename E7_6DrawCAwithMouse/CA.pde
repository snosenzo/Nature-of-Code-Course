class CA {
  int w = 5;
  int columns = width/w;
  int rows = height/w;
  int[][] board = new int[columns][rows];
  
  CA(){
    for (int x = 0; x < columns; x++){
      for(int y = 0; y < rows; y++){
        //initialize a cell with  a 0 or a 1
        board[x][y] = int(random(2));
      }
    }
    
  }
  
  void nextGen(){
    int[][] next = new int[columns][rows];
    
    for(int x = 1; x < columns-1; x++){
      for(int y = 1; y < rows-1; y++){
        
        int neighbors = 0;
        
        for(int i = -1; i <= 1; i++){
          for(int j = -1; j <= 1; j++){
            neighbors += board[x+i][y+j];
          }
        }
        
        neighbors -= board[x][y];
        
        if ((board[x][y] == 1) && (neighbors < 2)) next[x][y] = 0;
        else if ((board[x][y] == 1) && (neighbors > 3)) next[x][y] = 0;
        else if ((board[x][y] == 0) && (neighbors == 3)) next[x][y] = 1;
        else next[x][y] = board[x][y];
      }
    }
    
    board = next;
  }
  
  void display(){
    noStroke();
    for(int i = 0; i < columns; i++){
      for(int j = 0; j < columns; j++){
        if((board[i][j] == 1)) fill(0);
        else fill(255);
        //stroke(0);
        
        rect(i*w, j*w, w, w);
      }
    }
  }
  
  void changeCell(float x, float y){
    if(x > 0 && y > 0 && x < width && y < height){
      int col = int(x)/w;
      int row = int(y)/w;
      board[col][row] = 1;
    }
  }
}
 
