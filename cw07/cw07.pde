/*======================
  Controls:
  r: create new blocks, reset search
  o: create new blocks in increasing size order, reset search
  any other key: increase searchSize by 1, search for new block
  ======================*/

//constants
int MIN_BLOCK_SIZE = 5;
int NUM_BLOCKS = 50;

//Driver variables
BlockRow blocks;
int searchSize;
int foundBlock;
boolean ordered;
int numLoops;
void setup() {
  size(600, 600);
  background(0);

  searchSize = MIN_BLOCK_SIZE;
  foundBlock = -1;
  ordered = false;

  blocks = new BlockRow(NUM_BLOCKS, ordered);
  blocks.display();
  lookFor(searchSize);
}//setup

void draw() {
  background(0);
  blocks.display();
  displayInfo(searchSize, foundBlock, numLoops);
}//draw

void keyPressed() {
  if (key == 'r') {
    ordered = false;
    blocks.setupBlocks(false);
    reset();
  }//reset
  else if (key == 'o') {
    ordered = true;
    blocks.setupBlocks(true);
    reset();
  }//reset ordered
  else {
    if (foundBlock != -1) {
      blocks.setBlockColor(foundBlock, color(255));
    }//found block reset color
    //int numLoops =
    searchSize = (searchSize+1);
    lookFor(searchSize);
  }//look for next value
}//keyPressed

void lookFor(int targetSize) {
  if (ordered == true) {
    foundBlock = blocks.fastFind(targetSize);
  }//use fastFind
  else{
    foundBlock = blocks.find(targetSize);
  }//use find
  if (foundBlock != -1) {
    blocks.setBlockColor(foundBlock, color(255, 255, 0));
  }
}//lookFor

void reset() {
  if (foundBlock != -1) {
    blocks.setBlockColor(foundBlock, color(255));
  }//change found block color
  searchSize = MIN_BLOCK_SIZE;
  foundBlock = -1;
  lookFor(searchSize);
}//reset

void displayInfo(int targetSize, int foundIndex, int numLoops) {
  fill(255);
  textSize(20);
  textAlign(LEFT, TOP);
  String s = "Looking for size: " + targetSize;
  s+= " Found at: " + foundIndex;
  s+= " # of loops: " + numLoops;
  text(s, 0, 0);
}//displayInfo
