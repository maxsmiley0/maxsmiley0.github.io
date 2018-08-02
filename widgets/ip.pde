void setup(){
  size(800, 600);
  textSize(15);
  frameRate(30);
}

int rampHeight = 0;
int rampLength = 600;
int rH = 100;
int rL = 150;
float angle = atan2(rampHeight, rampLength);
int rectSize = 50;
int distance = 0;
int friction = 0;
float acceleration = 30*sin(angle)*(200 - friction)/200;
int dX, dY, velocity;
boolean start = false;
boolean aL = false;
boolean aH = false;
boolean aF = false;
int timer = 0;
float f;
double rga;
double rfa;
double rna;
float time;

void draw(){
  textSize(15);
  angle = atan2(rampHeight, rampLength);
  acceleration = 30*sin(angle)*(200 - friction)/200;
  f = friction/200;
  rga = round(300*sin(angle));
  rfa = round(10*(30*sin(angle)*(200 - friction)/200 - 30*sin(angle)));
  rna = rga + rfa;
  time = round(100*sqrt(2*sqrt(pow(rampLength, 2) + pow(rampHeight, 2))/acceleration)/7.4737);
  
  dX = round(distance*cos(angle));
  dY = round(distance*sin(angle));
  background(255);
  fill(255);
  fill(#ffa500);
  triangle(0, 600 - rampHeight, 0, 600, rampLength, 600);
  rectangle();
  adjust();
  control();
  info();
  
  if (start) {
    velocity += 3*acceleration;
    distance += velocity/40;
  }
  
  rampHeight = rH * 2;
  rampLength = rL * 4;
  
  timer++;
}

void rectangle(){
  line(dX, 600 - rampHeight + dY, sin(angle)*rectSize + dX, 600 - rampHeight - cos(angle)*rectSize + dY);
  line(sin(angle)*rectSize + dX, 600 - rampHeight - cos(angle)*rectSize + dY, sin(angle)*rectSize + cos(angle)*rectSize + dX, 600 - rampHeight - cos(angle)*rectSize + sin(angle)*rectSize + dY);
  line(sin(angle)*rectSize + cos(angle)*rectSize + dX, 600 - rampHeight - cos(angle)*rectSize + sin(angle)*rectSize + dY, cos(angle)*rectSize + dX, 600 - rampHeight + sin(angle)*rectSize + dY);
}

void adjust(){
  fill(255);
  rect(580, 30, 200, 20);
  fill(0);
  text("Ramp Height", 580, 18);
  rect(580, 30, rH, 20);
  if (mouseX > 580 && mouseX < 780 && aL == false && aF == false){
    if (mouseY > 30 && mouseY < 50 && aH == false && mousePressed){
      aH = true;
    }
    else if (aH && mousePressed){
      rH = mouseX - 580;
    }
    else if (mousePressed == false){
      aH = false;
    }
  }
  
  fill(255);
  rect(580, 80, 200, 20);
  fill(0);
  text("Ramp Length", 580, 72);
  rect(580, 80, rL, 20);
  
  if (mouseX > 580 && mouseX < 780 && aH == false && aF == false){
    if (mouseY > 80 && mouseY < 100 && aL == false && mousePressed){
      aL = true;
    }
    else if (aL && mousePressed){
      rL = mouseX - 580;
    }
    else if (mousePressed == false){
      aL = false;
    }
  }
  
  fill(255);
  rect(580, 130, 200, 20);
  fill(0);
  text("Friction", 580, 124);
  rect(580, 130, friction, 20);
  
  if (mouseX > 580 && mouseX < 780 && aH == false && aL == false){
    if (mouseY > 130 && mouseY < 150 && aF == false && mousePressed){
      aF = true;
    }
    else if (aF && mousePressed){
      friction = mouseX - 580;
    }
    else if (mousePressed == false){
      aF = false;
    }
  }
}

void control(){
  fill(255);
  textSize(25);
  
  if (start == false) {
    fill(#7a33f2);
    rect(580, 160, 95, 50);
    fill(0);
    textSize(25);
    text("Start", 595, 195);
    
      if (mousePressed && mouseX > 580 && mouseX < 675 && mouseY > 160 && mouseY < 210 && timer > 10 && aL == false && aH == false && aF == false){
        start = true;
        timer = 0;
      }
  }
  else{
    fill(#d0ff00);
    rect(580, 160, 95, 50);
    fill(0);
    textSize(25);
    text("Pause", 595, 195);
    
      if (mousePressed && mouseX > 580 && mouseX < 675 && mouseY > 160 && mouseY < 210 && timer > 10 && aL == false && aH == false && aF == false){
        start = false;
        timer = 0;
      }
  }
  
  fill(200, 0, 0);
  rect(685, 160, 95, 50);
  fill(0);
  text("Reset", 695, 195);
  
  if (mousePressed && mouseX > 685 && mouseX < 780 && mouseY > 160 && mouseY < 210 && aL == false && aH == false && aF == false) {
    distance = 0;
    velocity = 0;
    start = false;
  }

}

void info(){
  fill(0);
  textSize(15);
  text("Angle: " + round(angle*180/(PI)) + " degrees", 340, 18);
  text("Velocity: " + velocity/10, 340, 38);
  text("Gravitational force: "+ rga/10, 340, 58);
  text("Kinetic friction force: " + rfa/10, 340, 78);
  
  if (rna/10 > .3){
    text("Time to descend ramp: " + time/100 + " s", 340, 158);
  }
  else{
    text("Time to descend ramp: " + " ∞", 340, 158);
  }
  
  if (rna/10 > .3){
    text("Net force: " + rna/10, 340, 98);
  }
  else{
    text("Net force: 0", 340, 98);
  }
}