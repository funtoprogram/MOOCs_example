final int EYE_X_L = 160;  // left eye center X-position 
final int EYE_X_R = 440;  // right eye center X-position
final int EYE_Y = 250;    // eyes center Y-position
final int SCARF_W = 60;

PImage face, eye, fly;
color freckle = color(235,175,150);
int eyeX;

void setup() {  
  size(600 ,720);
  face = loadImage("face.png");
  eye = loadImage("eye.png");
  fly = loadImage("fly.png");
  imageMode(CENTER);
  colorMode(HSB, 360, 100, 100);
  noStroke();
  noCursor(); // make mouse disappear
}

void draw(){  
  image(face, width/2, height/2);
    
  for(int i = 0 ; i < 2 ; i++){
    pushMatrix();
    eyeX = EYE_X_L + i*(EYE_X_R-EYE_X_L);
    translate(eyeX, EYE_Y);
    rotate(atan2(mouseY - EYE_Y, mouseX - eyeX));
    image(eye, 0, 0);
    popMatrix();
  }
  
  for(int i=0 ; i<20; i++) {  
    int scarfX = (i%10)*SCARF_W;
    int scarfY = 600+(i/10)*SCARF_W;
    float distance = constrain(dist(scarfX+SCARF_W/2, scarfY+SCARF_W/2, mouseX, mouseY), 0, SCARF_W);
    float brightness = map(distance, 0, SCARF_W, 30, 100);
    
    if(i%3 == 0) { fill(32, 70, brightness); } 
    else if(i%3 == 1) { fill(218, 80, brightness); } 
    else { fill(216, 60, brightness); }
    
    rect(scarfX, scarfY, SCARF_W, SCARF_W);
  }
    
  image(fly, mouseX, mouseY);
}
