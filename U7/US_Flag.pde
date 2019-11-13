color blueColor  = #3C3B6E;
color whiteColor = #FFFFFF;
color redColor   = #B22234;

void setup(){  
  size(494,260); 
  noStroke();
}
void draw(){

  
  int  nbrStripes = 13;
  final float A = height;
  final float B = width;    
  final float C = A * 7/13;
  final float D = B * 2/5;
  final float E = C/10;
  final float F = E;
  final float G = D/12;
  final float H = G;
  final float K = A * 0.0616;
  final float L = A / nbrStripes;
  
  background(whiteColor);

  // stripes
  fill(redColor);
  for (int i=0; i<nbrStripes; i+=2) {
    rect(0, L*i, width, L);
  }
  
  // blue union
  fill(blueColor);
  rect(0, 0, D, C);

  fill(whiteColor);
  
  // outer stars
  for (int row=0; row<5; row++){
    for (int col=0; col<6; col++){    
       float x = G + (2*H*col);
       float y = E + (2*F*row);
       drawStar(5, x, y, K, 2);
    }
  }
  
  // inner stars
  for (int row=0; row<4; row++){
    for (int col=0; col<5; col++){    
      float x = G+H + (2*H*col);
      float y = E+F + (2*E*row);
      drawStar(5, x, y, K, 2);
   }
  }

}  

// function to draw a star
void drawStar(int nbrPoints, float cx, float cy, float odiam, int skipPoints )
{
  float orad = odiam / 2.0;

  pushMatrix();
  translate(cx, cy);
  rotate(-PI/2); // Point upwards  

  float  a = TWO_PI / nbrPoints;

  beginShape();
  int  n = 0;
  for (int i = 0; i < nbrPoints; ++i) {
    vertex( cos( a * n) * orad, sin( a * n) * orad);
    n += skipPoints;
  }
  endShape(CLOSE);
  popMatrix();
}
