int x, y, w, h;
int xSpeed, ySpeed;

void setup() {
  x = 100;
  y = 100;
  w = h = 300;
  
  xSpeed = 1;
  ySpeed = 3;
  size(600, 600);
}

void draw() {
  background(255);
  
  //face
  noStroke();
  fill(127);
  rect(x, y, w, h);
  fill(255);
  rect(x+w/6, y+h/6, w/6*4, h/6*4);
  
  //eyes
  stroke(127);
  strokeWeight(8);
  ellipse(x+w/6*2, y+h/6*3, w/60*4, h/60*4);
  ellipse(x+w/6*4, y+h/6*3, w/60*4, h/60*4);
  
  //mouth
  noStroke();
  fill(#FF8902);
  ellipse(x+w/6*3, y+h/6*4, w/6*2, h/6*1);
  stroke(255);
  line(x+w/6*2, y+h/6*4, x+w/6*4, y+h/6*4);

  x += xSpeed;
  y += ySpeed;
  
  x %= (600-w);
  y %= (600-h);
}
