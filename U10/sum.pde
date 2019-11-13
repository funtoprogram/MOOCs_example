int sum(int [] numbers){
  int total = 0;
  for (int i = 0; i < numbers.length; i++){
    total += numbers[i];
  }
  return total;
}

void setup(){
  int [] arr = {1,2,3,4,5};
  int total = sum(arr);
  println(total);
  add1(total);
}

void add1( int total){
  println(total+1);
}
