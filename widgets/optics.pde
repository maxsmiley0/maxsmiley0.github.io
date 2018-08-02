int mirrorType = 0;
float dO = 300;
float dI;
float hO = 100;
float hI;
float f;
float M = hI/hO;
double m;
boolean aD = false;
boolean aS = false;

void setup() {
  size(1100, 600);
  background(#42f489);
}

void draw() {
  background(#42f489);
  line(0, 300, 1100, 300);
  dI = round(dI*10)/10;
  hI = round(hI*10)/10;
  M = hI/hO;
  m = round(M*100);
  boxes();
  modeSet();
  mirrors();
  adjustSize();
  adjustDistance();
  object();
  image();
  info();
  
  if (mirrorType == 0){
    hI = hO;
    dI = dO;
  }
  else if (mirrorType == 1){
    hI = hO*(dI/dO);
    dI = (dO*138)/(dO+138);
    ellipse(688, 300, 20, 20);
    fill(255);
    text("f", 684, 308);
    fill(0);
    ellipse(826, 300, 20, 20);
    fill(255);
    text("c", 821, 306);
    }
  else if (mirrorType == 2){
    if (dO > 92){
    hI = -hO*(dI/dO);
    dI = (dO*138)/(dO+138);
    ellipse(412, 300, 20, 20);
    fill(255);
    text("f", 410, 308);
    fill(0);
    ellipse(274, 300, 20, 20);
    fill(255);
    text("c", 272, 306);
    }
    else {
      hI = -hO*(dI/dO);
      dI = (dO*-138)/(dO-138);
      ellipse(412, 300, 20, 20);
      fill(255);
      text("f", 410, 308);
      fill(0);
      ellipse(274, 300, 20, 20);
      fill(255);
      text("c", 272, 306);
    }
  }
}


void boxes(){
  textSize(22);
  fill(#66e0ff);
  if(mirrorType == 0){
  strokeWeight(5);
  }
  rect(610, 10, 150, 30); //plane
  strokeWeight(1);
  fill(0);
  text("Plane", 655, 32);
  fill(#ba59f2);
  if(mirrorType == 1){
  strokeWeight(5);
  }
  rect(770, 10, 150, 30); //convex
  fill(0);
  text("Convex", 805, 32);
  strokeWeight(1);
  if(mirrorType == 2){
  strokeWeight(5);
  }
  fill(#d1f259);
  rect(930, 10, 150, 30); //concave
  fill(0);
  text("Concave", 955, 32);
  strokeWeight(1);
}
void modeSet(){
  if (mouseY > 10 && mouseY < 40 && mousePressed){
    if (mouseX > 610 && mouseX < 760){
      mirrorType = 0;
    }
    else if (mouseX > 770 && mouseX < 920){
      mirrorType = 1;
    }
    else if (mouseX > 930 && mouseY < 1080){
      mirrorType = 2;
    }
  }
}
void mirrors(){
  if (mirrorType == 0) {
    rect(545, 150, 10, 300);
  } 
  else if (mirrorType == 1) {
    noFill();
    strokeWeight(10);
    arc(800, 300, 500, 500, 4*PI/5, 6*PI/5);
    strokeWeight(1);
  } 
  else {
    noFill();
    strokeWeight(10);
    arc(300, 300, 500, 500, -PI/5, PI/5);
    strokeWeight(1);
  }
}
void adjustDistance(){
  fill(255);
  rect(40, 40, 480, 30);
  fill(0);
  rect(40, 40, dO - 50, 30);
  textSize(20);
  text("Object distance from mirror: " + dO, 45, 30);
  
  if (mouseX > 40 && mouseX < 520){
    if(mouseY > 40 && mouseY < 70 && aD == false && mousePressed){
      aD = true;
    }
    else if (aD && mousePressed){
      dO = mouseX + 10;
    }
    else if (mousePressed == false){
      aD = false;
    }
  }
}
void adjustSize(){
  fill(255);
  rect(40, 540, 440, 30);
  fill(0);
  rect(40, 540, hO + 240, 30);
  textSize(20);
  text("Object height: " + hO, 45, 530);
  if (mouseX > 40 && mouseX < 480){
    if(mouseY > 540 && mouseY < 570 && aS == false && mousePressed){
      aS = true;
    }
    else if (aS && mousePressed){
      hO = mouseX - 280;
    }
    else if (mousePressed == false){
      aS = false;
    }
  }
}
void object(){
  if (hO >= 0){
  text("Object", 500 - dO - hO/3, 300 - hO);
  rect(500 - dO - hO/3, 300 - hO, round(4*hO/5), hO);
  }
  else{
  text("Object", 470 - dO + hO/3, 300 - hO);
  rect(500 - dO - hO/3, 300 - hO, round(4*hO/5), hO);
  } 
}
void image(){
  if(mirrorType == 0){
    if (hI >= 0){
    text("Image", 530 + dI + hI/3, 300 - hI);
    rect(580 + dI - hI/3, 300 - hI, round(4*hI/5), hI);
    }
    else{
    text("Image", 610 + dI + hI/3, 300 - hI);
    rect(630 + dI - hI/3, 300 - hI, round(4*hI/5), hI);
    } 
  }
  else if(mirrorType == 1){
    if (hI >= 0){
    text("Image", 550 + dI*2/3 + hI/3, 300 - hI);
    rect(600 + dI*2/3 - hI/3, 300 - hI, round(4*hI/5), hI);
    }
    else{
    text("Image", 550 + dI*2/3, 300 - hI);
    rect(600 + dI*2/3 - hI/3, 300 - hI, round(4*hI/5), hI);
    }
  }
  else{
    if(dO >= 228){
      if (hI < 0){
        text("Image", 186 + dI + hI/3, 320 - 3*hI); 
        rect(256 + dI, 300 - hI*3, round(4*hI/5)*3, hI*3);
      }
      else {
        text("Image", 186 + dI + hI/3, 320 - 3*hI); 
        rect(206 + dI, 300 - hI*3, round(4*hI/5)*3, hI*3);
      }
    }
    else if(dO > 91 && dO < 228){
      if(hI < 0){
        text("Image", 346 + 10000/(92 - dO) + hI/3, 320 - 3*hI); 
        rect(415 + 10000/(92 - dO), 300 - hI*3, round(4*hI/5)*3, hI*3);
      }
      else {
        rect(355 + 10000/(92 - dO), 300 - hI*3, round(4*hI/5)*3, hI*3);
        text("Image", 326 + 10000/(92 - dO) + hI/3, 320 - 3*hI); 
      }
    }
    else if (dO <= 91){
      if (hI < 0){
        text("Image", 10*dI + hI/3 - 50, hI + 300);
        rect(10*dI, 300, round(4*hI/5), hI);
      }
      else {
        text("Image", 10*dI + hI/3 - 50, 320 + hI);
        rect(10*dI, 300, round(4*hI/5), hI);
      }
    }
  }
}
void info(){
  if(mirrorType == 0){
    text("Image Distance: -" + dI, 500, 470);
    text("Image Height: " + hI, 500, 500);
    text("Magnification: " + m/100, 500, 560);
    text("Focal Length: " + "∞", 500, 530);
    text("Image: Virtual", 500, 590);
  }
  else if (mirrorType == 1){
    text("Image Distance: " + dI, 500, 470);
    text("Image Height: " + hI, 500, 500);
    text("Magnification: " + m/100, 500, 560);
    text("Focal Length: " + "-138", 500, 530);
    text("Image: Virtual", 500, 590);
  }
  else {
    text("Focal Length: " + "138", 500, 530);
    if (dO >= 96){
      text("Image Distance: " + (436 - round((297 + 10000/(92 - dO)))), 500, 470);
      text("Image Height: " + hI, 500, 500);
      text("Magnification: " + m/100, 500, 560);
      text("Image: Real", 500, 590);
    }
    else if (dO < 96 && dO > 80){
      text("Image Distance: very far", 500, 470);
      text("Image Height: very tall", 500, 500);
      text("Magnification: some huge factor", 500, 560);
    }
    else{
      text("Image Distance: " + (436 - round((297 + 10000/(92 - dO)))), 500, 470);
      text("Image Height: " + -1*hI, 500, 500);
      text("Magnification: " + -1*m/100, 500, 560);
    }
    if (dO > 92){
      text("Image: Real", 500, 590);
    }
    else{
      text("Image: Virtual", 500, 590);
    }
  }
}
