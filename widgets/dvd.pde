void setup(){
  size(600, 400);
}

int x = 300;
int y = 200;
int distance = 0;
float displacement;

void draw(){
  background(0, 255, 255);
  
  fill(0);
  textSize(10);
  text("Original Point", 265, 190);
  ellipse(300, 200, 5, 5);
  
  fill(133, 255, 0);
  ellipse(x, y, 50, 50);
  displacement = sqrt(abs(pow((x - 300), 2) + pow((y - 200), 2)));
  
  if (keyPressed){
    if (keyCode == LEFT && x > 25){
      x--;
      distance++;
    }
    if (keyCode == RIGHT && x < 575){
      x++;
      distance++;
    }
    if (keyCode == UP && y > 25){
      y--;
      distance++;
    }
    if (keyCode == DOWN && y < 375){
      y++;
      distance++;
    }
  }
  
  fill(0);
  textSize(15);
  text("Distance: " + distance, 450, 20);
  text("Displacement: " + round(displacement), 450, 40);
  
  fill(255);
  strokeWeight(3);
  rect(0, 0, 100, 50);
  fill(0);
  textSize(30);
  text("Reset", 10, 35);
  
  if (mousePressed && mouseX < 100 && mouseY < 50){
    distance = 0;
    x = 300;
    y = 200;
  }
}