//draw brick
int brickWidth = 80;
int brickHeight = 40;
int spacing = 5;
int ix = 50;
int iy = 50;

size(400, 300);
background(255);
fill(#4AB8D7);

for(int row = 0; row < 4; row++){
  for(int col = 0; col < 4; col++){
    int x = ix + (brickWidth + spacing) * col;
    int y = iy + (brickHeight + spacing) * row;
    if(row % 2 == 0){
      rect(x, y, brickWidth, brickHeight);
    }else{
      rect(x - brickWidth / 2, y, brickWidth, brickHeight);
    }
  }
}
