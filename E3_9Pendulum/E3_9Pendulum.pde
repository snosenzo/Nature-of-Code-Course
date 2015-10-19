class Pendulum{
	PVector location;
	PVector origin;
	float r;
	float angle;
	float aVel;
	float aAcc;
	float damping;

	Pendulum(float x, float y, float radius){
		origin = new PVector(x, y);
		location = new PVector();
		angle = 0;
		aVel = 0;
		aAcc = 0;
		damping = .995;
		r = radius;
	}

	void update(){
		
		float gravity = 0.4;
		aAcc = -1 * gravity * sin(angle) / r;

		aVel += aAcc;
		angle += aVel;

		aVel*=damping;

	}

	void display(){
		location.set(r*sin(angle), r*cos(angle));
		location.add(origin);

		stroke(0);
		fill(175);
		line(origin.x, origin.y, location.x, location.y);
		ellipse(location.x, location.y, 16, 16);
	}

	void go(){
		update();
		display();
	}

	void clicked(){
		PVector mouse = new PVector(mouseX, mouseY);
		PVector dir = PVector.sub(mouse, origin);
		angle = dir.heading();
		angle = angle-PI/2;
		angle*=-1;

	}

}

Pendulum p;


void setup(){
	size(640, 640);
	background(255);
	p = new Pendulum(width/2 , height/2, 150);

}

void draw(){
	background(255);
	if(mousePressed){
		p.clicked();
		p.display();
	}
	else{
		p.update();
		p.display();
}
}
