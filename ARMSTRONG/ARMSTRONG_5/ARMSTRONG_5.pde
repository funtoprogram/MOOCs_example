PImage bg, surface, soil, life, arm, taco, frog, box;
PImage title, gameover, startNormal, startHovered, restartNormal, restartHovered;

final int GRID_SIZE = 80;
final int GRID_COL = 8;
final int GRID_ROW = 6;

final int GAME_START = 0;
final int GAME_RUN = 1;
final int GAME_OVER = 2;
int gameState = 0;

final int startButtonX = 248;
final int startButtonY = 400;
final int startButtonWidth = 144;
final int startButtonHeight = 44;

int armHP;
float armX , armY;
float tacoX, tacoY, frogX, frogY;
float tacoSpeed, frogSpeed;
float boxX, boxY;



void setup() {
  size(640, 480);
  title = loadImage("img/title.jpg");
  gameover = loadImage("img/gameover.jpg");
  startNormal = loadImage("img/startNormal.png");
  startHovered = loadImage("img/startHovered.png");
  restartNormal = loadImage("img/restartNormal.png");
  restartHovered = loadImage("img/restartHovered.png");
  
  bg = loadImage("img/bg.jpg");
  surface = loadImage("img/surface.png");
  soil = loadImage("img/soil.png");
  
  arm = loadImage("img/arm.png");
  life = loadImage("img/life.png");
  armHP = 2;
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
  
  //box
  box = loadImage("img/box.png");
  boxX = GRID_SIZE * floor(random(8));
  boxY = GRID_SIZE * floor(random(2, 6));
}

void draw() {
  
  switch (gameState) {
    case GAME_START:
    image(title, 0, 0);
    
    if(startButtonX < mouseX    
      && startButtonX + startButtonWidth > mouseX    
      && startButtonY < mouseY 
      && startButtonY + startButtonHeight > mouseY ) { 

      image(startHovered, startButtonX, startButtonY);
      
      if(mousePressed) {
        gameState = GAME_RUN;
      }

    } else {

      image(startNormal, startButtonX, startButtonY);

    }
    break;
    
    case GAME_RUN:
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
      
      //--- Taco ------------
      tacoX += tacoSpeed;
      
      if(tacoX+taco.width > width) {
        tacoX = - taco.width;
      }
      image(taco, tacoX, tacoY);
      
      if(tacoY == armY 
      && tacoX < armX+arm.width
      && tacoX+taco.width > armX) {
        armX = 3 * GRID_SIZE;
        armY = 1 * GRID_SIZE; 
        armHP--;
      }
      
      //--- Frog ------------ 
      frogX += frogSpeed;
      if(frogX+frog.width > width) {
        frogX = - frog.width;
      }
      image(frog, frogX, frogY);
      
      if(frogY == armY 
      && frogX < armX+arm.width
      && frogX+frog.width > armX) {
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
      
      //--- Life ------------ 
      image(box, boxX, boxY);
      
      if(boxY == armY 
      && boxX < boxX+arm.width 
      && boxX+box.width > armX
      && armHP < 3) {
        armHP++;
        boxX = -GRID_SIZE;
      }
      
      if(armHP <= 0) { 
        gameState = GAME_OVER;
      }
      if(armHP >= 1) {
        image(life, 20, 20);
      }
      if(armHP >= 2) {
        image(life, 80, 20);
      }
      if(armHP == 3) {
        image(life, 140, 20);
      }    
    break;
    
    case GAME_OVER:
    
    image(gameover, 0, 0);
    
    if(startButtonX < mouseX    
      && startButtonX + startButtonWidth > mouseX    
      && startButtonY < mouseY 
      && startButtonY + startButtonHeight > mouseY ) { 

      image(restartHovered, startButtonX, startButtonY);
      
      if(mousePressed) {
        armHP = 3;
        armX = 3 * GRID_SIZE;
        armY = 1 * GRID_SIZE; 

        tacoX = -taco.width;
        tacoY = GRID_SIZE * floor(random(2, 6)); 
        tacoSpeed = random(2, 4);

        frogX = -frog.width;
        frogY = GRID_SIZE * floor(random(2, 6)); 
        frogSpeed = 2;

        boxX = GRID_SIZE * floor(random(8));
        boxY = GRID_SIZE * floor(random(2, 6));
        
        gameState = GAME_RUN;
      }

    } else {

      image(restartNormal, startButtonX, startButtonY);

    }
    break;
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
