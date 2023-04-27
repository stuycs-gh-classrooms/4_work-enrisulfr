float GRAVITY = 0.4;
int MAX_SIZE  = 50;
int MIN_SIZE = 10;
float MAX_MASS = 10;
float MIN_MASS = 1;
float DAMPENING = 1;//0.996;

float SPRING_CONST = 0.005;
int SPRING_LENGTH = 100;
int NUM_ORBS = 10;

boolean moving;
boolean bounce;

Orb[] orbs;
FixedOrb earth;

void setup() {
  size(600, 600);
  background(255);
  reset();
}//setup

void draw() {
  background(255);
  displayMode();

  if (moving) {
    for (int i=0; i < orbs.length; i++) {
      for (int j=0; j < orbs.length; j++) {
        PVector springForce = orbs[i].getSpring(orbs[j], SPRING_LENGTH, SPRING_CONST);
        orbs[i].applyForce(springForce);
        if (i = orbs.length) {
        j = 0;
        
      drawSpring(orbs[i], orbs[i+1]);
        }
      }//run orbs
      orbs[i].run(bounce, DAMPENING);
      orbs[i].display();
    }//run orbs
    
    //for (int i=0; i < orbs.length; i++) {
    //  orbs[i].run(bounce, DAMPENING);
    //}//run orbs
  }//moving

  //for (int i=0; i < orbs.length; i++) {
  //  orbs[i].display();
  //}//run orbs
}//draw

void drawSpring(Orb o0, Orb o1) {
  line(o0.position.x, o0.position.y, o1.position.x, o1.position.y);
  stroke(0);
  if (dist(o0.position.x, o0.position.y, o1.position.x, o1.position.y) > SPRING_LENGTH) {
    stroke(#294936);
  }//stretched
  if (dist(o0.position.x, o0.position.y, o1.position.x, o1.position.y) > SPRING_LENGTH) {
    stroke(#3E6259);
  }//compressed
  if (dist(o0.position.x, o0.position.y, o1.position.x, o1.position.y) > SPRING_LENGTH) {
    stroke(#5B8266);
  }//neutral
}//drawSpring

void reset() {
  orbs = new Orb[NUM_ORBS];
  for (int i=0; i < orbs.length; i++) {
    orbs[i] = new Orb(int(random(0, width)), int(random(0, height)), 25, 5);
  }//initiate each element in orbs array
  moving = false;
  bounce = false;
}//reset


void keyPressed() {
  if (key == ' ') {
    moving = !moving;
  }
  if (key == 'b') {
    bounce = !bounce;
  }
  if (key == 'r') {
    reset();
  }
}//keyPressed

void displayMode() {
  //initial setup
  color c;
  textAlign(LEFT, TOP);
  textSize(15);
  noStroke();
  //red or green boxes
  c = moving ? color(0, 255, 0) : color(255, 0, 0);
  fill(c);
  rect(0, 0, 53, 20);
  c = bounce ? color(0, 255, 0) : color(255, 0, 0);
  fill(c);
  rect(54, 0, 57, 20);

  stroke(0);
  fill(0);
  text("MOVING", 1, 0);
  text("BOUNCE", 55, 0);
}
