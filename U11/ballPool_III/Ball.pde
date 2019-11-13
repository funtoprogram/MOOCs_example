class Ball{
  float x;
  float y;
  float xSpeed;
  float ySpeed;
  float size;
  float r, g, b;
  
    void display() {
    ellipse(x, y, size, size);
    noStroke();
    fill(r, g, b);
  }
  
  void move(){
    x+=xSpeed;
    y+=ySpeed;
    
    if (x<0 || x>width){
      xSpeed *= -1;
    }
    if (y<0 || y>height){
      ySpeed *= -1;
    }
  }
  
  Ball(){
    x = random(width);
    y = random(height);
    xSpeed = random(5);
    ySpeed = random(3);
    size = random(10, 30);
    r = random(255);
    g = random(255);
    b = random(255);
  }
  // constructor overloading
  Ball(float s){
    x = random(width);
    y = random(height);
    xSpeed = random(5);
    ySpeed = random(3);
    size = s;
    r = random(255);
    g = random(255);
    b = random(255);
  }
}
