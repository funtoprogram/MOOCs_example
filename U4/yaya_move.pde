int x, y, w, h;
int speedX = 1, speedY = 3;

void setup() {  
  size(600, 600);
  x = width/2;
  y = height/2;
  w = h = 200;
}

void draw() {
  background(255);
  
  rectMode(CENTER);
  noStroke();
  fill(127);
  rect(x, y, w, h);
  fill(255);
  rect(x, y, w/3*2, h/3*2);
  
  //Eyes
  stroke(127);
  strokeWeight(3);
  ellipse(x-w/6, y, w/12, h/12);
  ellipse(x+w/6, y, w/12, h/12);
  
  //Mouth
  noStroke();
  fill(#FF8B00);
  ellipse(x, y+h/6, w/3, h/6);
  stroke(255);
  line(x-w/6, y+h/6, x+w/6, y+h/6);
  
  x += speedX;
  y += speedY;
  
  
  if ( x-w/2 < 0 || x+w/2 > width ) { 
      speedX *= -1; 
  } 
  if ( y-h/2 < 0 || y+h/2 > height ) { 
     speedY *= -1; 
  }
  
}
