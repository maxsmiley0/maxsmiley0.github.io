void setup(){
  size(800, 200);
}

int x = 400;
int distance = 0;
float time = 1;
float displacement;
boolean start = false;

float avelocity;
float aspeed;
int ivelocity;
int ispeed = 2;

int timer = 0;

void draw(){
  timer++;
  ispeed = abs(ivelocity);
  aspeed = (distance/time);
  avelocity = displacement/time;
  background(#c9366c);
  fill(255);
  rect(0, 75, 800, 50);
  
  fill(0);
  textSize(10);
  text("Original Point", 365, 90);
  ellipse(400, 100, 5, 5);
  
  fill(133, 255, 0);
  ellipse(x, 100, 50, 50);
  displacement = x - 400;
  
  if (start) {
    time++;
  }
  
  if (keyPressed && start){
    if (keyCode == LEFT && x > 25){
      ivelocity = -2;
      x += ivelocity;
      distance += ispeed;
    }
    if (keyCode == RIGHT && x < 775){
      ivelocity = 2;
      x += ivelocity;
      distance += ispeed;
    }
  }
  else {
    ivelocity = 0;
  }
  
  if (time > 600){
    start = false;
  }
  
  fill(0);
  textSize(15);
  
  text("Instantaneous Speed: " + ispeed*60, 120, 20);
  text("Instantaneous Velocity: " + ivelocity*60, 120, 40);
  
  text("Average Speed: " + round(aspeed*60), 350, 20);
  text("Average Velocity: " + round(avelocity*60), 350, 40);
  
  text("Distance: " + distance, 580, 20);
  text("Displacement: " + round(displacement), 580, 40);
  text("Time: " + round(time/60) + "s", 580, 60);
  
  if (start || timer >= 600) {
    fill(#6d1cbf);
    strokeWeight(3);
    rect(0, 0, 100, 50);
    fill(255);
    textSize(30);
    text("Reset", 10, 35);
  }
  else {
    fill(255);
    strokeWeight(3);
    rect(0, 0, 100, 50);
    fill(0);
    textSize(30);
    text("Start", 10, 35);
  }
  
  if (mousePressed && mouseX < 100 && mouseY < 50 && start == false && time < 600 && timer > 10){
    start = true;
    timer = 0;
  }
  else if (mousePressed && mouseX < 100 && mouseY < 50 && start && timer > 10){
    start = false;
    time = 1;
    distance = 0;
    x = 400;
    timer = 0;
  }
  else if (mousePressed && mouseX < 100 && mouseY < 50 && time >= 600 && timer > 10){
    start = true;
    time = 1;
    distance = 0;
    x = 400;
    timer++;
  }
}