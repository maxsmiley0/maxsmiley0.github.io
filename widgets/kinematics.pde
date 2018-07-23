void setup(){
  size(800, 400);
}
int j = 0;
boolean start = false;
boolean reset = false;

int ps = 0;
int pv = 0;
int pa = 0;

float ipos = 0;
float ivel = 0;
float iaccel = 0;
float pos = 0;
float vel = 0;

float time = 1;
int timer = 0;

void draw(){
  timer++;
  if (start) {
    time++;
  }
  translate(width/2, height/2);
  background(252, 255, 183);
  fill(0);
  ellipse(ipos + pos, 0, 50, 50);
  axis();
  sliders();
  gui();
  
  if (pos + ipos > 425){
    pos = -425 - ipos;
    j += 85;
  }
  if (pos + ipos < -425){
    pos = 425 - ipos;
    j -= 85;
}
}
void axis(){
  fill(0);
  line(-400, 25, 400, 25);
  
  for(int i = 0; i < 22; i++){
    line(-400+50*i, 20, -400+50*i, 30);
    text(5*(i-8) + j, -410+50*i, 50);
  }
}
void sliders(){
  noFill();
  
  rect(-380, 150, 200, 20);
  rect(-100, 150, 200, 20);
  rect(180, 150, 200, 20);
  
  fill(63, 255, 146);
  ellipse(-280 + ipos, 160, 30, 30);
  ellipse(ivel, 160, 30, 30);
  ellipse(280 + iaccel, 160, 30, 30);
  
  fill(0);
  text("Initial Displacement: " + (ipos/10), -380, 130);
  text("Initial Velocity: " + (ivel/10), -100, 130);
  text("Initial Acceleration: " + (iaccel/10), 180, 130);
  
  if(start == true && reset == false){
  fill(255);
  rect(250, -200, 150, 50);
  fill(133, 0, 0);
  textSize(40);
  text("Stop", 270, -165);
  textSize(12);
  }
  else if (start == false && reset == false){
  fill(255);
  rect(250, -200, 150, 50);
  fill(0);
  textSize(40);
  text("Start", 270, -165);
  textSize(12);
  }
  else if (start == false && reset == true){
  fill(0);
  rect(250, -200, 150, 50);
  fill(255);
  textSize(40);
  text("Reset", 270, -165);
  textSize(12); 
  }
  
  if (mousePressed && mouseX > 650 && mouseY < 50 && timer > 30 && start == false && reset == false){
    start = true;
    timer = 0;
    time = 0;
  }
  if (mousePressed && mouseX > 650 && mouseY < 50 && timer > 30 && start){
    start = false;
    reset = true;
    timer = 0;
  }
  if (mousePressed && mouseX > 650 && mouseY < 50 && timer > 30 && reset == true && start == false){
    start = false;
    reset = false;
    time = 0;
    timer = 0;
    ipos = 0;
    ivel = 0;
    iaccel = 0;
    pos = 0;
    vel = 0;
  }
  
  if (start){
    pos += (ivel/60) + (vel/60);
    vel += (iaccel/60);
  }
  
  if(start == false && reset == false){
    if(get(mouseX, mouseY) == (color(63, 255, 146)) && mousePressed){
      ps = 1;
      pv = 1;
      pa = 1;
    }
    if(mouseX > 20 && mouseX < 220 && ps == 1 && mousePressed){
        ipos = mouseX - 120;
      }
    else if(mouseX > 300 && mouseX < 500 && ps == 1 && mousePressed){
        ivel = mouseX - 400;
      }
    else if(mouseX > 580 && mouseX < 780 && ps == 1 && mousePressed){
        iaccel = mouseX - 680;
      }
    if (mousePressed == false){
      ps = 0;
      pv = 0;
      pa = 0;
    }
  }
}

void gui(){
  float a = (10*round((pos + ipos)));
  float b = round(10*(vel + ivel));
  float t = round(time/6);
  fill(0);
  textSize(15);
  text("Displacement: " + (a/100 + j), -390, -180);
  text("Velocity: " + b/100, -390, -160);
  text("Acceleration: " + iaccel/10, -390, -140);
  text("Time: " + t/10, -390, -120);
}