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

public class E3_10Waveclass extends PApplet {

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

	public void display(){
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
		theta-=.01f;
	}

	public void update(){
		PVector mouse = new PVector(mouseX, mouseY);
		PVector dir = PVector.sub(mouse, sloc);
		dir.normalize();
		vel.add(dir);
		sloc.add(vel);
	}
}

Wave w;

public void setup() {
	size(640, 640);
	background(255);
	w = new Wave(width/4, height/2, .05f, 300, 30);

}

public void draw() {
	background(255);
	w.update();
	w.display();

	
}
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "E3_10Waveclass" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
