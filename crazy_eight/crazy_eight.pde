// draw a figure eight on its side
void setup() {
  size(640, 360);
  smooth();
  background(0);
  colorMode(HSB);
  noStroke();
}

void draw(){
  // background(0);
  float t = frameCount * .015;
  float x=255*cos(t)*sqrt(pow(cos(t),2)); // 255 = width
  float y=255*cos(t)*sin(t);              // 255 = height
  fill (frameCount&255,255,255);
  ellipse(x+(width/2), y+(height/2), 32, 32);
  text(cos(t), 15, 15);
  text(sin(t), 15, 30);
}
