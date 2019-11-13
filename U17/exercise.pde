int dis_circle= 60;

void setup()
{
  size(480,480);
}

void draw()
{
  background(255);
  fill(204, 102, 0);
  noStroke();
  for(int i = 0; i< 10; i++)
  {
    fill(0, (480.0/abs(mouseX - i*48))*(255/10) , 0);
    rect(i*48, 0, 48, 480);
  }
}
