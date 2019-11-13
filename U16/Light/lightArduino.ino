int ledPin = 2;
int incomingByte = 0;

void setup() {
	Serial.begin(9600);
	pinMode(ledPin, OUTPUT);
}

void loop() {
	if (Serial.available() > 0) {
        incomingByte = Serial.read();
    }


    if(incomingByte == 0){
        digitalWrite(ledPin, LOW);    
    }
    else{
    	digitalWrite(ledPin, HIGH);
    }
}
