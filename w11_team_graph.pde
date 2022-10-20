int dotDiameter;
int angle;
int roseRadius;
int sinAmplitude;
float petalnumber;
float petalsizes;
float petalnumberz;
void setup() {
  size(600, 600);
  background(0);
  dotDiameter = 5;

  roseRadius = 1;
  drawEpilepsyInducingSpiral(angle, sinAmplitude, height/2);
 
 //muy importante parameters
 angle=0;
 petalsizes=100;
 petalnumberz=6;
 sinAmplitude=0;

 
  stroke(255);
}//setup

void draw() {
  //background(0);
  //sin curve
noStroke();

fill (255);

if (petalnumberz % 4 == 2) {
 drawRose(angle, petalnumberz/4, petalsizes);
  angle++;}
 
else if(petalnumberz % 4 == 0) {
 drawRose(angle, petalnumberz/2, petalsizes);
  angle++;}

else if (petalnumberz % 2 == 1) {
  drawRose(angle, petalnumberz, petalsizes);
  angle++;
}
 

drawEpilepsyInducingSpiral(angle, sinAmplitude, height/2);
angle++;
if (angle%5 == 0){
sinAmplitude--;}
 
 
}//draw


     
void drawRose(float degrees, float petalnumber, float size) {
 
float r = size * cos(petalnumber*radians(degrees));
float x = r * cos(radians(degrees));
float y = r * sin(radians(degrees));
   
   circle(x+width/2, y+height/2, dotDiameter);
}

void drawEpilepsyInducingSpiral(int degrees, int amplitude, int yOffset) {
  float x = amplitude * cos(radians(degrees)) + height/2;
  float y = amplitude * sin(radians(degrees)) + yOffset;
  fill(random(255),random(255),random(255));
  circle(x, y, dotDiameter);
