void setup() {
  size(500, 400);
  background(0, 25, 51);
  stroke(255, 255, 0);
  strokeWeight(6);
  drawLightning(100, 10, 50);
  drawLightning(100, 10, 55);
  drawLightning(200, 10, 100);
  drawLightning(300, 10, 60);
  drawLightning(400, 10, 40);
}

void drawLightning(int x, int y, int numParts) {

  while (numParts > 0) {
    int nextx = x+int(random(-25, 25));
    int nexty = y+400/numParts;
    
    
    line(x, y, nextx, nexty);

    x = nextx;
    y = nexty;

    numParts = numParts - 1;
  }
}
