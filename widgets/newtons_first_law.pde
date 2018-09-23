void setup(){
  size(600, 400);
}

float x = 300;
float y = 200;

float ixacceleration = 0;
float ixvelocity;

float iyacceleration = 0;
float iyvelocity;

void draw(){
  background(#00FFFF);
  
  fill(#b3f442);
  ellipse(x, y, 50, 50);
  
  if (keyPressed){
    if (keyCode == LEFT){
      ixacceleration = -.01;
      leftArrow();
    }
    if (keyCode == RIGHT){
      ixacceleration = .01;
      rightArrow();
    }
    if (keyCode == UP){
      iyacceleration = -.01;
      upArrow();
    }
    if (keyCode == DOWN){
      iyacceleration = .01;
      downArrow();
    }
  }
  else if (keyPressed == false){
     ixacceleration = 0;
     iyacceleration = 0;
  }
  
  fill(0);
  textSize(15);
  
  text("Horizontal Velocity: " + round(ixvelocity*60), 120, 20);
  text("Vertical Velocity: " + round(iyvelocity*60), 120, 40);
  
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
  line(x - 100, y, x - 25, y);
  line(x - 50, y - 25, x - 25, y);
  line(x - 50, y + 25, x - 25, y);
}

void leftArrow(){
  line(x + 100, y, x + 25, y);
  line(x + 50, y - 25, x + 25, y);
  line(x + 50, y + 25, x + 25, y);
}
void upArrow(){
  line(x, y + 100, x, y + 25);
  line(x - 25, y + 50, x, y + 25);
  line(x + 25, y + 50, x, y + 25);
}
void downArrow(){
  line(x, y - 100, x, y - 25);
  line(x + 25, y - 50, x, y - 25);
  line(x - 25, y - 50, x, y - 25);
}