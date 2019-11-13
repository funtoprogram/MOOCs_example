AccelerometerManager accel;
float ax;
int lineHeight = 200;

void setup() {
  accel = new AccelerometerManager(this);
  orientation(PORTRAIT);
  noLoop();
}


void draw() {
  background(0);
  fill(255);
  rect(width/2, (height-lineHeight)/2, - ax * width/ 2 / 10, lineHeight);
}


public void resume() {
  if (accel != null) {
    accel.resume();
  }
}

    
public void pause() {
  if (accel != null) {
    accel.pause();
  }
}

public void accelerationEvent(float x, float y, float z) {
  ax = x;
  redraw();
}
