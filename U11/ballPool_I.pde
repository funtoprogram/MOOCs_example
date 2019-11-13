Ball a;

void setup(){
  size(300,300);
  a = new Ball();
}

void draw(){
  background(255);
  a.move();
  a.display();
}
