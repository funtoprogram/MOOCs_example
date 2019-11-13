float triangleArea(float base, float height){
  return (base*height/2);
}

void setup(){
  float area = triangleArea(6,5);
  println(area);
}
