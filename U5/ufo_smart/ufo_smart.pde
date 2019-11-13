PImage ufo;
int ufoX= 0, ufoY= 0;
int speed = 3;

final int GO_RIGHT = 0;
final int GO_DOWN = 1;
final int GO_LEFT = 2;
final int GO_UP = 3;
int state; 

void setup() {
  size(600, 600);
  ufo = loadImage("ufo.png");
  state = GO_RIGHT;
}

void draw() {
  background(255);
  switch (state) {
    case GO_RIGHT:
      ufoX += speed;
      if (ufoX + ufo.width > width) {
        ufoX = width - ufo.width;
        state = GO_DOWN;
      }
    break;
    case GO_DOWN:
      ufoY += speed;
      if (ufoY + ufo.height > height) {
        ufoY = height - ufo.height;
        state = GO_LEFT;
      }
    break;
    case GO_LEFT:
      ufoX -= speed;
      if (ufoX < 0) {
        ufoX = 0;
        state = GO_UP;
      }
    break;
    case GO_UP:
      ufoY -= speed;
      if (ufoY < 0) {
        ufoY = 0;
        state = GO_RIGHT;
      }
    break;
  }
  image(ufo, ufoX, ufoY);
}
