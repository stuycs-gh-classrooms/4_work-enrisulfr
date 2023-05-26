class Tree {

  TreeNode root;
  PVector position;
  int totalLevels;

  Tree(int numLevels, int x, int y, int density) {
    position = new PVector(x, y);
    totalLevels = numLevels;
    root = makeTree(numLevels, position, density);
  }//constructor

  TreeNode makeTree(int numLevels, PVector p, int density) {
    if (numLevels == 0) {
      return null;
    }//base case
    else {
      char c = char(int(random(26)) + 'A');
      TreeNode tn = new TreeNode(c, p);

      float xoffset = width / (pow(2, totalLevels - numLevels+2));
      PVector leftP = new PVector(p.x + xoffset * -1, p.y + 75);
      PVector rightP = new PVector(p.x + xoffset, p.y + 75);

      if (random(100) < density ) {
        tn.left = makeTree(numLevels-1, leftP, int(density*0.65));
        //tn.left = makeTree(numLevels-1, leftP, density);
      }
      if (random(100) < density) {
        //tn.right = makeTree(numLevels-1, rightP, density);
        tn.right = makeTree(numLevels-1, rightP, int(density*0.65));
      }
      return tn;
    }//make more tree!
  }//makeTree

  String preOrder() {
    return preOrder(root);
  }
  String preOrder(TreeNode tn) {
    String s = "";
    if (tn != null) {
      s += tn.data;
      s += preOrder(tn.left);
      s += preOrder(tn.right);
    }
    return s;
  }//preOrder

  String inOrder() {
    return inOrder(root);
  }
  String inOrder(TreeNode tn) {
    String s = "";
    //int tl = totalLevels;
    if (tn != null) {
      //while (tl != 0)
      s += inOrder(tn.left);
      s += tn.data;
      s += inOrder(tn.right);
    }
    return s;
  }//inOrder

  String postOrder() {
    return postOrder(root);
  }
  String postOrder(TreeNode tn) {
    String s = "";
    if (tn != null) {
      s += postOrder(tn.left);
      s += postOrder(tn.right);
      s += tn.data;
    }
    return s;
  }//postOrder

  int numNodes() {
    return numNodes(root);
  }
  int numNodes(TreeNode current) {
    int n = 0;
    if (current != null) {
      n += 1;
      n += numNodes(current.left);
      n += numNodes(current.right);
    }
    return n;
  }//numNodes
  
  int getHeight() {
    return getHeight(root);
  }
  int getHeight(TreeNode current) {
    int n = 0;
    if (current != null) {
      n += 1;
      if (getHeight(current.left) > getHeight(current.right)) {
        n += getHeight(current.left);
      } else {
        n += getHeight(current.right);
      }
    }
    return n;
  }//getHeight

  boolean isBalanced(TreeNode current) {
    if (abs(getHeight(current.left) - getHeight(current.right)) <= 1) {
      return true;
    }
    return false;
  }//isBalanced

  void colorCode() {
    colorCode(root);
  }
  void colorCode(TreeNode current) {
    if (current != null) {
      if (isBalanced(current)) {
        fill(#FFEF9F);
      } else {
        fill(#FFD6E0);
      }
      colorCode(current.left);
      colorCode(current.right);
    }
  }//colorCode

  void display() {
    display(root);
  }//display wrapper
  void display(TreeNode tn) {
    if (tn != null) {
      tn.display();
      display(tn.left);
      display(tn.right);
    }
  }//display
}//Tree
