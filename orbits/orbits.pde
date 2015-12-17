int gridBlock = 50;
int x = gridBlock/2;
int y = 0;
int px = gridBlock/2;
int py = 0;
int translate_x = 250;
int translate_y = 250;
int angle;
int angleOffset = 0;
int flipFlop = 1;

int currentPath = 3;
// 0 = up
// 1 = right
// 2 = down
// 3 = left

int previousAnchor = 0;
// 0 = topleft
// 1 = topright
// 2 = bottomright
// 3 = bottomleft

int[] updown = {0, 2};
int[] leftright = {1, 3};

int[] currentRotation = {1, -1}; // 1 = clockwise, -1 = counterclockwise

void setup() {
  size(800, 600, P2D);
  background(250);
  ellipseMode(CENTER);
  noStroke();
  println("topleft cw");
  frameRate(60);
}

void draw() {
  fill(255,255,255,4);
  rect(-10,-10,width + 10,height+10);
  fill(0);
  angle = (( frameCount * 5 )%90);

  // angle reset
  if (angle == 0) {

    // up
    //*********************
    if (currentPath == 0) {

      // set random rotation
      if (translate_x == width - gridBlock) {
        flipFlop = -1;
      } else if (translate_x == 0 + gridBlock) {
        flipFlop = 1;
      } else {
        flipFlop = currentRotation[int(random(2))];
      }

      // clockwise
      if (flipFlop == 1) {

        //bottomright cw
        //*********************
        x = -gridBlock/2;
        y = 0;
        if (previousAnchor == 0) {
          translate_x += gridBlock;
          translate_y += 0;
        } else if (previousAnchor == 1) {
          translate_x += 0;
          translate_y += 0;
        }
        previousAnchor = 2;
        currentPath = 1;
        println("bottomright cw");

      // counter clockwise
      } else  {

       //bottomleft acw
       //*********************
        x = gridBlock/2;
        y = 0;
        if (previousAnchor == 0) {
          translate_x += 0;
          translate_y += 0;
        } else if (previousAnchor == 1) {
          translate_x += -gridBlock;
          translate_y += 0;
        }
        previousAnchor = 3;
        currentPath = 3;
        println("bottomleft acw");

       }

    // right
    //*********************
    } else if (currentPath == 1) {

      // set random rotation
      if (translate_y == height - gridBlock) {
        flipFlop = -1;
      } else if (translate_y == 0 + gridBlock) {
        flipFlop = 1;
      } else {
        flipFlop = currentRotation[int(random(2))];
      }

      if (flipFlop == 1) {

       //bottomleft cw
       //*********************
       x = 0;
       y = -gridBlock/2;
       if (previousAnchor == 1) {
         translate_x += 0;
         translate_y += gridBlock;
       } else if (previousAnchor == 2) {
         translate_x += 0;
         translate_y += 0;
       }
       previousAnchor = 3;
       currentPath = 2;
       println("bottomleft cw");

      } else {

       //topleft acw
       //*********************
       x = 0;
       y = gridBlock/2;
       if (previousAnchor == 1) {
         translate_x += 0;
         translate_y += 0;
       } else if (previousAnchor == 2) {
         translate_x += 0;
         translate_y += -gridBlock;
       }
       previousAnchor = 0;
       currentPath = 0;
       println("topleft acw");

      }

    // down
    //*********************
    } else if (currentPath == 2) {

      // set random rotation
      if (translate_x == width - gridBlock) {
        flipFlop = 1;
      } else if (translate_x == 0 + gridBlock) {
        flipFlop = -1;
      } else {
        flipFlop = currentRotation[int(random(2))];
      }

      if (flipFlop == 1) {

        //topleft cw
        //*********************
        x = gridBlock/2;
        y = 0;
        if (previousAnchor == 2) {
          translate_x += -gridBlock;
          translate_y += 0;
        } else if (previousAnchor == 3) {
          translate_x += 0;
          translate_y += 0;
        }
        previousAnchor = 0;
        currentPath = 3;
        println("topleft cw");

      } else {

        //topright acw
        //*********************
        x = -gridBlock/2;
        y = 0;
        if (previousAnchor == 2) {
          translate_x += 0;
          translate_y += 0;
        } else if (previousAnchor == 3) {
          translate_x += gridBlock;
          translate_y += 0;
        }
        previousAnchor = 1;
        currentPath = 1;
        println("topright acw");

      }

    // left
    //*********************
    } else {

      // set random rotation
      if (translate_y == height - gridBlock) {
        flipFlop = 1;
      } else if (translate_y == 0 + gridBlock) {
        flipFlop = -1;
      } else {
        flipFlop = currentRotation[int(random(2))];
      }

      if (flipFlop == 1) {

        //topright cw
        //*********************
        x = 0;
        y = gridBlock/2;
        if (previousAnchor == 0) {
          translate_x += 0;
          translate_y += 0;
        } else if (previousAnchor == 3) {
          translate_x += 0;
          translate_y += -gridBlock;
        }
        previousAnchor = 1;
        currentPath = 0;
        println("topright cw");

      } else {

        //bottomright acw
        //*********************
        x = 0;
        y = -gridBlock/2;
        if (previousAnchor == 0) {
          translate_x += 0;
          translate_y += gridBlock;
        } else if (previousAnchor == 3) {
          translate_x += 0;
          translate_y += 0;
        }
        previousAnchor = 2;
        currentPath = 2;
        println("bottomright acw");


      }
    }
  } // end angle

  //pushMatrix();
  translate(translate_x, translate_y);
  fill(230);
  ellipse(0, 0, 35, 35);
  rotate(radians((angle + angleOffset) * flipFlop));
  fill(0);
  ellipse(x, y, 6, 6);
  fill(250,0,0);
  //popMatrix();

  //saveFrame("render/frames/######.png");
}