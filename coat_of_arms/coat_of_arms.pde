boolean drawT = false;
float x, y, z;
int xAxis = 0;
int yAxis = 0;
int direction = 1;
int speed = 1;
float rotateSpeed = 0.05;
void setup() {
  size(700, 600, P3D);
  cursor(CROSS);
  background(230);
  strokeWeight(1);
  x = width/2;
  y = height/2;
  z = 0;
}

void draw() {
  background(230);
  //drawHouse(width/2, height/2, 10, PI/2);
  //drawT();
  //header();
  cursor();
  rotatingSquare();
  //lights();
  //translate(58, 48, 0);
  //sphere(28);

  if ((keyPressed == true) && (key == 'p'))
    noLoop();

  if ((keyPressed == true) && (key == 'o'))
    loop();
}

void cursor() {
  frameRate(5);
  line(mouseX, mouseY, pmouseX, pmouseY);
  println(mouseX + " : " + mouseY);
  ellipse(mouseX, mouseY, 50, 50);
}

void rotatingSquare() {
  translate(x, y, z);
  //rotateX(z*rotateSpeed);
  //rotateZ(z*rotateSpeed);
  rotateY(z*rotateSpeed);
  //rectMode(CENTER);
  rect(xAxis, yAxis, 100, 100);

  if ((keyPressed == true) && (key == 'a')) {  //Adjust Left
    xAxis -= 6;
  }

  if ((keyPressed == true) && (key == 'd')) {  //Adjust Right
    xAxis += 6;
  }

  if ((keyPressed == true) && (key == 'w')) { //Adjust Up
    yAxis -= 6;
  }

  if ((keyPressed == true) && (key == 's')) {  //Adjust Down
    yAxis += 6;
  }

  if (mouseButton == LEFT) {
    fill(0, 255, 255);
  } 
  if (mouseButton == RIGHT) {
    fill(255, 255, 0);
  }
  if (mouseButton == LEFT) {
    direction = -1 ;
  }
  if (mouseButton == RIGHT) {
    direction = 1;
  }
  z = z + direction*speed;
}

void header() {
  if (mouseX < 350) {
    rect(0, 0, 350, 300); // Left
  } else {
    rect(350, 0, 350, 300); // Right
  }
}
void drawT() {
  if (drawT == true) { 
    rect(20, 20, 60, 20);
    rect(39, 40, 22, 45);
  }
}
void keyPressed() {
  if ((key == 'T') || (key == 't')) {
    drawT = true;
  }
}

void keyReleased() {
  drawT = false;
}

void drawHouse(int xcord, int ycord, float scale, float rotate) {
  pushMatrix();
  translate(xcord,ycord);
  beginShape();
  scale(scale);
  rotate(rotate);
  vertex(-10, 0);
  vertex(-10, -10);
  vertex(0, -20);
  vertex(10, -10);
  vertex(10, 0);
  endShape(CLOSE);
  popMatrix();
}
