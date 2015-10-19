class KochLine {
  PVector start;
  PVector end;
  
  KochLine(PVector a, PVector b){
    start = a.get();
    end = b.get();
  }
  
  void display(){
    //stroke(0);
    line(start.x, start.y, end.x, end.y);
  }
  
  PVector kochA(){
    PVector A = start.get();
    return A;
  }
  
  PVector kochB(){
    PVector B = PVector.sub(end, start);
    B.div(3);
    B.add(start);
    return B; 
    
  }
  
  PVector kochC(){
    PVector C = start.get();
    PVector v = PVector.sub(end, start);
    v.div(3);
    C.add(v);
    
    v.rotate(PI/3);
    C.add(v);
    
    return C;
  }
  
  PVector kochD(){
    PVector D = PVector.sub(end, start);
    D.mult(2/3.0);
    D.add(start);
    return D;
  }
  
  PVector kochE(){
    return end.get();
  }
}
