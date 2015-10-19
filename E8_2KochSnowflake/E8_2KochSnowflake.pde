//SAm Nosenzo
//8/27/15
//Nature of Code 8.4
//Koch Curves


ArrayList<KochLine> line1;
ArrayList<KochLine> line2;
ArrayList<KochLine> line3;

void setup() {
  size(800, 800);
  
  line1 = new ArrayList<KochLine>();
  line2 = new ArrayList<KochLine>();
  line3 = new ArrayList<KochLine>();

  PVector top = new PVector (width/2, 0);
  PVector right = new PVector (top.x + cos(-PI/3)*600, top.y - 600*sin(-PI/3));
  PVector left = new PVector(top.x - cos(-PI/3)*600, top.y - 600*sin(-PI/3));


  line1.add(new KochLine(top, left));
  
  line2.add(new KochLine(right, top));
  line3.add(new KochLine(left, right));
  
  for (int i = 0; i < 5; i++) {
    generate();
  }
}

void draw() {
  background(255);
  for (KochLine l : line1) {
    stroke(255, 0, 0);
    l.display();
  }
  
  for (KochLine l : line2) {
    stroke(0, 255, 0);
    l.display();
  }
  
  for (KochLine l : line3) {
    stroke(0, 0, 255);
    l.display();
  }
  
}

void generate() {
  ArrayList next1 = new ArrayList<KochLine>();

  for (KochLine l : line1) {
    PVector a = l.kochA();
    PVector b = l.kochB();
    PVector c = l.kochC();
    PVector d = l.kochD();
    PVector e = l.kochE();




    next1.add(new KochLine(a, b));
    next1.add(new KochLine(b, c));
    next1.add(new KochLine(c, d));
    next1.add(new KochLine(d, e));
  }

  line1 = next1;
  
  //line 2
  
  ArrayList next2 = new ArrayList<KochLine>();

  for (KochLine l : line2) {
    PVector a = l.kochA();
    PVector b = l.kochB();
    PVector c = l.kochC();
    PVector d = l.kochD();
    PVector e = l.kochE();




    next2.add(new KochLine(a, b));
    next2.add(new KochLine(b, c));
    next2.add(new KochLine(c, d));
    next2.add(new KochLine(d, e));
  }

  line2 = next2;
  
  //line 3
  
 ArrayList next3 = new ArrayList<KochLine>();

  for (KochLine l : line3) {
    PVector a = l.kochA();
    PVector b = l.kochB();
    PVector c = l.kochC();
    PVector d = l.kochD();
    PVector e = l.kochE();




    next3.add(new KochLine(a, b));
    next3.add(new KochLine(b, c));
    next3.add(new KochLine(c, d));
    next3.add(new KochLine(d, e));
  }

  line3 = next3;
}

