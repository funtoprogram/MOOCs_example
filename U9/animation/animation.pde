int numFrames = 34;
int currentFrame;
PImage [] images = new PImage[numFrames];

void setup(){
  size(300,400);
  currentFrame = 0;
  for (int i=0; i<numFrames; i++){
    images[i] = loadImage("img/dancer-" + (i+1) + ".png");
  }
  frameRate(24);
}

void draw(){
  int i = (currentFrame ++) % numFrames;
  image(images[i], 0, 0);
 
}
