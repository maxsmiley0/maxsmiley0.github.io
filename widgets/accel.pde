void setup(){
  size(800, 200);
}

float x = 400;

float iacceleration = 0;
float ivelocity;

void draw(){
  background(#b3f442);
  fill(#f4ee42);
  rect(0, 75, 800, 50);
  
  fill(0);
  ellipse(x, 100, 50, 50);
  
  if (keyPressed){
    if (keyCode == LEFT){
      iacceleration = -.01;
    }
    if (keyCode == RIGHT){
      iacceleration = .01;
    }
  }
  else if (keyPressed == false){
     iacceleration = 0;
  }
 
  
  fill(0);
  textSize(15);
  
  text("Instantaneous Acceleration: " + round(iacceleration*100), 120, 20);
  text("Instantaneous Velocity: " + round(ivelocity*60), 120, 40);
  
  fill(#6d1cbf);
  strokeWeight(3);
  rect(0, 0, 100, 50);
  fill(255);
  textSize(30);
  text("Reset", 10, 35);

 if (mousePressed && mouseX < 100 && mouseY < 50){
    x = 400;
    ivelocity = 0;
  }
  
 if (x < -25){
   x = 825;
 }
 else if (x > 825){
   x = -25;
 }
 
 ivelocity += iacceleration;
 x += ivelocity;
}