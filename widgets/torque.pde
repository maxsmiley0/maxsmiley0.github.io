//stops suddenly when torques balance out

void setup(){
  size(600, 600);
}

boolean[] squares = {
false, //-10 0
false, //-9 1
false, //-8 2
false, //-7 3
false, //-6 4
false, //-5 5
false, //-4 6
false, //-3 7
false, //-2 8
false, //-1 9
false, //0 10
false, //1 11
false, //2 12
false, //3 13
false, //4 14
false, //5 15
false, //6 16
false, //7 17
false, //8 18
false, //9 19
false, //10 20
};

float angle = 0;
float angle1;
int leftT = 0;
int rightT = 0;
float netT = 0;
float aVelocity = 0;
float aAcceleration;
boolean atRest = false;
float accelFactor = .00003;
int gravity = 50;
boolean aG = false;

void draw(){
  rectMode(CENTER);
  background(#e0e1ff);
  translate(width/2,height/2);
  rotate(angle);
  angle1 = -angle;
  
  GUI();
  beam();
  weight();
  
  if (angle > 0){
    if (degrees(angle) < 70 || (degrees(angle) > 70 && netT < 0 && aVelocity <= 0)){
      aAcceleration = accelFactor*netT;
      aVelocity += aAcceleration;
      angle += aVelocity;
    }
    else if (degrees(angle) > 70 && (aVelocity > 0 || (netT < 0 && aVelocity > 0))){
      aAcceleration = 0;
      aVelocity = 0;
    }
  }
  else{
    if (degrees(angle) > -70 || (degrees(angle) < -70 && netT > 0 && aVelocity >= 0)){
      aAcceleration = accelFactor*netT;
      aVelocity += aAcceleration;
      angle += aVelocity;
    }
    else if (degrees(angle) < 70 && (aVelocity < 0 || (netT > 0 && aVelocity < 0))){
      aAcceleration = 0;
      aVelocity = 0;
    }
  }
  
  fill(100);
  netT = rightT - leftT;
  
  rotate(angle1);
  triangle(-100, 300, 100, 300, 0, 10);
}

void beam(){
  stroke(0);
  noStroke();
  for(int i = 0; i <= 20; i++){
    fill(abs(20*i - 200));
    rect(-200 + 20*i, 0, 20, 20);
  }
}

void mousePressed(){
  
  for (int k = 0; k < 11; k++){
    
    if(get(mouseX, mouseY) == color(-3618616 - 1315860*k)){
      if(mouseX < 300 && squares[k] == false){
        squares[k] = true;
        leftT += 10 - k;
      }
      else if (mouseX > 300 && squares[20 - k] == false) {
        squares[20 - k] = true;
        rightT += 10 - k;
        
      }
  }
  }
}

void weight(){
  fill(#4c6a9b);
  for (int j = 0; j < 21; j++){
    if (squares[j]) {
      rect(-200 + 20*j, -20, 20, 20);
    }
  }
}

void GUI(){
  rotate(angle1);
  
  fill(255);
  rect(190, -190, 200, 200);
  textSize(15);
  fill(0);
  text("Angle: " + round(degrees(angle)), 100, -270);
  text("Angular Velocity: " + round(1000*aVelocity), 100, -250);
  text("Net Torque: " + round(netT), 100, -230);
  
  rotate(angle);
}
