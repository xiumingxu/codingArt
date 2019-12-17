
float t;
void setup(){
  background(20);
  size(1500,1500);
}

void draw(){
  stroke(255);
  strokeWeight(5);
  
  translate(width/2, height/2);
  line(x1(t), y1(t), x2(t), y2(t));
  //point(x1(t), y1(t));
  //point(x2(t), y2(t));
  t++;
}

int radius = 500;
//paramatric equations 
float x1(float t){
  return sin(t / 10 ) * radius + sin(t/5) * 20;
}

float y1(float t){
  return cos(t / 10 ) * radius/3;
}

float x2(float t){
  return sin(t / 10 ) * radius/5;
}

float y2(float t){
  return cos(t / 10 ) * radius*2;
}
