import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class E3_9Pendulum extends PApplet {

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
		damping = .995f;
		r = radius;
	}

	public void update(){
		
		float gravity = 0.4f;
		aAcc = -1 * gravity * sin(angle) / r;

		aVel += aAcc;
		angle += aVel;

		aVel*=damping;

	}

	public void display(){
		location.set(r*sin(angle), r*cos(angle));
		location.add(origin);

		stroke(0);
		fill(175);
		line(origin.x, origin.y, location.x, location.y);
		ellipse(location.x, location.y, 16, 16);
	}

	public void go(){
		update();
		display();
	}

	public void clicked(){
		PVector mouse = new PVector(mouseX, mouseY);
		PVector dir = PVector.sub(mouse, origin);
		angle = dir.heading();
		angle = angle-PI/2;
		angle*=-1;

	}

}

Pendulum p;


public void setup(){
	size(640, 640);
	background(255);
	p = new Pendulum(width/2 , height/2, 150);

}

public void draw(){
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
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "E3_9Pendulum" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
