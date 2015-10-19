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

public class E3_9Noisewave extends PApplet {

public void setup() {
	size(640, 640);
	background(255);
	fill(0, 100);
	stroke(0);
}

float angle = 0;
float angleVel = .02f;
float amplitude = 200;

public void draw() {
background(255);
	for (int x = 0; x <= width; x+=16) {
		float y  = amplitude*noise(angle+.01f*x);

		ellipse(x, y+height/2, 32,  32);


		
	}
	angle+=angleVel;
	
}
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "E3_9Noisewave" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
