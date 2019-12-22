import geomerative.*;

RShape letter;
PImage img;

void setup(){
  size(600,600);
  background(0);
  img = loadImage("data/xx.jpg");
  RG.init(this);
  
  letter = RG.loadShape("XX.svg");
  noStroke();
  
  
}
void draw(){
  background(0);
  fill(0);
  image(img, 0,0);
  letter.draw();
}
