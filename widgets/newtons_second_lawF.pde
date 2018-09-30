void setup(){
  size(600, 400);
}

float x = 300;
float y = 200;

float ixacceleration = 0;
float ixvelocity;

float iyacceleration = 0;
float iyvelocity;

int force = 95;
int f = 0;

void draw(){
  background(#CA8EED);
  
  slider();
  
  strokeWeight(3);
  fill(#b3f442);
  ellipse(x, y, 50, 50);
  
  if (keyPressed){
    if (keyCode == LEFT){
      ixacceleration = -.01 * force/10;
      leftArrow();
    }
    if (keyCode == RIGHT){
      ixacceleration = .01 * force/10;
      rightArrow();
    }
    if (keyCode == UP){
      iyacceleration = -.01 * force/10;
      upArrow();
    }
    if (keyCode == DOWN){
      iyacceleration = .01 * force/10;
      downArrow();
    }
  }
  else if (keyPressed == false){
     ixacceleration = 0;
     iyacceleration = 0;
  }
  
  fill(0);
  textSize(15);
  
  text("Force Applied: " + round((force/10) + 1) + " Newtons", 120, 20);
  
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
  strokeWeight(force/20);
  line(x - 100, y, x - 25, y);
  line(x - 50, y - 25, x - 25, y);
  line(x - 50, y + 25, x - 25, y);
}

void leftArrow(){
  strokeWeight(force/20);
  line(x + 100, y, x + 25, y);
  line(x + 50, y - 25, x + 25, y);
  line(x + 50, y + 25, x + 25, y);
}
void upArrow(){
  strokeWeight(force/20);
  line(x, y + 100, x, y + 25);
  line(x - 25, y + 50, x, y + 25);
  line(x + 25, y + 50, x, y + 25);
}
void downArrow(){
  strokeWeight(force/20);
  line(x, y - 100, x, y - 25);
  line(x + 25, y - 50, x, y - 25);
  line(x - 25, y - 50, x, y - 25);
}
void slider(){
  strokeWeight(1);
  rect(400, 10, 190, 20);
  fill(1, 1, 1);
  ellipse(395 + force, 20, 30, 30);
  
  if (mousePressed && get(mouseX, mouseY) == color(1, 1, 1)){
    f = 1;
  }
  if (mouseX > 400 && mouseX < 590 && f == 1 && mousePressed){
    force = mouseX - 395;
  }
  if (mousePressed == false){
    f = 0;
    }
}