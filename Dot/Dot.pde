final int nbW = 30;
final int nbH = 30;
int bgColor = 20;
float fc;
Pod[][] pods = new Pod[nbW][nbH];
int moveMode = 0;
int colMode = 1;
float t0;
PVector colorRoot = new PVector(random(12345), random(12345));
PVector moveRoot = new PVector(random(12345), random(12345));
final float colorFreq = 200;
final float moveFreq = 290;
Boolean toggleBars = true;
Boolean toggleDots = false;
ImageMgr imageMgr;

/////// Pod variables ///////
/////////////////////////////
Boolean initPodValues = false;
final float dotD = 4;//dots' diameter
int podD = 28;//pod diameter
float podGap = -15;//gap between pods
float podInnerD;//inner dots position
float podRectW;//pods rectangles width
float podRectH;//pods rectangles height
/////////////////////////////
/////////////////////////////

void setup() {
  size(450, 421, P3D);
  rectMode(CENTER);
  t0 = millis();
  for (int i = 0; i < nbW; i++) {
    for (int j = 0; j < nbH; j++) {
      pods[i][j] = new Pod();
    }
  }
  doInitPodValues();
  imageMgr = new ImageMgr();
}

void draw() {
  fc = float(frameCount);
  if (colMode == 0) {
    colorRoot.x += 1 / colorFreq;
    colorRoot.y += 1 / colorFreq;
  }
  if (moveMode == 2) {
    moveRoot.x += 1 / moveFreq;
    moveRoot.y += 1 / moveFreq;
  }
  if (initPodValues) {
    doInitPodValues();
  }
  background(bgColor);
  for (int i = 0; i < nbW; i++) {
    for (int j = 0; j < nbH; j++) {
      pods[i][j].display();
    }
  }
}

void doInitPodValues() {
  podInnerD = (podD + podGap) / 3;
  podRectW = podD/2-dotD;
  podRectH = .15*podD/2;
  for (int i = 0; i < nbW; i++) {
    for (int j = 0; j < nbH; j++) {
      pods[i][j].initPos(i, j);
    }
  }
  initPodValues = false;
}

void keyPressed() {
  if (key == CODED) {
    switch(keyCode) {
    case ALT: 
      moveMode = (moveMode+1)%3;
      break;
    case CONTROL: 
      colMode = (colMode+1)%2;
      break;
    case LEFT: 
      podGap = max(podGap - 2, -podD);
      initPodValues = true;
      break;
    case RIGHT: 
      podGap = min(podGap + 2, podD);
      initPodValues = true;
      break;
    case DOWN: 
      podD = max(podD - 2, 2);
      initPodValues = true;
      break;
    case UP: 
      podD = min(podD + 2, 40);
      initPodValues = true;
      break;
    }
  } else {
    if ((""+key).equals("d")) {
    //if (key.toString()=="d") {
      toggleDots = !toggleDots;
    } else if ((""+key).equals("b")) {
    //} else if (key.toString()=="b") {
      toggleBars = !toggleBars;
    }
  }
}

/* @pjs preload="Louis_Vuitton.jpg"; */

class ImageMgr {
  PImage img;
  int[] pxls;
  int w, h;

  ImageMgr() {
    img = loadImage("TEST.png");
    w = img.width;
    h = img.height;
    pxls = new int[w*h];
    img.loadPixels();
    arrayCopy(img.pixels, pxls);
    img.updatePixels();
  }

  int getMyColor(int x, int y) {
    if (x > -1 && x < w && y > -1 && y < h) {
      return pxls[y*w + x];
    } else {
      return bgColor;
    }
  }
}

class Pod {
  final float twoPi = TWO_PI;
  final float viscosity = .12;

  PVector pos;
  float theta = 0, targetTheta = 0;

  color c0, c1, c2, c3, c4, c5, c6, c7, c8;

  void initPos(int i, int j) {
    pos = new PVector(podD/2 + i*(podD+podGap), podD/2 + j*(podD+podGap));
  }

  void display() {
    changeRotation();
    changeColors();
    show();
  }

  void show() {
    float x, y;
    int c;
    pushMatrix();
    translate(pos.x, pos.y);

    //outside dots
    if (toggleDots) {
      x = (podD + podGap)/2;
      y = x;
      if (colMode == 1) {
        c = getImgColor(x, y);
      } else {
        c = c0;
      }
      fill(c);
      noStroke();
      ellipse(x, y, dotD, dotD);
    }

    rotate(theta);

    if (toggleDots) {
      //center dot
      noStroke();
      x = 0;
      y = 0;
      if (colMode == 1) {
        c = getImgColor(x, y);
      } else {
        c = c0;
      }
      fill(c);
      ellipse(x, y, dotD, dotD); 

      //4 inner dots
      for (int i = 0; i < 4; i ++) {
        float angle = (i + .5) * twoPi / 4;
        x = podInnerD * cos(angle);
        y = podInnerD * sin(angle);
        if (colMode == 1) {
          c = getImgColor(x, y);
        } else {
          c = i == 0 ? c1 : i == 1 ? c2 : i == 2 ? c3 : c4;
        }
        fill(c);
        ellipse(x, y, dotD, dotD);
      }
    }

    //4 rectangles
    if (toggleBars) {
      noStroke();
      x = .75*dotD+podRectW/2;
      y = 0;
      if (colMode == 1) {
        c = getImgColor(x, y);
      } else {
        c = c5;
      }
      fill(c);
      rect(x, y, podRectW, podRectH);

      x = -.75*dotD-podRectW/2;
      y = 0;
      if (colMode == 1) {
        c = getImgColor(x, y);
      } else {
        c = c6;
      }
      fill(c);
      rect(x, y, podRectW, podRectH);

      x = 0;
      y = .75*dotD+podRectW/2;
      if (colMode == 1) {
        c = getImgColor(x, y);
      } else {
        c = c7;
      }
      fill(c);
      rect(x, y, podRectH, podRectW);

      x = 0;
      y = -.75*dotD-podRectW/2;
      if (colMode == 1) {
        c = getImgColor(x, y);
      } else {
        c = c8;
      }
      fill(c);
      rect(x, y, podRectH, podRectW);
    }
    popMatrix();
  }

  int getImgColor(float x, float y) {
    float X = modelX(x, y, 0);
    float Y = modelY(x, y, 0); 
    return imageMgr.getMyColor(int(X), int(Y));
  }

  void changeRotation() {
    if (moveMode == 0 || moveMode == 1) {
      PVector pv = new PVector(mouseX, mouseY);
      pv.sub(pos);
      targetTheta = pv.heading();
    } else if (moveMode == 2) {
      targetTheta = 2 * twoPi * noise(moveRoot.x + podD*pos.x/40000, moveRoot.y + podD*pos.y/40000);
    }
    theta %= twoPi;
    float minD = 2000;
    if (abs(theta - targetTheta) < minD) {
      minD = abs(theta - targetTheta);
    }
    if (abs(theta - targetTheta - twoPi) < minD) {
      minD = abs(theta - targetTheta - twoPi);
      targetTheta = targetTheta + twoPi;
    } else if (abs(theta - targetTheta + twoPi) < minD) {
      minD = abs(theta - targetTheta + twoPi);
      targetTheta = targetTheta - twoPi;
    }

    if (moveMode == 1) {
      float dTheta = targetTheta - theta;
      float step = .04;
      if (abs(dTheta) < step) {
        theta = targetTheta;
      } else {
        theta += step * (dTheta)/abs(dTheta);
      }
    } else {
      theta += (targetTheta - theta) * viscosity;
    }
  }

  void changeColors() {
    if(colMode == 0) {
      c0 = c1 = c2 = c3 = c4 = color(map(noise(colorRoot.x + pos.x/807, colorRoot.y + pos.y/460), .1, .9, 0, 255), 255, 255);
      c5 = c6 = c7 = c8 = color(map(noise(colorRoot.x - pos.x/231, colorRoot.y - pos.y/590), .1, .9, 0, 255), 120, 255);
    }
  }
}
