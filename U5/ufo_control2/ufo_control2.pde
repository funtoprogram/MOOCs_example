PImage ufo;
int ufoX, ufoY;
int speed = 10;
boolean right = false;
boolean down = false;
boolean left = false;
boolean up = false;

void setup() {
  size(600, 600);
  ufo = loadImage("ufo.png");
  ufoX = width/2 - ufo.width/2;
  ufoY = height/2 - ufo.height/2;
}

void draw() {
  background(255);
  
  if(right){ ufoX += speed; }
  if(down) { ufoY += speed; }
  if(left) { ufoX -= speed; }
  if(up)   { ufoY -= speed; }
  
  if(ufoX < -ufo.width) {ufoX = width;}
  if(ufoX > width)      {ufoX = -ufo.width;}
  if(ufoY < -ufo.height) {ufoY = height;}
  if(ufoY > height) {ufoY = -ufo.height;}
  
  image(ufo, ufoX, ufoY);
}

void keyPressed() {
  if (key == CODED) { 
    switch (keyCode) {   
      case RIGHT: right = true;
      break;
      case DOWN:  down = true;
      break;
      case LEFT:  left = true;
      break; 
      case UP:    up = true;
      break;
    }
  }
}

void keyReleased() {
  if (key == CODED) { 
    switch (keyCode) {   
      case RIGHT: right = false;
      break;
      case DOWN:  down = false;
      break;
      case LEFT:  left = false;
      break; 
      case UP:    up = false;
      break;
    }
  }
}
