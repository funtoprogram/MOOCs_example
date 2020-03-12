PImage bg, surface, soil,arm, taco;

int gridSize = 80;
int gridCol = 8;
int gridRow = 6;

float armX , armY;
float tacoX, tacoY;
float tacoSpeed;

void setup() {
  size(640, 480);
  bg = loadImage("img/bg.jpg");
  surface = loadImage("img/surface.png");
  soil = loadImage("img/soil.png");
  
  arm = loadImage("img/arm.png");
  armX = 3 * gridSize;
  armY = 1 * gridSize; 
  
  taco = loadImage("img/taco.png");
  tacoX = -taco.width;
  tacoY = gridSize * floor(random(2, 6)); 
  tacoSpeed = random(2, 4);
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
  image(surface, 0, gridSize);
  image(soil, 0, gridSize * 2);

  // Player
  image(arm, armX, armY);
  
  // Taco
  tacoX += tacoSpeed;
  tacoX %= (width + taco.width);
  image(taco, tacoX-taco.width, tacoY);
  
}
