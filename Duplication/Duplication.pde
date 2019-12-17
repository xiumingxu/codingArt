PImage pf;
float ax ,by , sx, sy , rz = 0.0;

void setup(){
  size(1920,1080);
  background(255);
  pf = loadImage("TEST.png");
  imageMode(CENTER);
}

void draw(){
  tint(255,5);
  translate(Move().x,Move().y);
  rotate(RotateZ());
  image(pf,0,0,Sca(600).x,Sca(600).x);
}

PVector Move(){
  PVector xy = new PVector(noise(ax)*width,noise(by)*height);
  ax += 0.00015;
  by += 0.0002;
  return xy;
}

PVector Sca(float WH){
  PVector Sxy = new PVector(noise(sx)*WH,noise(sy)*WH);
  sx += random(0.0001,0.0006);
  sy += random(0.0001,0.0006);
  return Sxy;
}

float RotateZ(){
  rz += 0.00003;
  return noise(rz)*360;
}
