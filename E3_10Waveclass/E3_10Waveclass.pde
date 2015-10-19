class Wave{
	PVector sloc, vel;
	float freq, len, amp;
	float theta = 0;
	float angle;

	//freq less than 1
	Wave(float x, float y, float f, float l, float a){
		sloc = new PVector(x, y);
		vel = new PVector(0, 0);
		freq = f;
		len = l;
		amp = a;
	}

	void display(){
		fill(0, 70);
		stroke(0);
		angle = vel.heading();

		for(int i = 0; i < len; i += 5 ){
			pushMatrix();
				translate(sloc.x, sloc.y);
				rotate(angle);
				float y = amp * sin(theta+i*freq);
				ellipse(i, y, 30, 30);
			popMatrix();
		}
		theta-=.01;
	}

	void update(){
		PVector mouse = new PVector(mouseX, mouseY);
		PVector dir = PVector.sub(mouse, sloc);
		dir.normalize();
		vel.add(dir);
		sloc.add(vel);
	}
}

Wave w;

void setup() {
	size(640, 640);
	background(255);
	w = new Wave(width/4, height/2, .05, 300, 30);

}

void draw() {
	background(255);
	w.update();
	w.display();

	
}