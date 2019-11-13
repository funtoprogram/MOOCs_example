// Learning Processing
// Daniel Shiffman
// http://www.learningprocessing.com

// Example 9-8: A snake following the mouse

// Declare two arrays with 50 elements.
int[] xpos = new int[50]; 
int[] ypos = new int[50];

void setup() {
  size(200,200);  
  smooth();
}

void draw() {
  background(255);
  
  // Shift array values
  for (int i = 0; i < xpos.length-1; i ++ ) {
    /* Shift all elements down one spot. 
       xpos[0] = xpos[1], xpos[1] = xpos = [2], and so on. 
       Stop at the second to last element. */
       
    xpos[i] = xpos[i+1];
    ypos[i] = ypos[i+1];
  }
  
  // New location
  xpos[xpos.length-1] = mouseX; 
  ypos[ypos.length-1] = mouseY;
  
  // Draw everything
  for (int i = 0; i < xpos.length; i ++ ) {
     // Draw an ellipse for each element in the arrays. 
     // Color and size are tied to the loop's counter: i.
    noStroke();
    fill(255-i*5);
    ellipse(xpos[i],ypos[i],i,i);
  }
}
