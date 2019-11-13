void setup(){
  size(600, 400);
}

void draw(){
  background(255);
  fill(#4AB8D7);
  
  if(mouseX < width*1/3){
    rect(0, 0, width/3, height);
  }else if(mouseX < width*2/3){
    rect(width/3, 0, width/3, height);
  }else{
    rect(width*2/3, 0, width/3, height);
  }
  
  //dividing line
  line(width/3, 0, width/3, height);
  line(width*2/3, 0, width*2/3, height);
}
