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

public class Duplication extends PApplet {

PImage pf;
float ax ,by , sx, sy , rz = 0.0f;

public void setup(){
  
  background(255);
  pf = loadImage("TEST.png");
  imageMode(CENTER);
}

public void draw(){
  tint(255,5);
  translate(Move().x,Move().y);
  rotate(RotateZ());
  image(pf,0,0,Sca(600).x,Sca(600).x);
}

public PVector Move(){
  PVector xy = new PVector(noise(ax)*width,noise(by)*height);
  ax += 0.00015f;
  by += 0.0002f;
  return xy;
}

public PVector Sca(float WH){
  PVector Sxy = new PVector(noise(sx)*WH,noise(sy)*WH);
  sx += random(0.0001f,0.0006f);
  sy += random(0.0001f,0.0006f);
  return Sxy;
}

public float RotateZ(){
  rz += 0.00003f;
  return noise(rz)*360;
}
  public void settings() {  size(1920,1080); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "Duplication" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
