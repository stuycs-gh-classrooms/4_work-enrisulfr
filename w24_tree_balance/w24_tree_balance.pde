Tree oak;


void setup() {
  size(800, 500);

  oak = new Tree(4, width/2, 50, 100);
  oak.colorCode();
  oak.display(oak.root);
  
  println(oak.getHeight());
}//setup
