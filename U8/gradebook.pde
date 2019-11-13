int [] gradeBook = {60,85,95,82,68};
float sum, average, max;

size(100,100);
sum = 0;
max = 0;

for (int i=0; i<gradeBook.length; i++){
   
  float x = gradeBook[i];
  float y = map(i, 0, gradeBook.length, 0, height);
  println("student "+ (i+1) + ": "+ gradeBook[i]);
  rect(0, y, x, height/gradeBook.length);

  sum+= x;

  if (x > max) {
     max = x;
  }

}

average = sum/gradeBook.length;
stroke(255,0,0);
line(average, 0, average, height);
println("max:" + max);
