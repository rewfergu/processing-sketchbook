// vars
int width = 800;
int height = 600;
int gridSize = 25;
int cols = width / gridSize;
int rows = height / gridSize;
Node[] nodes = new Node[cols*rows];

void setup() {
   size(800, 600);
   ellipseMode(CENTER);
   noiseDetail(100);
   int i = 0;
   for (int j = 0; j < rows; j++) {
    for (int k = 0; k < cols; k++) {
      // set grid
      int xPos = (k*gridSize) + gridSize/2;
      int yPos = (j*gridSize) + gridSize/2;
      
      // alter grid with noise
      xPos *= random(1, 2);
      yPos *= random(1 , 2);
      
      println(xPos);
      nodes[i] = new Node(xPos, yPos, int(random(2,15)), gridSize*2);
      i++;
    }
   }
   
   background(0);
   fill(255);
   noStroke();
}

void draw() {
  background(0);
  // draw points
  for (int i = 0; i < cols*rows; i++) {
   nodes[i].display();
  }
  
  // draw lines
  for (int i = 0; i < cols*rows; i++) {
    for (int j = i; j < cols*rows; j++) {
      nodes[i].checkBoundary(nodes[j]);
    }
  }
}