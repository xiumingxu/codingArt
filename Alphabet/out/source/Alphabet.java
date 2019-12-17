import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import geomerative.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class Alphabet extends PApplet {


RFont f;
RGroup grp;
RShape s;
float len;
float angle;
float pos;

// frame
boolean SAVEVIDEO = false;
boolean SAVEFRAME = false;

boolean APPLICATION = false;
String DEFAULTAPPLETRENDERER = JAVA2D;
int width = 600;
int height = 600;
String credender = OPENGL;

float ANGLEERROR = 0.3f;
float POINTERROR = 0.3f;

float LENGTHANGENT = 130;

String str = "XX";
String font = "DINCondensed-Bold.ttf";

int aplhaValue = 2;

int velocity = 10;
int MARGIN = 50;
String newString = "";
public void setup(){
    // int w = width, h = height;
    // String r = credender;
    // if(!APPLICATION){
    //     w=int(param("width"));
    //     h=int(param("height"));
    //     r = String(param("render"));
    //     // some strange
    // }
    // if(w<=0){
    //     d = width;
    // }
    
    background(255, 0.5f);
    frameRate(25);

    LENGTHANGENT = LENGTHANGENT * width / 800F;
    try{
        smooth();
    }catch (Exception e) {

    }
    noFill();
    stroke(0,0,0, 50); 
    f = new RFont(font, 372, RFont.CENTER );
    intialize();
}

    
    

    // draw
    public void draw(){
        pushMatrix();
        translate(width/2, height/2);

        for(int i=0; i<grp.countElements();i++){
            s=(RShape)(grp.elements[i]);
            // for(int j=0; j<s.countSubshapes();j++){
            //     for(int k = 0; k<velocity;k++){
            //         pos = random(0, 1);
            //         RPoint tg = s.subshapes[j].getCurveTangent(pos);
            //         RPoint p = s.subshapes[j].getCUrvePoint(pos);
            //         p.x = p.x + random(-POINTERROR, POINTERROR);
            //         p.y = p.y + random(-POINTERROR, POINTERROR);

            //         len = random(-LENGTHANGENT, LENGTHANGENT);
            //         angle = atan2(tg.y,tg.x) + random(-ANGLEERROR, ANGLEERROR);
            //         bezier(p.x, p.y, 10, 10, 90, 90, 15, 80);
            //     }
            // }
        }
        popMatrix();

    }
    public void intialize(){
        RG.init(this);
        grp = f.toGroup(str);
        println(grp);
        grp.centerIn(g, MARGIN,1, 1);
        background(255, 0.5f);
    }





  public void settings() {  size(600, 600, OPENGL); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "Alphabet" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
