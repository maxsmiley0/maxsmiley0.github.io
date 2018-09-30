void setup(){
  size(600, 400);
}

float x = 300;
float y = 200;

float ixacceleration = 0;
float ixvelocity;

float iyacceleration = 0;
float iyvelocity;

int mass = 95;
int force = 95;
int f = 0;

void draw(){
  background(#2BA7EF);
  
  slider();
  
  strokeWeight(3);
  fill(#b3f442);
  ellipse(x, y, mass, mass);
  
  if (keyPressed){
    if (keyCode == LEFT){
      ixacceleration = -2.0/mass;
      leftArrow();
    }
    if (keyCode == RIGHT){
      ixacceleration = 2.0/mass;
      rightArrow();
    }
    if (keyCode == UP){
      iyacceleration = -2.0/mass;
      upArrow();
    }
    if (keyCode == DOWN){
      iyacceleration = 2.0/mass;
      downArrow();
    }
  }
  else if (keyPressed == false){
     ixacceleration = 0;
     iyacceleration = 0;
  }
  
  fill(0);
  textSize(15);
  
  text("Mass of Object: " + mass + " Kilograms", 120, 20);
  
  fill(#6d1cbf);
  strokeWeight(3);
  rect(0, 0, 100, 50);
  fill(255);
  textSize(30);
  text("Reset", 10, 35);

 if (mousePressed && mouseX < 100 && mouseY < 50){
    x = 300;
    y = 200;
    ixvelocity = 0;
    iyvelocity = 0;
  }
  
 if (x < -25){
   x = 625;
 }
 else if (x > 625){
   x = -25;
 }
 
 if (y < -25){
   y = 425;
 }
 else if (y > 425){
   y = -25;
 }
 
  ixvelocity += ixacceleration;
  x += ixvelocity;
  iyvelocity += iyacceleration;
  y += iyvelocity;
}

void rightArrow(){
  line(x - mass/2-75, y, x - mass/2, y);
  line(x - mass/2-25, y - 25, x - mass/2, y);
  line(x - mass/2-25, y + 25, x - mass/2, y);
}

void leftArrow(){
  line(x + mass/2 + 75, y, x + mass/2, y);
  line(x + mass/2 + 25, y - 25, x + mass/2, y);
  line(x + mass/2 + 25, y + 25, x + mass/2, y);
}
void upArrow(){
  line(x, y + mass/2 + 75, x, y + mass/2);
  line(x - 25, y + mass/2 + 25, x, y + mass/2);
  line(x + 25, y + mass/2 + 25, x, y + mass/2);
}
void downArrow(){
  line(x, y - mass/2 - 75, x, y - mass/2);
  line(x + 25, y - mass/2 - 25, x, y - mass/2);
  line(x - 25, y - mass/2 - 25, x, y - mass/2);
}
void slider(){
  strokeWeight(1);
  rect(400, 10, 190, 20);
  fill(1, 1, 1);
  ellipse(395 + mass, 20, 30, 30);
  
  if (mousePressed && get(mouseX, mouseY) == color(1, 1, 1)){
    f = 1;
  }
  if (mouseX > 400 && mouseX < 590 && f == 1 && mousePressed){
    mass = mouseX - 395;
  }
  if (mousePressed == false){
    f = 0;
    }
}