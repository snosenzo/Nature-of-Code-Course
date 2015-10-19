void setup() {
	size(640, 640);
	background(255);
	fill(0, 100);
	stroke(0);
}

float angle = 0;
float angleVel = .02;
float amplitude = 200;

void draw() {
background(255);
	for (int x = 0; x <= width; x+=16) {
		float y  = amplitude*noise(angle+.01*x);

		ellipse(x, y+height/2, 32,  32);


		
	}
	angle+=angleVel;
	
}