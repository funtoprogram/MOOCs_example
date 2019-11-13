PImage ufo;
int ufoX, ufoY;
int speed = 10;

void setup() {
  size(600, 600);
  ufo = loadImage("ufo.png");
  ufoX = width/2 - ufo.width/2;
  ufoY = height/2 - ufo.height/2;
  println(LEFT);
  println(UP);
  println(RIGHT);
  println(DOWN);
}

void draw() {
  background(255);
  image(ufo, ufoX, ufoY);
}

void keyPressed() {
  //println(key);
  if (key == CODED) {
    //println(keyCode);  
    switch (keyCode) {   
      case RIGHT: ufoX += speed;
      break;
      case DOWN:  ufoY += speed;
      break;
      case LEFT:  ufoX -= speed;
      break; 
      case UP:    ufoY -= speed;
      break;
    }
  }
}
