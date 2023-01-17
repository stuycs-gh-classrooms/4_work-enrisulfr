class BlockRow {
  Block[] row;

  int numBlocks;
  int minBlockSize;
  int maxBlockSize;

  BlockRow(int nb, boolean orderd) {
    numBlocks = nb;
    minBlockSize = MIN_BLOCK_SIZE;

    row = new Block[numBlocks];
    setupBlocks(ordered);
  }//setup

  void setupBlocks(boolean ordered) {
    maxBlockSize = 0;
    minBlockSize = MIN_BLOCK_SIZE;
    int topSize = 100;
    
    if (ordered) {
      topSize = 10;
    }
    for (int i=0; i < row.length; i++) {
      int bsize = int(random(minBlockSize, topSize));
      if (maxBlockSize < bsize) {
        maxBlockSize = bsize;
      }//keep maxBlockSize up to date
      row[i] = new Block(0, 0, bsize);
      if (ordered) {
        minBlockSize = bsize;
        topSize = minBlockSize+5;
      }//keep thigns ordered
    }//array loop
    rearrange();
  }//setupBlocks

  void rearrange() {
    int x = 5;
    int y = 25;
    int topSize = 0;
    for (int i=0; i < row.length; i++) {
      if (topSize < row[i].sideLength) {
        topSize = row[i].sideLength;
      }//update topSize
      if (x + row[i].sideLength >= width) {
        x = 5;
        y+= topSize + 5;
      }//new row
      row[i].move(x, y);
      x+= row[i].sideLength +2;
    }//array loop
  }//rearrange

  void display() {
    for (int i=0; i < row.length; i++) {
      row[i].display();
    }//array loop
  }//viewBlocks

  void setBlockColor(int i, color c) {
    row[i].inside = c;
  }//resetBlockColor

  int find(int targetSize) {
    numLoops = 0;
    for (int i=0; i < row.length; i++) {
      numLoops++;
      if (row[i].sideLength == targetSize) {
        return i;
      }//found!
    }//array loop
    return -1;
  }//find
  
   int fastFind(int targetSize) {
    //set starting and ending indices
    int start = 0;
    int end = row.length;

    //how can you tell if you've searched
    //the entire array by looking at the values
    //of start and end?
    while (end != start) {
      //find the middle index
      int midi = row.length / 2;
      int midSize = row[midi].sideLength;

      //if midSize is the target, done!
      if (midSize == targetSize) {
        return midi;
      }//found!
      //if midsize is larger, only look at the first half
      else if (midSize > targetSize) {
        start = midi;
      }//check first half

      //if midsize if smaller, only look at second half
      else {
        end = midi;
      }//check second half
    }//still looking

    //didn't find it, return -1
    return -1;
  }//fastFind

}//BlockRow
