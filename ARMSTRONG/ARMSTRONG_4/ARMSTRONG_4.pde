PImage bg, surface, soil, life, arm, taco, frog;

final int GRID_SIZE = 80;
final int GRID_COL = 8;
final int GRID_ROW = 6;

int armHP = 3;
float armX , armY;
float tacoX, tacoY;
float tacoSpeed;
float frogX, frogY;
float frogSpeed;

void setup() {
  size(640, 480);
  bg = loadImage("img/bg.jpg");
  surface = loadImage("img/surface.png");
  soil = loadImage("img/soil.png");
  life = loadImage("img/life.png");

  
  arm = loadImage("img/arm.png");
  armX = 3 * GRID_SIZE;
  armY = 1 * GRID_SIZE; 
  
  taco = loadImage("img/taco.png");
  tacoX = -taco.width;
  tacoY = GRID_SIZE * floor(random(2, 6)); 
  tacoSpeed = random(2, 4);
  
  frog = loadImage("img/frog.png");
  frogX = -frog.width;
  frogY = GRID_SIZE * floor(random(2, 6)); 
  frogSpeed = 2;
}

void draw() {
  // Background
  image(bg, 0, 0, width, height);
  
  // Moon
  fill(#FFD74B);
  stroke(#FFC800);
  strokeWeight(15);
  ellipse(550, 80, 130, 130);
  
  // Planet
  image(surface, 0, GRID_SIZE);
  image(soil, 0, GRID_SIZE * 2);

  // Player
  image(arm, armX, armY);
  
  // Taco
  tacoX += tacoSpeed;
  
  if(tacoX+taco.width > width) {
    tacoX = - taco.width;
  }
  image(taco, tacoX, tacoY);
  
  if(tacoY==armY && tacoX+taco.width>armX && tacoX<armX+arm.width ) {
    armX = 3 * GRID_SIZE;
    armY = 1 * GRID_SIZE; 
    armHP--;
  }
  
  // Frog
  frogX += frogSpeed;
  if(frogX+frog.width > width) {
    frogX = - frog.width;
  }
  image(frog, frogX, frogY);
  
  if(frogY==armY && frogX+frog.width>armX && frogX<armX+arm.width ) {
    armX = 3 * GRID_SIZE;
    armY = 1 * GRID_SIZE; 
    armHP--;
  }
  
  if(frogY == armY && frogX < armX) {
    frogSpeed = 8;
  }
  else {
    frogSpeed = 2;
  }
  
  //Life
  if(armHP >= 1) {
    image(life, 20, 20);
  }
  if(armHP >= 2) {
    image(life, 80, 20);
  }
  if(armHP == 3) {
    image(life, 140, 20);
  }
}

void keyPressed() {
 if(key == CODED) {
  if(keyCode == LEFT && armX > 0) {
    armX -= GRID_SIZE;
  }
  if(keyCode == RIGHT && armX+arm.width < width) {
    armX += GRID_SIZE;
  }
  if(keyCode == DOWN && armY+arm.height < height) {
    armY += GRID_SIZE;
  }
 }
}
