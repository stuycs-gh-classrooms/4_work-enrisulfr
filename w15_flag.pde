PImage img;
color tint = color(180, 210, 255);

void setup() {
  size(800, 500);
  img = loadImage("pathogen.png");
  img.resize(800, 500);
  img.loadPixels();
}//setup

void draw() {
  image(img, 0, 0);
  textSize(40);
  text("horrid", 10, 50);
  text("cultivated", 600, 330);
  text("infection", 400, 400);
  textSize(55);
  text("HUMAN PATHOGEN TRANSMISSION", 0, 280);
}//draw
