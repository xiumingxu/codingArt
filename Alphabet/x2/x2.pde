import geomerative.*;

RShape letter;
RFont font;
RGroup grp;
String f = "DINCondensed-Bold.ttf";
int MARGIN = 50;
String str = "X";



RShape shape;
void setup(){
  size(600,600);
  background(255);
  stroke(0,0,0);
  strokeWeight(2);
  int xPos = 0;
  String str = "X";
  RG.init(this);
     fill(0,20);
  noStroke();
  
  letter = RG.loadShape("XX.svg");


  init();
  
}


void init(){


  font = new RFont(f, 372, RFont.CENTER );
  grp = font.toGroup(str);
  grp.centerIn(g, 100 ,0.5, 0.5);
  

}
    

  // draw
  void draw(){
    background(255);
    for(int radius = 0; radius < width; radius+=70){
      ellipse(width/2, height/2, radius, radius);
      //letter = (RShape) (grp.elements[0]);


       letter.draw();
    }


  }
