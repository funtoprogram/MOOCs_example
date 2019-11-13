//draw brick
int brickWidth = 80;
int brickHeight = 40;

size(400, 360);
background(255);
fill(#4AB8D7);

for(int y = 0; y < height; y+=brickHeight){
  for(int x = 0; x < width; x+=brickWidth){
    if(y % (brickHeight*2) == 0){
      rect(x, y, brickWidth, brickHeight);
    }else{
      rect(x - brickWidth / 2, y, brickWidth, brickHeight);
    }
  }
}
