PImage playerCar, comCar, start, win, lose;
final int GAME_START = 0;
final int GAME_RUN = 1;
final int GAME_WIN = 2;
final int GAME_OVER = 3;

int gameState;
int playerCarX, comCarX;
boolean speedUp = false;

void setup(){
  size (400,300);
  
  // load images
  playerCar = loadImage("img/playerCar.png");
  comCar = loadImage("img/comCar.png");
  start = loadImage("img/start.png");
  win = loadImage("img/win.png");
  lose = loadImage("img/lose.png");
  
  gameState = GAME_START;
  playerCarX = comCarX = 0;
}

void draw(){
  background(255);
  
  switch (gameState){
    case GAME_START:
    if(mouseY > 15 && mouseY < 15+start.height) {
      
      if(mousePressed){
        gameState = GAME_RUN;
      }
      else{
        noStroke();
        fill(255,255,0,100);
        rect(0, 5, width, start.height+10);
      }
    }
    
    image(start, 0, 15);
    image(playerCar, playerCarX, height/3);
    image(comCar, comCarX, height*2/3);
    
    break;
    case GAME_RUN:
    
      if(speedUp) {
        playerCarX += random(1, 3);
      }
      comCarX += random(0, 3);
      
      image(playerCar, playerCarX, height/3);
      image(comCar, comCarX, height*2/3);
      int goalX = width-playerCar.width;
      stroke(255, 0, 0);
      line(goalX, 0, goalX, height);
    
      if(playerCarX+playerCar.width >= goalX) {
        gameState = GAME_WIN;
      }
      if(comCarX+comCar.width >= goalX) {
        gameState = GAME_OVER;
      }
    break;
    case GAME_WIN:
    int winY = height/2-win.height/2;
    if(mouseY > winY && mouseY < winY+win.height) {
      
      if(mousePressed){
        gameState = GAME_START;
        playerCarX = comCarX = 0;
 
      }
      else{
        noStroke();
        fill(255,255,0,100);
        rect(0, winY-5, width, win.height+5);
      }
    }
    image(win, 0, winY);
    break;
    case GAME_OVER:
    int loseY = height/2-lose.height/2;
    if(mouseY > loseY && mouseY < loseY+lose.height) {
      
      if(mousePressed){
        gameState = GAME_START;
        playerCarX = comCarX = 0;
 
      }
      else{
        noStroke();
        fill(255,255,0,100);
        rect(0, loseY-5, width, lose.height+5);
      }
    }
    image(lose, 0, loseY);
    break;
  }
}

void keyPressed() {
  if(keyCode == RIGHT) {
    speedUp = true;
  }
}

void keyReleased() {
  if(keyCode == RIGHT) {
    speedUp = false;
  }
}
