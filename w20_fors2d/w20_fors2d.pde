//State variable constants
int DIRT = 0;
int FIRE = 1;
int BURNT = 2;
int GRASS = 3;

//Helpful color values
color DIRT_COLOR = #81582F;
color FIRE_COLOR = #F20C0C;
color BURNT_COLOR = #810707;
color GRASS_COLOR = #49B90D;

//Driver variables
boolean burning = false;
float grassDensity = 75;
int numTracts = 10;
int tractLength = 20;
Land[][] grid;


void setup() {
  size(700, 350);
  frameRate(5);
  grid = new Land[numTracts][tractLength];
  //for (int r=0; r < grid.length; r++) {
  //  for (int i=0; i < grid[r].length; i++) {
      setupLand(grid, numTracts, tractLength, grassDensity);
  //  }
  //}
  //for (int r=0; r < grid.length; r++) {
  //  for (int i=0; i < grid[r].length; i++) {
      showLand(grid);
      //grid[r][i].display();
  //  }
  //}
}//setup

void draw() {
  //for (int r=0; r < grid.length; r++) {
  //  for (int i=0; i < grid[r].length; i++) {
      showLand(grid);
      //grid[r][i].display();
  //  }
  //}
  if (burning) {
    //for (int r=0; r < grid.length; r++) {
    //  for (int i=0; i < grid[r].length; i++) {
      liveFire(grid);
    //}
    //}
  }//burning
}//draw


void setupLand(Land[][] field, int numRows, int numPlots, float density) {
  //figure out size of each plot of land
  int plotSize = width/numPlots;

  //instantiate each Land object
  for (int r=0; r<field.length; r++) {
    for (int i=0; i<field[r].length; i++) {
      int type = DIRT;
 
      //first Land object should be FIRE
      if (i == 0) {
        type = FIRE;
      }//start with fire
 
      //Chance for grass is based on density
      else if (random(100) < density) {
        type = GRASS;
      }//grass land
 
      //creates a new land at (x, y) with size plotSize and type
      field[r][i] = new Land(i*plotSize, r*plotSize, plotSize, type);
      }//setup loop
  }//for
}//setupLand

void showLand(Land[][] field) {
  for (int r=0; r < grid.length; r++) {
    for (int i=0; i < grid[r].length; i++) {
      field[r][i].display();
    }//for1
  }//for2
}//showLand


void liveFire(Land[][] field) {
  //First, check Land objects to the left, apply state change rules.
  //Assume nothing useful to the left of row[0]
  field[0][0].updateNextState(0);
  for (int r=1; r<field.length; r++) {
    for (int i=1; i<field[r].length; i++) {
      field[r][i].updateNextState(field[r][i-1].state);
    }//set nextStates for all plots
  }//for

  //Based on potential state changes from updateNextState
  for (int r=1; r<field.length; r++) {
    for (int i=1; i<field[r].length; i++) {
      field[r][i].changeState();
    }//change states
  }//for
}//liveFire





void keyPressed() {
  if (key == ' ') {
    burning = !burning;
  }//start burning
  else if (key == 'r') {
    burning = false;
    for (int r=0; r < grid.length; r++) {
      for (int i=0; i < grid[r].length; i++) {
        setupLand(grid, numTracts, tractLength, grassDensity);
      }//for1
    }//for2
  }
}
