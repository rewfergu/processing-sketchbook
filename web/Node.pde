class Node {
  int xPos;
  int yPos;
  int size;
  int hitArea;

  Node(int start_x, int start_y, int start_size, int hit_area_bounds) {
    xPos = start_x;
    yPos = start_y;
    size = start_size;
    hitArea = hit_area_bounds;
  }
  
  void display(){
    xPos += random(-2, 3);
    yPos += random(-2, 3);
    ellipse(xPos, yPos, size, size);
  }
  
  void checkBoundary(Node connectionNode) {
    float distance = dist(xPos, yPos, connectionNode.xPos, connectionNode.yPos);
    if (distance < hitArea) {
     stroke(255);
     strokeWeight(1);
     line(xPos, yPos, connectionNode.xPos, connectionNode.yPos);
    }
    // check inside hit area
    // double loops
  }
}
