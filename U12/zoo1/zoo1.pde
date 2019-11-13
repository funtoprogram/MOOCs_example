Mammal tiger;
Mammal dog;
Car truck;

void setup(){
  size(400,400); 
  tiger = new Mammal("tiger.png");
  dog = new Mammal("dog.png");
  truck = new Car();
  truck.setDriver(tiger);

}

void draw(){
  background(255);
  truck.speed = 1;
  truck.forward();
  truck.display();
}
