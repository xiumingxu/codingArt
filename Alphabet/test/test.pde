import geomerative.*;



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

float ANGLEERROR = 0.3;
float POINTERROR = 0.3;

float LENGTHANGENT = 130;

String str = "X";

//String font = "DINCondensed-Bold.ttf";

//String font = "Pacifico-Regular.ttf";
String font = "Raleway-Bold.ttf";


int aplhaValue = 2;

int velocity = 10;
int MARGIN = 50;
String newString = "";
void setup(){
  
 
    size(600, 600, OPENGL);
    background(255, 0);
    frameRate(25);
    
 

    LENGTHANGENT = LENGTHANGENT * width / 800F;
    try{
        smooth();
    }catch (Exception e) {

    }
    noFill();

    stroke(161,66,255, 50); 
    
       RG.init(this);
    f = new RFont(font, 372, RFont.CENTER );
         intialize();
 
}

    
    

    // draw
    void draw(){
        pushMatrix();
        translate(width/2, height/2);

        for(int i=0; i<grp.countElements();i++){
            s= (RShape) (grp.elements[i]);
                for(int k = 0; k<velocity;k++){
                    pos = random(0, 1);
                    RPoint tg = s.getTangent(pos);
                    RPoint p = s.getPoint(pos);
                    p.x = p.x + random(-POINTERROR, POINTERROR);
                    p.y = p.y + random(-POINTERROR, POINTERROR);

                    len = random(-LENGTHANGENT, LENGTHANGENT);
                    angle = atan2(tg.y,tg.x) + random(-ANGLEERROR, ANGLEERROR);
                    
                    bezier(p.x, p.y, 10, 10,-0,-130, 0, 0);
                    //line(100,200, 400, 600);
                    //bezier(p.x, p.y, 100, 10, 90, 90, 15, 80);
                    // ellipse(p.x/1.1, p.y/1.1, 27,27);


                    
                    //line(p.x/1.2, p.y/1.2, p.x+80, p.y*1.2);
                        //    line(p.x, p.y,p.x-18,p.y+18);
                }
            //}
        }
        popMatrix();

    }
    void keyPressed() { 
    if (keyCode==ENTER) { 
      saveFrame("screen-####.png");
    }
}
    void intialize(){
     
        grp = f.toGroup(str);
       
        grp.centerIn(g, MARGIN,1, 1);
        background(255, 0);
    }
