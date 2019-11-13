import processing.serial.*;

Serial myPort;
int val;
String readString;

void setup() {
	size(200, 200);
	printArray(Serial.list());
	String portName = Serial.list()[1];
	println("portName: "+portName);
	myPort = new Serial(this, portName, 9600);
}

void draw()
{
  if (mousePressed) {
    myPort.write(1);
    fill(255);
    rect(0, 0, width, height);
  }
  else {
    myPort.write(0);
    fill(0);
    rect(0, 0, width, height);
  }
}
