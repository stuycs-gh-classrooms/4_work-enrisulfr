//All three "graphs" will use these variables
int angle; //The degree angle we will use for sin() and cos() functions.
int dotDiameter; //The size of the circle that will be graphing.

int sinAmplitude;
float sinY;
int circRadius;
int spiralRadius;

int circX;
float circY;

void setup() {
  size(600, 600);
  background(0);
  dotDiameter = 4;
  sinAmplitude = 100;
  circRadius = 100;
  spiralRadius = 100;
  sinY = height/4;
  angle = 0;
  stroke(255);
  
  circX = width/2;
  circY = height/3;
}//setup

void draw() {
  //background(0);
  //sin curve
  drawSinCurve(angle, sinAmplitude, sinAmplitude);
  //circle
  drawCircle(angle, circRadius, width/2, sinAmplitude*2 + circRadius);
  //concentric circles
  drawCircle(angle, spiralRadius, width/2, sinAmplitude*2 + circRadius*3);

  angle++;
  
  println(angle);
}//draw

void drawSinCurve(int degrees, int amplitude, int yOffset) {
  sinY = amplitude * sin( radians (degrees) ) + yOffset;
  fill(0);
  circle(angle, sinY, dotDiameter);
  if (angle % width == 0){
    angle =0;
  } 
}

void drawCircle(int degrees, int radius, int xOffset, int yOffset) {
  circle(angle, circY, dotDiameter);
  circY = (circY + radius)-
  
}
