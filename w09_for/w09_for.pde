int radius; 
int lineCount;
int circleCount;

void setup() {
  size(600, 400);
  
  radius = 25;
  lineCount = 5;
  circleCount = 6;
  
  drawGrid(lineCount);
  circleRow(radius, height/2, circleCount, radius*2);
}

void drawGrid(int numLines) {
  int spacingX = width/(numLines+1);
  int spacingY = height/(numLines+1);
  int startX = spacingX;
  int startY = spacingY;
  
  for (int count = 0; count < numLines; count++) {
    line(startX, 0, startX, height);
    line(0, startY, width, startY);
    startX += spacingX;
    startY += spacingY;
  }
}

void circleRow(int startX, int startY, int numCircles, int d) {
  for (int count = 0; count < numCircles; count++) {
    circle(startX, startY, d);
    startX+= d;
  }
}
