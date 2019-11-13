int spacing = 1; //<>//

void setup() {
  size(400,300);  
  colorMode(HSB);
}

void draw() {
  background(0);
  
  for(float x=0; x<mouseX; x+=spacing){
     
    float hue = x/width * 255;
    noStroke();
    println(hue);
    fill(hue, 255, 255);
    rect(x, 0, spacing, height);
  }
}
