PImage bg, surface, soil, stone, life, taco, frog, box; //<>//
PImage title, gameover, startNormal, startHovered, restartNormal, restartHovered;
PImage armIdle, armLeft, armRight, armDown;
PImage gamewin, goal;
PImage battery; 

final int GAME_INIT_TIMER = 7200;
int gameTimer = GAME_INIT_TIMER;
final float CLOCK_BONUS_SECONDS = 15f ;



final int GRID_SIZE = 80;
final int GRID_COL = 8;
final int SOIL_ROW_COUNT = 20;

final int GAME_START = 0;
final int GAME_RUN = 1; 
final int GAME_OVER = 2;
final int GAME_WIN = 3;
int gameState = 0;

final int startButtonX = 248;
final int startButtonY = 400;
final int startButtonWidth = 144;
final int startButtonHeight = 44;
final int armInitGridX = 3;
final int armInitGridY = 1;
int armHP;
float armX, armY;
float armGridX, armGridY;
float tacoX, tacoY, frogX, frogY;
float tacoSpeed, frogSpeed;
float boxX, boxY;
float batteryX, batteryY;

boolean isForward = true;

int digDirection = 0;
int digTimer = 0;
int digDuration = 15;


void setup() {
  size(640, 480);
  title = loadImage("img/title.jpg");
  gameover = loadImage("img/gameover.jpg");

  startNormal = loadImage("img/startNormal.png");
  startHovered = loadImage("img/startHovered.png");
  restartNormal = loadImage("img/restartNormal.png");
  restartHovered = loadImage("img/restartHovered.png");

  goal = loadImage("img/goal.png");
  gamewin = loadImage("img/gamewin.jpg");

  bg = loadImage("img/bg.jpg");
  surface = loadImage("img/surface.png");
  soil = loadImage("img/soil.png");
  stone = loadImage("img/stone.png");


  armIdle = loadImage("img/armIdle.png");
  armLeft = loadImage("img/armLeft.png");
  armRight = loadImage("img/armRight.png");
  armDown = loadImage("img/armDown.png");
  life = loadImage("img/life.png");
  armHP = 2;
  armGridX = armInitGridX;
  armGridY = armInitGridY;
  armX = armGridX * GRID_SIZE;
  armY = armGridY * GRID_SIZE; 
  digTimer = 0;

  taco = loadImage("img/taco.png");
  tacoX = -taco.width;
  tacoY = GRID_SIZE * floor(random(2, 6)); 
  tacoSpeed = random(2, 4);

  frog = loadImage("img/frog.png");
  frogX = -frog.width;
  frogY = GRID_SIZE * floor(random(2, 6)); 
  while (frogY == tacoY) {
    frogY = GRID_SIZE * floor(random(2, 6));
  }
  frogSpeed = 2;

  //TIMER
  gameTimer = GAME_INIT_TIMER;



  //box
  box = loadImage("img/box.png");
  boxX = GRID_SIZE * floor(random(8));
  boxY = GRID_SIZE * floor(random(2, 6));

  //battery
  battery = loadImage("img/battery.png");
  batteryX = GRID_SIZE * floor(random(8));
  batteryY = GRID_SIZE * floor(random(2, 6));
  while (batteryX==boxX && batteryY ==boxY) {
    batteryX = GRID_SIZE * floor(random(8));
    batteryY = GRID_SIZE * floor(random(2, 6));
  }
}

void draw() {

  switch (gameState) {
  case GAME_START:
    image(title, 0, 0);

    if (startButtonX < mouseX    
      && startButtonX + startButtonWidth > mouseX    
      && startButtonY < mouseY 
      && startButtonY + startButtonHeight > mouseY ) { 

      image(startHovered, startButtonX, startButtonY);

      if (mousePressed) {
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

    pushMatrix();
    translate(0, max(GRID_SIZE * -18, GRID_SIZE * 1 - armY));

    // Planet

    image(surface, 0, GRID_SIZE);
    image(soil, 0, GRID_SIZE * 2);
    image(soil, 0, GRID_SIZE * 0+height);
    image(soil, 0, GRID_SIZE * (-2)+height*2);
    image(soil, 0, GRID_SIZE * (-4)+height*3);
    image(soil, 0, GRID_SIZE * (-6)+height*4);
    image(goal, 0, SOIL_ROW_COUNT * GRID_SIZE);

    // Stone
    //for(int i=0; i<8; i++) {
    //  image(stone, i*GRID_SIZE, (i%4+2)*GRID_SIZE);
    //}

    //--- Player ------------ 
    PImage armDisplay = armIdle;

    if (digTimer == 0 && keyPressed && key == CODED) {

      switch(keyCode) {
      case LEFT:
        if (armX > 0) {
          digDirection = LEFT;
          digTimer = digDuration;
          armDisplay = armLeft;
        }
        break;

      case RIGHT:
        if (armX < width - GRID_SIZE) {
          digDirection = RIGHT;
          digTimer = digDuration;
          armDisplay = armRight;
        }
        break;

      case DOWN:
        digDirection = DOWN;

        digTimer = digDuration;
        armDisplay = armDown;

        break;
      }
    } else if (digTimer > 0) {

      digTimer --;
      switch(digDirection) {

      case LEFT:
        armDisplay = armLeft;
        if (digTimer == 0) {
          armGridX --;
          armX = GRID_SIZE * armGridX;
        } else {
          armX = (float(digTimer) / digDuration + armGridX - 1) * GRID_SIZE;
        }
        break;

      case RIGHT:
        armDisplay = armRight;
        if (digTimer == 0) {
          armGridX ++;
          armX = GRID_SIZE * armGridX;
        } else {
          armX = (1f - float(digTimer) / digDuration + armGridX) * GRID_SIZE;
        }
        break;

      case DOWN:
        armDisplay = armDown;
        if (digTimer == 0) {

          armGridY ++;                
          armY = GRID_SIZE * armGridY;
          if (armGridY >= SOIL_ROW_COUNT+3 ) {
            gameState = GAME_WIN;
          }
        } else {
          armY = (1f - float(digTimer) / digDuration + armGridY) * GRID_SIZE;
        }
        break;
      }
    }


    image(armDisplay, armX, armY);



    //--- Taco ------------
    tacoX += tacoSpeed;

    if (tacoX+taco.width > width) {
      tacoX = - taco.width;
    }
    image(taco, tacoX, tacoY);

    if (tacoY == armY 
      && tacoX < armX+armIdle.width
      && tacoX+taco.width > armX) {
      armGridX = armInitGridX;
      armGridY = armInitGridY;
      armX = armGridX * GRID_SIZE;
      armY = armGridY * GRID_SIZE; 
      armHP--;
    }

    //--- Frog ------------ 

    if (frogX+frog.width > width) {
      isForward = false ;
    } else if (frogX <= 0) {
      isForward = true ;
    }
    if (isForward ) {
      frogSpeed *=1;
      frogX += frogSpeed;
      image(frog, frogX, frogY);
    } else {
      frogSpeed *= -1;
      frogX += frogSpeed;
      pushMatrix();
      translate(frogX + 80, frogY);
      scale(-1, 1);
      image(frog, 0, 0);
      popMatrix();
    }


    if (frogY == armY 
      && frogX < armX+armIdle.width
      && frogX+frog.width > armX) {
      armGridX = armInitGridX;
      armGridY = armInitGridY;
      armX = armGridX * GRID_SIZE;
      armY = armGridY * GRID_SIZE; 
      armHP--;
    }

    if (frogY == armY && ((isForward && armX > frogX + 80) || (!isForward && armX < frogX))) {
      frogSpeed = 8;
    } else {
      frogSpeed = 2;
    }



    //--- Life ------------ 
    image(box, boxX, boxY);



    if (boxY == armY 
      && boxX < armX+armIdle.width 
      && boxX+box.width > armX
      && armHP < 5) {
      armHP++;
      boxX = -GRID_SIZE;
    }

    //battery 
    image(battery, batteryX, batteryY);
    if (batteryY == armY  && batteryX < armX+armIdle.width && batteryX+box.width > armX
      ) {
      float seconds = CLOCK_BONUS_SECONDS;
      gameTimer += round(seconds * 60);
      batteryX = -GRID_SIZE;
    }




    popMatrix();


    for (int i=0; i<armHP; i++) {
      image(life, 20+60*i, 20);
    }

    if (armHP <= 0) { 
      gameState = GAME_OVER;
    }
    // Layer Count UI
    String depthString = (armGridY-1)+"m";
    textSize(56);
    textAlign(RIGHT, BOTTOM);
    fill(#1D2086);
    text(depthString, width, height);
    fill(0, 120);
    text(depthString, width+3, height+3);



    //TIME UI
    textAlign(LEFT, BOTTOM);
    float totalSeconds = float(gameTimer) / 60;
    String result = "";
    result += nf(floor(totalSeconds/60), 2);
    result += ":";
    result += nf(floor(totalSeconds%60), 2);
    textSize(56);
    fill(0, 120);
    text(result, 3, height+3 );
    fill(#ffffff);
    text(result, 0, height);

    gameTimer --;
    if (gameTimer <= 0) gameState = GAME_OVER;




    break;

  case GAME_OVER:

    image(gameover, 0, 0);

    if (startButtonX < mouseX    
      && startButtonX + startButtonWidth > mouseX    
      && startButtonY < mouseY 
      && startButtonY + startButtonHeight > mouseY ) { 

      image(restartHovered, startButtonX, startButtonY);

      if (mousePressed) {
        armHP = 3;
        armGridX = armInitGridX;
        armGridY = armInitGridY;
        armX = armGridX * GRID_SIZE;
        armY = armGridY * GRID_SIZE; 

        tacoX = -taco.width;
        tacoY = GRID_SIZE * floor(random(2, 6)); 
        tacoSpeed = random(2, 4);

        frogX = -frog.width;
        frogY = GRID_SIZE * floor(random(2, 6)); 
        frogSpeed = 2;

        boxX = GRID_SIZE * floor(random(8));
        boxY = GRID_SIZE * floor(random(2, 6));

        digTimer = 0;

        gameState = GAME_RUN;
      }
    } else {

      image(restartNormal, startButtonX, startButtonY);
    }
    break;

  case GAME_WIN:

    image(gamewin, 0, 0);

    if (startButtonX < mouseX    
      && startButtonX + startButtonWidth > mouseX    
      && startButtonY < mouseY 
      && startButtonY + startButtonHeight > mouseY ) { 

      image(restartHovered, startButtonX, startButtonY);

      if (mousePressed) {
        armHP = 3;
        armGridX = armInitGridX;
        armGridY = armInitGridY;
        armX = armGridX * GRID_SIZE;
        armY = armGridY * GRID_SIZE; 

        tacoX = -taco.width;
        tacoY = GRID_SIZE * floor(random(2, 6)); 
        tacoSpeed = random(2, 4);

        frogX = -frog.width;
        frogY = GRID_SIZE * floor(random(2, 6)); 
        frogSpeed = 2;

        boxX = GRID_SIZE * floor(random(8));
        boxY = GRID_SIZE * floor(random(2, 6));

        digTimer = 0;

        gameState = GAME_RUN;
      }
    } else {

      image(restartNormal, startButtonX, startButtonY);
    }
    break;
  }
}
