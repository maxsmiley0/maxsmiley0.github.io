//accel slider
void setup() {
  size(1000, 500);
  background(200, 200, 200);
  frameRate(10);
}
int projX0 = 50;
int projY0 = 450;
int velocityX0 = 30;
int velocityY0 = 30;
int accelX0 = 0;
int accelY0 = 2;
int timer = 0;

int projX = projX0;
int projY = projY0;
int velocityX = velocityX0;
int velocityY = velocityY0;
int accelX = accelX0;
int accelY = accelY0;

int state = 0;
boolean accelVector = false;
boolean tracePath  = false;
boolean start = false;

int hlevel = 6;
int mlevel = 6;


void draw() {
  timer++;
  if (tracePath == false){
    fill(200, 200, 200);
    rect(0, 80, 1300, 360);
    rect(0, 80, 900, 1300);
    rect(200, 30, 10000, 60);
  }
  
  if (mousePressed && mouseX > 865 && mouseX < 895 && mouseY > 465 && mouseY < 495){
    start = false;
    state = 0;
    projX = projX0;
    projY = projY0;
    velocityX = velocityX0;
    velocityY = velocityY0;
    fill(200);
    rect(0, 80, 1000, 1000);
    rect(100, 0, 1000, 300);
    rect(0, 100, 1000, 1000);
  }

  noStroke();
  fill(255, 0, 0);
  ellipse(projX, projY, 10, 10);

  strokeWeight(1);
  stroke(0, 0, 0);
  noFill();
  rect(10, 10, 20, 20);
  noStroke();
  fill(200, 200, 200);
  rect(31, 10, 200, 30);
  fill(255, 0, 0);
  textSize(15);
  text("Show acceleration vector", 37, 23);
  
  fill(200, 200, 200);
  rect(31, 30, 200, 30);
  fill(255, 0, 0);
  textSize(15);
  noFill();
  stroke(0, 0, 0);
  rect(10, 40, 20, 20);
  text("Trace projectile path", 37, 53);
  
  if (tracePath) {
     vectors();
  }
  physics();

  if (mousePressed && mouseX > 10 && mouseX < 30 && mouseY > 10 && mouseY < 30) {
    if (accelVector){
      stroke(0, 0, 0);
      strokeWeight(1);
      fill(200, 200, 200);
      rect(10, 10, 20, 20);
      accelVector = false;
    }
    else{
      strokeWeight(1);
      stroke(0, 0, 0);
      fill(0, 0, 0);
      rect(10, 10, 20, 20);
      accelVector = true;
    }
  }
  
  if (mousePressed && mouseX > 10 && mouseX < 30 && mouseY > 40 && mouseY < 60) {
    if (tracePath){
      strokeWeight(1);
      stroke(0, 0, 0);
      fill(200, 200, 200);
      rect(10, 40, 20, 20);
      tracePath = false;
    }
    else{
      strokeWeight(1);
      stroke(0, 0, 0);
      fill(0, 0, 0);
      rect(10, 40, 20, 20);
      tracePath = true;
    }
  }
  
  if (state == 0) {
    noStroke();
    fill(255, 255, 255);
    rect(900, 440, 111, 71);
    textSize(30);
    fill(50, 50, 100);
    text("Start", 915, 480);
  }
  noStroke();
  fill(255, 255, 255);
  rect(860, 460, 40, 60);
  fill(255, 0, 0);
  strokeWeight(2);
  stroke(0,0,0);
  rect(865, 465, 30, 30);

  if (mousePressed && mouseX > 900 && mouseY > 440 && timer > 2) {
    if (start == false) {
      start = true;
      state = 1;
      noStroke();
      fill(255, 255, 255);
      rect(900, 440, 111, 71);
      fill(50, 50, 100);
      rect(935, 452, 10, 40);
      rect(955, 452, 10, 40);
    } else {
      start = false;
      state = 2;
      noStroke();
      fill(255, 255, 255);
      rect(900, 440, 111, 71);
      fill(50, 50, 100);
      triangle(935, 490, 975, 470, 935, 450);
    }
  timer = 0;
  }
  noStroke();
  fill(200, 200, 200);
  rect(0, 470, 860, 1300);

  coordinates();
  sliders();
  
  velocityX = hlevel*5;
  velocityY0 = mlevel*5;
  fill(0, 0, 0);
  rect(153, 478, 15*hlevel, 15);
  rect(440, 478, 15*mlevel, 15);
}

void physics() {
  if (start) {
    projX += velocityX;
    projY -= velocityY;

    velocityX += accelX;
    velocityY -= accelY;
  }
}
void vectors() {
  stroke(0, 0, 0);
  strokeWeight(5);
  line(projX, projY, projX + velocityX, projY - velocityY);

  if (accelVector) {
    strokeWeight(4);
    stroke(255, 0, 0);
    line(projX, projY, projX + accelX*20, projY + accelY*20 - 5);
  }
}

void coordinates() {
  fill(200, 200, 200);
  noStroke();
  rect(240, 0, 10000, 30);
  textSize(20);
  fill(0, 0, 0);
  text("X: " + projX + ", Y: " + -1*(projY - 500), 240, 24);
  text("Horizontal Velocity: " + velocityX + ", Vertical Velocity: " + velocityY, 500, 24);
}
void sliders() {
  textSize(15);
  text("Horizontal Velocity ", 10, 490);
  text("Vertical Velocity", 320, 490);
  fill(200, 200, 200);
  strokeWeight(1);
  stroke(0, 0, 0);
  
  rect(153, 478, 150, 15);
  rect(440, 478, 150, 15);
  noStroke();
  
  if (mousePressed && mouseY > 478 && mouseY < 493){
    if (mouseX > 154 && mouseX < 168){
      hlevel = 1;
    }
    else if (mouseX > 168 && mouseX < 183){
      hlevel = 2;
    }
    else if (mouseX > 183 && mouseX < 198){
      hlevel = 3;
    }
    else if (mouseX > 198 && mouseX < 213){
      hlevel = 4;
    }
    else if (mouseX > 213 && mouseX < 228){
      hlevel = 5;
    }
    else if (mouseX > 228 && mouseX < 243){
      hlevel = 6;
    }
    else if (mouseX > 243 && mouseX < 258){
      hlevel = 7;
    }
    else if (mouseX > 258 && mouseX < 273){
      hlevel = 8;
    }
    else if (mouseX > 273 && mouseX < 288){
      hlevel = 9;
    }
    else if (mouseX > 288 && mouseX < 303){
      hlevel = 10;
    }
    //mlevel subdiv
    else if (mouseX > 440 && mouseX < 455){
      mlevel = 1;
      start = false;
      state = 0;
      projX = projX0;
      projY = projY0;
      velocityX = velocityX0;
      velocityY = velocityY0;
      accelX = accelX0;
      accelY = accelY0;
    }
    else if (mouseX > 455 && mouseX < 470){
      mlevel = 2;
      start = false;
      state = 0;
      projX = projX0;
      projY = projY0;
      velocityX = velocityX0;
      velocityY = velocityY0;
      accelX = accelX0;
      accelY = accelY0;
    }
    else if (mouseX > 470 && mouseX < 486){
      mlevel = 3;
      start = false;
      state = 0;
      projX = projX0;
      projY = projY0;
      velocityX = velocityX0;
      velocityY = velocityY0;
      accelX = accelX0;
      accelY = accelY0;
    }
    else if (mouseX > 485 && mouseX < 500){
      mlevel = 4;
      start = false;
      state = 0;
      projX = projX0;
      projY = projY0;
      velocityX = velocityX0;
      velocityY = velocityY0;
      accelX = accelX0;
      accelY = accelY0;
    }
    else if (mouseX > 500 && mouseX < 515){
      mlevel = 5;
      start = false;
      state = 0;
      projX = projX0;
      projY = projY0;
      velocityX = velocityX0;
      velocityY = velocityY0;
      accelX = accelX0;
      accelY = accelY0;
    }
    else if (mouseX > 515 && mouseX < 530){
      mlevel = 6;
      start = false;
      state = 0;
      projX = projX0;
      projY = projY0;
      velocityX = velocityX0;
      velocityY = velocityY0;
      accelX = accelX0;
      accelY = accelY0;
    }
    else if (mouseX > 530 && mouseX < 545){
      mlevel = 7;
      start = false;
      state = 0;
      projX = projX0;
      projY = projY0;
      velocityX = velocityX0;
      velocityY = velocityY0;
      accelX = accelX0;
      accelY = accelY0;
    }
    else if (mouseX > 545 && mouseX < 560){
      mlevel = 8;
      start = false;
      state = 0;
      projX = projX0;
      projY = projY0;
      velocityX = velocityX0;
      velocityY = velocityY0;
      accelX = accelX0;
      accelY = accelY0;
    }
    else if (mouseX > 560 && mouseX < 575){
      mlevel = 9;
      start = false;
      state = 0;
      projX = projX0;
      projY = projY0;
      velocityX = velocityX0;
      velocityY = velocityY0;
      accelX = accelX0;
      accelY = accelY0;
    }
    else if (mouseX > 575 && mouseX < 590){
      mlevel = 10;
      start = false;
      state = 0;
      projX = projX0;
      projY = projY0;
      velocityX = velocityX0;
      velocityY = velocityY0;
      accelX = accelX0;
      accelY = accelY0;
    }   
  }
}