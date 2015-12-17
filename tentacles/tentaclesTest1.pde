int numSegments = 50;
float[] x = new float[numSegments];
float[] y = new float[numSegments];
float[] angle = new float[numSegments];
float segLength = 12;
float targetX, targetY;

float ballX = 50;
float ballY = 50;
int ballXDirection = 1;
int ballYDirection = -1;

void setup() {
  size(1024, 768);
  strokeWeight(10.0);
  stroke(255, 100);
  noFill();
  x[x.length-1] = 0; //width/2;     // Set base x-coordinate
  y[x.length-1] = 0; //height-150;  // Set base y-coordinate
}

void draw() {
  background(0);
  
  
  float t = frameCount * .025;
  float tempX=200*cos(t)*sqrt(pow(cos(t),2)); // width
  float tempY=200*cos(t)*sin(t);              // height
  ballY = tempX;
  ballX = tempY+200;
  
  
  for(int j = 0; j < 8; j++){
    pushMatrix();
    translate((width/2), (height/2));
    rotate(radians((45*j)));
    //translate(200,0);
    
    
    //ellipse(ballX, ballY, 15, 15);
  
    reachSegment(0, ballX, ballY);
    for(int i=1; i<numSegments; i++) {
      reachSegment(i, targetX, targetY);
    }
    for(int i=x.length-1; i>=1; i--) {
      positionSegment(i, i-1);  
    } 
    for(int i=0; i<x.length; i++) {
      stroke(255, 100-(2*i));
      segment(x[i], y[i], angle[i], (i+1)*2); 
    }
    
    popMatrix();
  }
  
  
}

void positionSegment(int a, int b) {
  x[b] = x[a] + cos(angle[a]) * segLength;
  y[b] = y[a] + sin(angle[a]) * segLength; 
}

void reachSegment(int i, float xin, float yin) {
  float dx = xin - x[i];
  float dy = yin - y[i];
  angle[i] = atan2(dy, dx);  
  targetX = xin - cos(angle[i]) * segLength;
  targetY = yin - sin(angle[i]) * segLength;
}

void segment(float x, float y, float a, float sw) {
  strokeWeight(sw);
  pushMatrix();
  translate(x, y);
  rotate(a);
  line(0, 0, segLength, 0);
  popMatrix();
}
