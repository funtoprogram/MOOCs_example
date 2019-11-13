/*
Write the value to the serial port with a push button  using a Maker UNO.
*/

int buttonState = 0;                // set value for buttonState 

void setup() { 
  pinMode(2, INPUT_PULLUP);         // initialize push button 
  Serial.begin(9600);         // Start serial communication at 9600 bps 
} 
 
void loop() {
  buttonState = digitalRead(2);     // read value 
  if (buttonState == HIGH)       
  {
    Serial.write(1);                     // send 1 to Processing
  } else {                               
    Serial.write(0);                     // send 0 to Processing 
  } 
  delay(100);                            // Wait 100 milliseconds 
} 
