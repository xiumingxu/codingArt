import geomerative.*;

PShape letter;
RFont font;
RGroup grp;
String f = "DINCondensed-Bold.ttf";
int MARGIN = 50;

String str = "X";

  int xPos = 0;

RShape shape;
void setup(){
  size(600,600);
  background(255);
  stroke(0,0,0);
  strokeWeight(2);

  
  String str = "X";
  
       RG.init(this);
        init();

  
}


void init(){

  font = new RFont(f, 372, RFont.CENTER );
  grp = font.toGroup(str);
  grp.centerIn(g, MARGIN,1, 1);
  
  letter = loadShape("XX.svg");
  shapeMode(CENTER);
  shape(letter, 255,255, 100, 100);
  
}
    

  // draw
  void draw(){
    background(255);
     fill(0,20);
     
   
    
      while(xPos<width){
      line(xPos, 0, xPos, height);
      xPos += random(0, 20);

       //letter.draw();
     
     
  }
  
   
  }
