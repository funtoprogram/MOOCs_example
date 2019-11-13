var dis_circle= 60;

function setup()
{
  createCanvas(480, 480);
}

function draw()
{
  background(255);
  fill(204, 102, 0);
  noStroke();
  for(var i = 0; i< 10; i++)
  {
    fill(0, (480.0/abs(mouseX - i*48))*(255/10) , 0);
    rect(i*48, 0, 48, 480);
  }

  console.log("hello world");
}
