public void setup(){
  size(600, 400);
}

int x = 300;
int y = 200;
int a = 0;
double speed = 8;
float angle = 0;
float bulletX = 0;
boolean shooting = false;


public void draw(){
  background(#47F7C8);
  translate(x, y);
  strokeWeight(5);
  fill(#A6C0DD);
  rect(-250, -175, 100, 50);
  textSize(27);
  fill(0);
  text("RESET", -295, -165);
  strokeWeight(1);

  if (mousePressed && mouseX < 100 && mouseY < 50){
    reset();
  }

  if (!shooting){
    changeDir();
  }

  fill(#AFB1B5);
  rectMode(CENTER);
  rotate(degrees(angle));
  rect(a, 0, 100, 20);
  
  fill(0);
  rect(a + 40, 0, 20, 20);
  
  textSize(18);
  text("Cannon", a - 45, 5);
  
  if (shooting){
    bulletX += speed;
    a -= speed/4;
    fill(#FF0000);
    noStroke();
    ellipse(bulletX + 40, 0, 20, 20);
    stroke(0, 0, 0);
  }
}

public void changeDir(){
  if (keyPressed){
    if (keyCode == LEFT){
      angle -= .0005;
    }
    else if (keyCode == RIGHT){
      angle += .0005;
    }
  }
  else if (mousePressed && (mouseX > 100 || mouseY > 50)){
    shooting = true;
  }
}

public void reset(){
  shooting = false;
  bulletX = 0;
  x = 300;
  a = 0;
  angle = 0;
}
