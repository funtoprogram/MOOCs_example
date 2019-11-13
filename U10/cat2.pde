void setup() {
  size(500, 500);
  background(250);
  for(int i = 0; i <10; i++){
    float x = i * width / 10;
    cat(x, 200, 0.1);
  }
}

void cat(float x, float y, float s) {
  pushMatrix();
  translate(x, y);
  scale(s);

  //face
  noStroke();
  fill(220, 170, 70);
  triangle(100, 150, 125, 50, 200, 150);
  triangle(400, 150, 375, 50, 300, 150);
  ellipse(250, 250, 400, 300);

  //ears
  fill(255, 179, 191);
  triangle(110, 150, 130, 75, 165, 120);
  triangle(390, 150, 370, 75, 335, 120);

  //eyes
  fill(0);
  ellipse(175, 225, 50, 50);
  ellipse(325, 225, 50, 50);
  fill(255);
  ellipse(165, 220, 10, 10);
  ellipse(315, 220, 10, 10);

  //nose
  fill(77, 31, 0);
  triangle(250, 310, 225, 280, 275, 280);

  //whiskers
  stroke(77, 31, 0);
  strokeWeight(5);
  line(250, 300, 250, 325);
  line(250, 325, 220, 345);
  line(250, 325, 280, 345);

  strokeWeight(3);
  line(30, 225, 110, 250);
  line(30, 275, 110, 275);
  line(30, 325, 110, 300);
  line(470, 225, 390, 250);
  line(470, 275, 390, 275);
  line(470, 325, 390, 300);

  //tie
  noStroke();
  triangle(175, 350, 260, 405, 175, 450);
  triangle(325, 350, 240, 405, 325, 450);
  fill(255, 77, 64);
  rect(225, 380, 50, 45, 5);

  popMatrix();
}
