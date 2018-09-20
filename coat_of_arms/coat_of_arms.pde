float x,y,z;
int direction = 1;
int speed = 4;
void setup() {
  size(700, 600, P3D);
  background(230);
  x = width/2;
  y = height/2;
  z = 0;
}

void draw() {
  background(230);
  translate(x,y,z);
  rotateY(z);
  rectMode(CENTER);
  rect(0,0,100,100);
  
  if (z > 400 && direction > 0) {
    direction = -1 ;
  }
  if (z < -400 && direction < 0){
    direction = 1;
  }
  z = z + direction*speed;
  
}
