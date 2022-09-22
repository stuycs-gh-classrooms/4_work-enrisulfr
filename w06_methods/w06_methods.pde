void drawLogo(int x, int y, int size){
  fill(50);
  arc(x, y, size, size, 0, PI, CHORD);
  fill(0);
  arc(x, y, size, size/3, 0, PI);
  arc(x, y, size, size/4, PI, TWO_PI);
  fill(64);
  rect(x+size*.20, y-size*.55, size*.08, size*.6, 1);
  fill(255, 255, 0);
  triangle(x+size*.20+size*.08, y-size*.55, 
  x+size*.20+size*.08, y-size*0.2, 
  x+size*.20+size*.08+size*.2+size*.08*.5, y-size*.2);
}
void setup(){
  size(400, 400);
  noStroke();
  drawLogo(100, 100, 100);
  drawLogo(320, 220, 110);
  drawLogo(160, 360, 120);
  drawLogo(240, 120, 140);
}
