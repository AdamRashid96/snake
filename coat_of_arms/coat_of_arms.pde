int gameScreen = 0;
float xAxis = 10;
float yAxis = 10;
float xdirection = 0;
float ydirection = 0;
float speed = 3;
float difficulty = 1;
int score = 0;
int highscore = 0;
float appleX = random(10, 690);
float appleY = random(10, 590);
void setup() {
  size(700, 600);
  cursor(CROSS);
  background(230);
}
void draw() {
  if (gameScreen == 0) {
    initScreen();
  } else if (gameScreen == 1) {
    gameScreen();
  } else if (gameScreen == 2) {
    gameOverScreen();
  }
}

void initScreen() {
  background(255);
  textAlign(CENTER);
  fill(52, 73, 94);
  textSize(70);
  text("Snake: Remix", width/2, height/2);
  textSize(15); 
  text("Easy", width/2 - 200, height-30);
  text("Medium", width/2, height-30);
  text("Hard", width/2 + 200, height-30);

  if (mouseX > width/2 - 240 && mouseX < width/2 - 160 && mouseY > height- 50 && mouseY < height) {
    if (mousePressed) {
      difficulty = 0.5;
      println("Easy Mode");
      println(difficulty);
      startGame();
    } else {
      cursor(HAND);
    }
  } else {
    cursor(CROSS);
  }

  if (mouseX > width/2 - 40 && mouseX < width/2 + 40 && mouseY > height- 50 && mouseY < height) {
    if (mousePressed) {
      difficulty = 1;
      println("Medium Mode");
      println(difficulty);
      startGame();
    } else {
      cursor(HAND);
    }
  } else {
    cursor(CROSS);
  }

  if (mouseX > width/2 + 160 && mouseX < width/2 + 240 && mouseY > height- 50 && mouseY < height) {
    if (mousePressed) {
      difficulty = 1.5;
      println("Hard Mode");
      println(difficulty);
      startGame();
    } else {
      cursor(HAND);
    }
  } else {
    cursor(CROSS);
  }
}
void gameScreen() {
  noCursor();
  background(255);
  border();
  apple();
  square();
  movingSquare();
  checkApple();

  if (xAxis > width - 20 || xAxis < 0) {
    gameOver();
  }
  if (yAxis > height - 20 || yAxis < 0) {
    gameOver();
  }
}

void gameOverScreen() {
  cursor(ARROW);
  background(255);
  textAlign(CENTER);
  fill(52, 73, 94);
  if (score > highscore) {
    highscore = score;
  }
  text("Your Score", width/2, height/2 - 120);
  textSize(130);
  text(score, width/2, height/2);
  textSize(12);
  text("Highscore:", width/2, height/2 - 200);
  text(highscore, width/2 + 40, height/2 - 200);
  textSize(15);
  text("Click to Restart", width/2, height-30);
  textSize(12);
  text("Return to home >", 60, 15);
  
  if (mouseX > 0 && mouseX < 100 && mouseY > 0 && mouseY < 30) {
    if (mousePressed) {
      returnHome();
    } else {
      cursor(HAND);
    }
  } else {
    cursor(ARROW);
  }
  
  if (mousePressed == true && (mouseX > 100 && mouseY > 30))
    restart();
}

void startGame() {
  gameScreen=1;
}
void square() {
  fill(256, 0, 0);
  rect(xAxis, yAxis, 20, 20);
}
void movingSquare() {
  if ((keyPressed == true) && (key == 'a')) {  //Adjust Left
    xdirection =  -1;
    ydirection =  0;
  }

  if ((keyPressed == true) && (key == 'd')) {  //Adjust Right
    xdirection =  1;
    ydirection =  0;
  }

  if ((keyPressed == true) && (key == 'w')) { //Adjust Up
    ydirection =  -1;
    xdirection =  0;
  }

  if ((keyPressed == true) && (key == 's')) {  //Adjust Down
    ydirection =  1;
    xdirection =  0;
  }
  xAxis += xdirection*speed;
  yAxis += ydirection*speed;
}

void apple() {
  fill(51, 255, 51);
  ellipse(appleX, appleY, 15, 15);
}

void collectApple() {
  appleX = random(10, 690);
  appleY = random(10, 590);
  speed = speed + (1 * difficulty);
  score ++;
}

void checkApple() {
  if (dist(xAxis, yAxis, appleX, appleY) <= 20) {
    collectApple();
  }
}

void border() {
  strokeWeight(4);
  line(0, 0, width, 0);
  line(0, 0, 0, height);
  line(width, 0, width, height);
  line(0, height, width, height);
}

void gameOver() {
  gameScreen = 2;
}

void restart() {
  xAxis = 10;
  yAxis = 10;
  xdirection = 0;
  ydirection = 0;
  appleX = random(10, 690);
  appleY = random(10, 590);
  speed = 3;
  score = 0;
  gameScreen = 1;
}

void returnHome(){
  restart();
  gameScreen = 0;
}
