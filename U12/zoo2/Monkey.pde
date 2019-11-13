class Monkey extends Mammal{

  //1.property
  
  //2.constructor
  Monkey(){
    super("monkey.png");
  }
  
  //3.method
  void climb(){
     y -= 0.5;
     //super.moveTo(10, 10);
  }  
}
