void setup () {
  int floor = height - 130;
  size ( 800, 800);
  background (0);
  noStroke ();

  fill (#746746);
  int x = 650;
  int y = 50;
  int count = 0;
  rect( 600, 400, 100, height);
  while (count < 8) {
    fill ( #63816F);
    triangle (650, y, x - 25 * count, y + 100, x + 25 * count, y + 100);
    y +=  50;
    count ++;
  }//while


  fill (#63816F);
  rect (0, height - 50, width, 50);
  fill(255);
  rect (0, height -100, width, 80);
  snow (height - 100, 10);
  snow (height - 20, 10); //floor

  fill (#F5EC8A);
  circle (200, 200, 200);
  fill (0);
  circle (250, 150, 150);// moon

  snowman (500, floor, 50, #D1284F);
  snowman (100, floor, 90, #6C9868 );
  snowman (300, floor, 100, #756898);

 
  int snowX = 0;
  int snowY = 0;

  while (snowY < floor) {
    fill (255);
    circle (snowX, snowY, 5);
    snowX += 20;
    if (snowX > width) {
      snowY += 20;
      snowX -= width + 7;
    }
  }//rect

  fill (#F5A123);
  triangle (300, floor - 75, 290, floor - 125, 310, floor - 125);
  fill (0);
  circle (280, floor - 140, 10);
  circle (320, floor - 140, 10); //face of purple

  fill(255);
  stroke(0);
  strokeWeight(4);
  arc(100, floor - 120, 20, 20, radians(20), radians(160), OPEN); //mouth
  fill(0);
  stroke(255);
  strokeWeight(2);
  circle(75, floor - 125, 10);
  circle(125, floor - 125, 10); //face of green
 
   fill(255);
  stroke(0);
  strokeWeight(6);
  circle(480, floor - 60, 10);
  circle(510, floor - 80, 10);
  strokeWeight(3);
  arc(506, floor - 55, 20, 20, radians(-45), radians(160), CHORD);
  fill(#ff0000);
  noStroke();
  circle(497, floor - 49, 7);
  circle(498, floor - 45, 7);
  circle(496, floor - 42, 7);
  circle(517, floor - 55, 7);
  circle(518, floor - 49, 7);
  circle(516, floor - 42, 7);// face of red

 
}//setup

void snow (int y, int d) {
  fill (255);
  noStroke();
  int x = 0;
  while (x < width) {
    circle (x, y, d);
    x += d;
  }
}

void snowman (int x, int y, int radius, color c) {
  fill (255);
  circle (x, y, radius * 2);
  circle (x, y - (radius* 1.25), radius * 1.5);
  buttons (x, y, radius);

  fill (c);
  arc (x, y - radius * 0.75, radius * 1.25, 20, radians (340), radians (560));
 
   rect (x + radius * 0.55, y - radius * 0.75, 10,  radius);
 
}// snowman

void buttons (int x, int y, int radius){
  int count = 0;
  while (count < 4){
    fill (0);
    circle (x, y - radius * 0.4, radius * 0.2);
    y += radius * 0.4;
    count ++;
  }
}
