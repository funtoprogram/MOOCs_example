int x = 0; //<>//
void setup(){
  size(200, 200);
}

void draw(){
  if(x < width){
    ellipse(x,100,20,20);
    x += 20;
  }
}
