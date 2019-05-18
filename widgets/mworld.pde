/* @pjs preload="data/fonts/arcade.ttf"; */
/* @pjs preload="data/fonts/haike.ttf"; */
/* @pjs preload="data/fonts/monsterfriend.ttf"; */
/* @pjs preload="data/images/crocodoomerLeft/crocodoomerLeft00.png"; */
/* @pjs preload="data/images/crocodoomerLeft/crocodoomerLeft01.png"; */
/* @pjs preload="data/images/crocodoomerLeft/crocodoomerLeft02.png"; */
/* @pjs preload="data/images/crocodoomerLeft/crocodoomerLeft03.png"; */
/* @pjs preload="data/images/crocodoomerLeft/crocodoomerLeft04.png"; */
/* @pjs preload="data/images/crocodoomerLeft/crocodoomerLeft05.png"; */
/* @pjs preload="data/images/crocodoomerLeft/crocodoomerLeft06.png"; */
/* @pjs preload="data/images/crocodoomerRight/crocodoomerRight00.png"; */
/* @pjs preload="data/images/crocodoomerRight/crocodoomerRight01.png"; */
/* @pjs preload="data/images/crocodoomerRight/crocodoomerRight02.png"; */
/* @pjs preload="data/images/crocodoomerRight/crocodoomerRight03.png"; */
/* @pjs preload="data/images/crocodoomerRight/crocodoomerRight04.png"; */
/* @pjs preload="data/images/crocodoomerRight/crocodoomerRight05.png"; */
/* @pjs preload="data/images/crocodoomerRight/crocodoomerRight06.png"; */
/* @pjs preload="data/images/fightBackground/fightBackground00.png"; */
/* @pjs preload="data/images/fightBackground/fightBackground01.png"; */
/* @pjs preload="data/images/fightBackground/fightBackground02.png"; */
/* @pjs preload="data/images/fightBackground/fightBackground03.png"; */
/* @pjs preload="data/images/fightBackground/fightBackground04.png"; */
/* @pjs preload="data/images/fightBackground/fightBackground05.png"; */
/* @pjs preload="data/images/fightBackground/fightBackground06.png"; */
/* @pjs preload="data/images/fightBackground/fightBackground07.png"; */
/* @pjs preload="data/images/fightBackground/fightBackground08.png"; */
/* @pjs preload="data/images/fightBackground/fightBackground09.png"; */
/* @pjs preload="data/images/fightBackground/fightBackground10.png"; */
/* @pjs preload="data/images/fightBackground/fightBackground11.png"; */
/* @pjs preload="data/images/fightBackground/fightBackground12.png"; */
/* @pjs preload="data/images/fightBackground/fightBackground13.png"; */
/* @pjs preload="data/images/fightBackground/fightBackground14.png"; */
/* @pjs preload="data/images/fightBackground/fightBackground15.png"; */
/* @pjs preload="data/images/fightBackground/fightBackground16.png"; */
/* @pjs preload="data/images/fightBackground/fightBackground17.png"; */
/* @pjs preload="data/images/fightBackground/fightBackground18.png"; */
/* @pjs preload="data/images/fightBackground/fightBackground19.png"; */
/* @pjs preload="data/images/fightBackground/fightBackground20.png"; */
/* @pjs preload="data/images/fightBackground/fightBackground21.png"; */
/* @pjs preload="data/images/fightBackground/fightBackground22.png"; */
/* @pjs preload="data/images/fightBackground/fightBackground23.png"; */
/* @pjs preload="data/images/lunetterLeft/lunetterLeft00.png"; */
/* @pjs preload="data/images/lunetterLeft/lunetterLeft01.png"; */
/* @pjs preload="data/images/lunetterLeft/lunetterLeft02.png"; */
/* @pjs preload="data/images/lunetterLeft/lunetterLeft03.png"; */
/* @pjs preload="data/images/lunetterLeft/lunetterLeft04.png"; */
/* @pjs preload="data/images/lunetterLeft/lunetterLeft05.png"; */
/* @pjs preload="data/images/lunetterLeft/lunetterLeft06.png"; */
/* @pjs preload="data/images/lunetterLeft/lunetterLeft07.png"; */
/* @pjs preload="data/images/marioRight/marioRight00.png"; */
/* @pjs preload="data/images/marioRight/marioRight01.png"; */
/* @pjs preload="data/images/marioRight/marioRight02.png"; */
/* @pjs preload="data/images/marioRight/marioRight03.png"; */
/* @pjs preload="data/images/marioRight/marioRight04.png"; */
/* @pjs preload="data/images/marioRight/marioRight05.png"; */
/* @pjs preload="data/images/marioRight/marioRight06.png"; */
/* @pjs preload="data/images/marioRight/marioRight07.png"; */
/* @pjs preload="data/images/shield.png"; */
/* @pjs preload="data/images/sigil.png"; */
/* @pjs preload="data/patchNotes.txt"; */
/* @pjs preload="data/reset.txt"; */
/* @pjs preload="data/saveData.txt"; */
/* @pjs preload="data/sound/fightSong.mp3"; */
/* @pjs preload="data/sound/hit.mp3"; */




class Save {
  int n; //index of actual number within a line
  String line; //stores each line
  int storeData; //temporary storage of variable
  
  Save(){//empty constructor

  }
  
  void save(){
    //have to create save for everything now
    saveData[0] = storeStrings[0] + Integer.toString(player.getPlayerX());
    saveData[1] = storeStrings[1] + Integer.toString(player.getPlayerY());
    saveData[2] = storeStrings[2] + Integer.toString(map.mapX);
    saveData[3] = storeStrings[3] + Integer.toString(map.mapY);
    saveData[4] = storeStrings[4] + Integer.toString(player.getPlayerSpeed());
    saveData[5] = storeStrings[5] + Integer.toString(player.getPlayerDamage());
    saveData[6] = storeStrings[6] + Integer.toString((int)player.health);
    saveData[7] = storeStrings[7] + Integer.toString(player.maxHealth);
    saveData[8] = storeStrings[8] + Integer.toString((int)player.mana);
    saveData[9] = storeStrings[9] + Integer.toString(player.maxMana);
    
    saveStrings("data/saveData.txt", saveData);
  }
  
  void load(){
    //stores words before numbers in text file
    for(int i = 0; i < saveData.length; i++){
      line = saveData[i];
      for(int j = 0; j < line.length() - 3; j++){
        if(line.substring(j, j + 3).equals(" = ")){
          n = j + 3; //establishes where the actual number is
        }
      }
        storeStrings[i] = line.substring(0, n);
    }
    
    //loads and converts the numbers from saveData to saveDataInt
    for(int i = 0; i < saveData.length; i++){
      line = saveData[i];
      for(int j = 0; j < line.length() - 3; j++){
        if(line.substring(j, j + 3).equals(" = ")){
          n = j + 3; //establishes where the actual number is
        }
      }
      storeData = Integer.parseInt(saveData[i].substring(n));
      saveDataInt[i] = storeData;
    }
    //so now we have this funciton that turns the txt file into an array of ints
    //only ints will be counted
    //now i have to implement elements of array later
  }
}


import ddf.minim.*;

Animation crocodoomerLeft;
Animation crocodoomerRight;
Animation lunetterLeft;
Animation marioRight;
Animation fightBackground;

Display display;

PFont arcade;
PFont monsterfriend;
PImage sigil;
PImage shield; 

String[] saveData;     //stores whole strings, line by line of saveData.txt, e.g. 'playerX = 100'
String[] storeStrings; //stores just the string part before the number, e.g. 'playerX = '
int [] saveDataInt;    //stores the numerical data part of each line, e.g. '100'     

boolean[] keys; //better quality of character movement. 0 = L, 1 = U, 2 = R, 3 = D

Player player;

Minim minim;
AudioPlayer fightSong;
AudioPlayer hit;

int bX[] = {1060, 950, 1060};
int bY[] = {100, 325, 550};

int pX[] = {190, 300, 190};
int pY[] = {100, 325, 550};

int lagAllow = 40; 
boolean inBattle = false;
boolean changeText = false;

String message = "Crocodoomer and his friends appear!";

Save save = new Save();

public void setup() {
  minim = new Minim(this);
  keys = new boolean[4];
  
  for (int i = 0; i < keys.length; i++){
    keys[i] = false;
  }//setting initial conditions of keyPressed to false for all keys

  saveData = loadStrings("data/saveData.txt");
  storeStrings = new String[saveData.length]; //temporary storage of strings before the #'s
  saveDataInt = new int[saveData.length];
  
  save.load();
  
  fightSong = minim.loadFile("sound/fightSong.mp3");
  hit = minim.loadFile("sound/hit.mp3");
  
  arcade = createFont("fonts/arcade.ttf", 20);
  monsterfriend = createFont("fonts/monsterfriend.ttf", 20);
  
  crocodoomerLeft = new Animation("crocodoomerLeft", 7, 500, 280, 3);
  lunetterLeft = new Animation("lunetterLeft", 8, 1048, 601, 6);
  crocodoomerRight = new Animation("crocodoomerRight", 7, 500, 280, 3);
  marioRight = new Animation("marioRight", 8, 300, 300, 3);
  fightBackground = new Animation("fightBackground", 24, 1250, 750, 10);
  sigil = loadImage("images/sigil.png");
  shield = loadImage("images/shield.png");
  
  player = new Player(saveDataInt[7], saveDataInt[9], saveDataInt[0], saveDataInt[1], saveDataInt[4], saveDataInt[5]);
  display = new Display();
  
  size(1250, 750);
  rectMode(CENTER);
  imageMode(CENTER);
}

//Crocodoomer croc = new Crocodoomer(1000, 100

boolean damageText = false;
int tempDamageVar; //stores damage taken by player
int tempError; //stores standard error of enemy attacks
boolean playerDamageText = false;

int timer = 0;

int r = (int)(Math.random()*5);
boolean run = true;

int dmgSpread;

Enemy enemies[] = new Enemy[3];
Field battle = new Field();
Map map = new Map();

public void draw() {
  textFont(arcade);
  if (run) {
    enemies[0] = new Crocodoomer(80, 100);
    enemies[1] = new Lunetter(150, 100);
    enemies[2] = new Crocodoomer(80, 100);

    run = false;
  }
  background(200);
  
  if (mousePressed && !inBattle) { inBattle = true; }
  
  if (inBattle){
    battle();
  }
  else {
    map.drawMap();
    player.spawn(player.getPlayerX(), player.getPlayerY());
  }
  
  controls();
  timer++;
  save.save();
}










public void battle() {
  
  fightBackground.display(width/2, height/2);
  
  if(!battle.isPlayerTurn()){
    noFill();
    strokeWeight(10);
    stroke(0, 255, 0);
    image(sigil, bX[battle.getEnemyTurn()], bY[battle.getEnemyTurn()], 200, 200);
    stroke(0);
  }
  else{
    dmgSpread = (int)(randomGaussian()*player.getPlayerDamage()*.1); //standard deviation is 10%
    noFill();
    strokeWeight(10);
    stroke(0, 255, 0);
    image(sigil, pX[0], pY[0], 200, 200);
    stroke(0);
  }
  
  strokeWeight(10);
  noFill();
  //rect(bX[0], bY[0], 100, 100);
  //rect(bX[1], bY[1], 100, 100);
  //rect(bX[2], bY[2], 100, 100);

  //rect(pX[0], pY[0], 100, 100);
  //rect(pX[1], pY[1], 100, 100);
  //rect(pX[2], pY[2], 100, 100);

  fill(#300AAD);
  strokeWeight(5);
  rect(625, 600, 500, 300); //battle interface
  
  player.spawn(pX[0], pY[0] - 15);
  player.healthBar(pX[0] + 15, pY[0] - 10);
  
  if(timer == lagAllow){
    r = (int)(Math.random()*5);
  }

  for (int i = 0; i < enemies.length; i++) {
    if(enemies[i].getHealth() <= 0){
      enemies[i].die();
    }
    if (enemies[i].isAlive()){
      
        enemies[i].checkStats();
        enemies[i].spawn(bX[i] + enemies[i].getOffsetX(), bY[i] + enemies[i].getOffsetY());
        enemies[i].healthBar(bX[i] + 15, bY[i] - 10);
        if (enemies[i].isProtected()){
          image(shield, bX[i] - 80, bY[i] - 75, 40, 40);
          fill(0);
          text(enemies[i].getRdsProtectedFor() + 1,bX[i] - 85, bY[i] - 65);
        }
    }
  }

  if (battle.isPlayerTurn()) {

    if (battle.buttonSelect() < 0) {
        battle.buttonSet(2);
      } else if (battle.buttonSelect() > 2) {
        battle.buttonSet(0);
      }
    
    if (battle.returnBattleInterface() == 0) {
      
      intZero();
      
    }
    
    else if (battle.returnBattleInterface() == 1) {
      
      intOne();
      
    }
    
  }
  
  //if not player's turn
  
  else {
      if(enemies[battle.getEnemyTurn()].isAlive()){
        while (enemies[battle.getEnemyTurn()].manaCost(r) > enemies[battle.getEnemyTurn()].getMana()){
          r = (int)(Math.random()*5);
        }
        enemies[battle.getEnemyTurn()].act(r);
      }
      else {
        if(battle.getEnemyTurn() < enemies.length - 1){
        battle.changeEnemyTurn(1);
        }
        else{
          battle.startTurn();
          battle.setEnemyTurn(0);
        }
      }
  }
  
  //end
  
  fill(255); //message box
  textSize(20);
  if (timer == 0){
    display.n = 0;
  }
  display.displayText(message, 400, 485, 10);
  fill(#A05D5D);
  
  if (!enemies[0].isAlive() && !enemies[1].isAlive() && !enemies[2].isAlive()){
    inBattle = false;
    fightSong.shiftGain(0, -100, 6000);
  }
  
  fightSong.play();
  loop(fightSong, 1000);
  
  if (damageText && timer < lagAllow/3){
    textFont(monsterfriend);
    fill(177 + 40*timer, 8 + 50*timer, 26 + 30*timer, 255 - 20*timer);
    textSize(30);
    if (enemies[battle.buttonSelect()].isProtected){
      text("-" + (int)((Math.floor(player.getPlayerDamage() + dmgSpread)*enemies[battle.buttonSelect()].protRating())), bX[battle.buttonSelect()] - 150 , bY[battle.buttonSelect()] - 20 + 2*timer);
    }
    else {
      text("-" + (int)(Math.floor(player.getPlayerDamage()) + dmgSpread), bX[battle.buttonSelect()] - 150 , bY[battle.buttonSelect()] - 20 + 2*timer);
    }
  }
  else {
    damageText = false;
  }
  if (playerDamageText){
    if (timer < lagAllow/3){
    textFont(monsterfriend);
    fill(177 + 40*timer, 8 + 50*timer, 26 + 30*timer, 255 - 20*timer);
    textSize(30);
    text("-" + tempDamageVar, pX[0] + 30, pY[0] - 20 + 2*timer);
    }
    else {
      playerDamageText = false;
    }
  }
}


void nextTurn(){
  if(battle.getEnemyTurn() < enemies.length - 1){
    if(enemies[battle.getEnemyTurn()].isAlive()){
    while (enemies[battle.getEnemyTurn()].manaCost(r) > enemies[battle.getEnemyTurn()].getMana()){
          r = (int)(Math.random()*5);
        }
        enemies[battle.getEnemyTurn()].act(r);
    battle.changeEnemyTurn(1);
    }
    else {
      battle.changeEnemyTurn(1);
      nextTurn();
    }
  }
  else {
    battle.startTurn();
    battle.setEnemyTurn(0);
  }
}

void intZero(){
 
      message = "Crocodoomer and his friends appear!";

      //responsible for indicating which battle box you have selected
      if (battle.buttonSelect() == 0) {
        strokeWeight(5);
        fill(#EFEC37);
      } else {
        fill(#A05D5D);
        strokeWeight(1);
      }
      rect(500, 530, 140, 40);
      fill(0);
      text("Attack", 470, 535);

      if (battle.buttonSelect() == 1) {
        strokeWeight(5);
        fill(#EFEC37);
      } else {
        fill(#A05D5D);
        strokeWeight(1);
      }
      rect(500, 610, 140, 40);
      fill(0);
      text("Magic", 470, 615);

      if (battle.buttonSelect() == 2) {
        strokeWeight(5);
        fill(#EFEC37);
      } else {
        fill(#A05D5D);
        strokeWeight(1);
      }
      rect(500, 690, 140, 40);
      fill(0);
      text("Flee", 470, 695);
    }
    
void intOne(){
  
  message = "Crocodoomer and his friends appear!";
  textSize(18);
  
      //responsible for indicating which battle box you have selected
      if (battle.buttonSelect() == 0) {
        strokeWeight(5);
        fill(#EFEC37);
      }
      else {
        fill(#A05D5D);
        strokeWeight(1);
      }
      if (!enemies[0].isAlive()){
        fill(#8A92A0);
      }
      rect(500, 530, 140, 40);
      fill(0);
      text(enemies[0].getName(), 440, 535);

      if (battle.buttonSelect() == 1) {
        strokeWeight(5);
        fill(#EFEC37);
      }
      else {
        fill(#A05D5D);
        strokeWeight(1);
      }
      if (!enemies[1].isAlive()){
        fill(#8A92A0);
      }
      rect(500, 610, 140, 40);
      fill(0);
      text(enemies[1].getName(), 440, 615);

      if (battle.buttonSelect() == 2) {
        strokeWeight(5);
        fill(#EFEC37);
      } 
      else {
        fill(#A05D5D);
        strokeWeight(1);
      }
      if (!enemies[2].isAlive()){
        fill(#8A92A0);
      }
      rect(500, 690, 140, 40);
      fill(0);
      text(enemies[2].getName(), 440, 695);
      
      fill(255);
      textSize(15);
      
      for (int i = 0; i < enemies.length; i++){
        if (enemies[i].isAlive()){
          text("HP: " + enemies[i].getHealth() + " / " + enemies[i].getMaxHealth(), 640, 525 + 80*i);
          text("Mana: " + enemies[i].getMana() + " / " + enemies[i].getMaxMana(), 640, 545 + 80*i);
        }
      } 
}

void controls(){
  if (!inBattle) {
      if (keys[0] && keys[1] && !keys[2] && !keys[3]){
        player.changePlayerX(-player.getPlayerSpeed());
        player.changePlayerY(-player.getPlayerSpeed());
      }
      else if (keys[1] && keys[2] && !keys[0] && !keys[3]){
        player.changePlayerY(-player.getPlayerSpeed());
        player.changePlayerX(player.getPlayerSpeed());
      }
      else if (keys[2] && keys[3] && !keys[0] && !keys[1]){
        player.changePlayerX(player.getPlayerSpeed());
        player.changePlayerY(player.getPlayerSpeed());
      }
      else if (keys[3] && keys[0] && !keys[1] && !keys[2]){
        player.changePlayerY(player.getPlayerSpeed());
        player.changePlayerX(-player.getPlayerSpeed());
      }
      else if (keys[0] && !keys[1] && !keys[2] && !keys[3]){
        player.changePlayerX(-player.getPlayerSpeed());
      }
      else if (keys[1] && !keys[0] && !keys[2] && !keys[3]){
        player.changePlayerY(-player.getPlayerSpeed());
      }
      else if (keys[2] && !keys[0] && !keys[1] && !keys[3]){
        player.changePlayerX(player.getPlayerSpeed());
      }
      else if (keys[3] && !keys[0] && !keys[1] && !keys[2]){
        player.changePlayerY(player.getPlayerSpeed());
      }
}
}

void keyPressed(){
    if (keyCode == LEFT){
      keys[0] = true;
    }
    else if (keyCode == UP){
      keys[1] = true;
    }
    else if (keyCode == RIGHT){
      keys[2] = true;
    }
    else if (keyCode == DOWN){
      keys[3] = true;
    }
    
    if (keyPressed && (key == 's'|| keyCode == DOWN)) {
          battle.buttonChange(1);
          timer = 1;
        } else if (keyPressed && (key == 'w' || keyCode == UP)) {
          battle.buttonChange(-1);
          timer = 1;
        }
    if (inBattle && keyPressed && key == ENTER && battle.buttonSelect() == 0 && battle.returnBattleInterface() == 0) {
      battle.setBattleInterface(1);
      timer = 1;
    }
    if (battle.returnBattleInterface() == 1 && timer > 5){
    if (keyPressed && key == ENTER && battle.isPlayerTurn() && enemies[battle.buttonSelect()].isAlive()) {
      enemies[battle.buttonSelect()].takeDamage(player.getPlayerDamage()); 
      battle.endTurn();
      r = (int)(Math.random()*5);
      timer = 0;

      damageText = true;
    }
  }
}

void keyReleased(){
    if (keyCode == LEFT){
      keys[0] = false;
    }
    else if (keyCode == UP){
      keys[1] = false;
    }
    else if (keyCode == RIGHT){
      keys[2] = false;
    }
    else if (keyCode == DOWN){
      keys[3] = false;
    }
}

void loop(AudioPlayer a, int offset){          //loops a sound effect as long as loop() is in a draw function
  if (a.position() > a.length() - offset){     //offset = number of miliseconds the soundbyte will cut off. used for soundbytes with extra silence after
    a.rewind();                                //rewinds the soundbyte
  }
}

class Animation {
  PImage[] images;
  int imageCount, imageWidth, imageHeight;
  float gifSpeed = 1;
  float frame;
  
  Animation(String imagePrefix, int imageCount, int imageWidth, int imageHeight, float gifSpeed) {
    this.gifSpeed = gifSpeed;
    this.imageWidth = imageWidth;
    this.imageHeight = imageHeight;
    this.imageCount = imageCount;
    images = new PImage[imageCount];

    for (int i = 0; i < imageCount; i++) {
      // Use nf() to number format 'i' into two digits
      String filename = "images/" + imagePrefix + "/" + imagePrefix + nf(i, 2) + ".png";
      images[i] = loadImage(filename);
    }
  }

  void display(float xpos, float ypos) {
    frame = (frame+(gifSpeed/10.0)) % imageCount;
    image(images[floor(frame)], xpos, ypos, imageWidth, imageHeight);
  }
  
  int getWidth() {
    return images[0].width;
  }
}

class Crocodoomer extends Enemy {
  
  int health;
  int mana;
  
  int offsetX = 15;
  int offsetY = -10;
  
  float protRating = .6;
  boolean isAlive = true;
  
  String name = "Crocodoomer";
  
  Crocodoomer(int maxHealth, int mana) {
    super(maxHealth, mana);
    health = maxHealth;
  }
  
  void die(){
   isAlive = false; 
  }
  
  void spawn(int x, int y){
    crocodoomerLeft.display(x, y);
  }
  
  boolean isAlive(){
    if(isAlive){
      return true;
    }
    else{
      return false;
    }
  }
  
  void act(int j){
    if(j == 0){
      if (timer < lagAllow/3){
        message = "Crocodoomer attacks!";
      }
      else if (timer > lagAllow/3 && timer < 2*lagAllow/3){
        message = "Crocodoomer attacks! \nCrocodoomer uses 'Chomp'";
        if (timer == 2*lagAllow/3 - 1){
          tempError = (int)(randomGaussian()*.1*25);
        }
      }
      
      else if (timer > 2*lagAllow/3 && timer < lagAllow){
        if(timer == lagAllow - 1){
          player.takeDamage(25 + tempError);
        }
        message = "Crocodoomer attacks! \nCrocodoomer uses 'Chomp'\nYou take " + (int)(25 + tempError) + " damage!";
    }
      else if (timer == lagAllow){
        
        timer = 0;
        nextTurn();
        }
      
      //player takes 25 damage 
      //no mana
      //chomp
    }
    else if (j == 1){
      if (timer < lagAllow/3){
        message = "Crocodoomer attacks!";
      }
      else if (timer > lagAllow/3 && timer < 2*lagAllow/3){
        message = "Crocodoomer attacks! \nCrocodoomer uses 'Impending Doom'";
        if (timer == 2*lagAllow/3 - 1){
          tempError = (int)(randomGaussian()*.1*75);
        }
      }
      
      else if (timer > 2*lagAllow/3 && timer < lagAllow){
        if (timer == lagAllow - 1){
          player.takeDamage(75 + tempError);
          super.spendMana(25);
        }
        message = "Crocodoomer attacks! \nCrocodoomer uses 'Impending Doom'\nYou take " + (int)(75 + tempError) + " damage!";
    }
      else if (timer == lagAllow){
        
        timer = 0;
        nextTurn();
        }
      //player takes 75 damage
      //costs 25 mana
    } //impending doom
    else if (j == 2){
      if (timer < lagAllow/3){
        message = "Crocodoomer attacks!";
      }
      else if (timer > lagAllow/3 && timer < 2*lagAllow/3){
        message = "Crocodoomer attacks! \nCrocodoomer uses 'Shadow Claw'";
        
        if (timer == 2*lagAllow/3 - 1){
          tempError = (int)(randomGaussian()*.1*30);
        }
      }
      
      else if (timer > 2*lagAllow/3 && timer < lagAllow){
        if (timer == lagAllow - 1){
          player.takeDamage(30 + tempError);
          super.heal(30 + tempError);
          super.spendMana(15);
        }
        message = "Crocodoomer attacks! \nCrocodoomer uses 'Shadow Claw'\nYou take " + (int)(30 + tempError) + " damage!\nCrocodoomer heals " + (int)(30 + tempError) + " health!";
    }
      else if (timer == lagAllow){
        timer = 0;
        nextTurn();
        }
      //lets assume player has 1000 health and 100 mana is standard
      //player takes 30 damage and croc heals 30 health
      //costs 15 mana
    } //shadow claw
    else if (j == 3){
      if (timer < lagAllow/3){
        message = "Crocodoomer defends!";
      }
      else if (timer > lagAllow/3 && timer < 2*lagAllow/3){
        message = "Crocodoomer defends! \nCrocodoomer uses 'Doom Barrier'";
      }
      
      else if (timer > 2*lagAllow/3 && timer < lagAllow){
        if(timer == lagAllow - 1){
        super.rdsProtectedFor = 3;
        super.spendMana(20);
        }
        message = "Crocodoomer defends! \nCrocodoomer uses 'Doom Barrier'\nDamage taken reduced for 3 turns!";
    }
      else if (timer == lagAllow){
        
        timer = 0;
        nextTurn();
        }
      //reduces damage taken by 40% for 3 rounds (does not stack)
      //costs 20 mana
    } //doom barrier
    else if (j == 4){
      if (timer < lagAllow/3){
        message = "Crocodoomer rallies!";
      }
      else if (timer > lagAllow/3 && timer < 2*lagAllow/3){
        message = "Crocodoomer rallies! \nCrocodoomer uses 'Doom Charge'";
        if (timer == 2*lagAllow/3 - 1){
          tempError = (int)(randomGaussian()*.1*10);
        }
      }
      
      else if (timer > 2*lagAllow/3 && timer < lagAllow){
        if(timer == lagAllow - 1){
          super.heal(10 + tempError);
          super.restoreMana(10 + tempError);
        }
        message = "Crocodoomer rallies! \nCrocodoomer uses 'Doom Charge'\nCrocodoomer heals " + (int)(tempError + 10) + " health!\nCrocodoomer restores " + (int)(tempError + 10) + " mana!";
    }
      else if (timer == lagAllow){
        timer = 0;
        nextTurn();
        }
      //gains 10 health
      //gains 10 mana
    } //doom  charge
}

  int getOffsetX(){
    return offsetX;
  }
  
  int getOffsetY(){
    return offsetY;
  }
  
  
  String getName(){
    return name;
  }
  
  float protRating(){
   return protRating; 
  }
  
  int manaCost(int j){
    if(j == 0){
      return 0;
    }
    else if (j == 1){
      return 25;
    } 
    else if (j == 2){
      return 15;
    } 
    else if (j == 3){
      return 20;
    }
    else if (j ==4){
      return 0;
    }
    else {
      return -1;
    }
  }
}

class Display {
  
  float n;
    
  Display () {
    
  }
  
  void displayText(String text, int x, int y, int numFrames){
    n += ((float)text.length())/numFrames;
  
    if (n < text.length()){
      text(text.substring(0, (int)n), x, y);
    }
    else if (n >= text.length()){
      text(text, x, y);
    }
    }
  
}

abstract class Enemy {
 
  float health;
  int maxHealth;
  float healthPercentage;
  
  float mana;
  int maxMana;
  float manaPercentage;
  
  int rdsProtectedFor = -1;
  boolean isProtected = false;
  
  Enemy(int maxHealth, int maxMana) {
    this.maxHealth = maxHealth;
    health = maxHealth;
    this.maxMana = maxMana;
    mana = maxMana;
    
    healthPercentage = health/maxHealth;
    manaPercentage = mana/maxMana;
  }
  
  void healthBar(int x, int y){
    healthPercentage = health/maxHealth;
    strokeWeight(1);
    fill(0);
    rect(x - 15, y - 65, 120, 15);
    fill(255, 0, 0);
    rect(x - 75 + 60*healthPercentage, y - 65, 120*healthPercentage, 15);
    
    manaPercentage = mana/maxMana;
    strokeWeight(1);
    fill(0);
    rect(x - 15, y - 51, 120, 5);
    fill(0, 0, 255);
    rect(x - 75 + 60*manaPercentage, y - 51, 120*manaPercentage, 5);
  }

  
  int getHealth(){
   return (int)health; 
  }
  
  int getMaxHealth(){
   return (int)maxHealth; 
  }
  
  int getMana(){
   return (int)mana; 
  }
  
  int getMaxMana(){
   return (int)maxMana; 
  }
  
  void takeDamage(int amount){
    if (isProtected){
      health -= ((amount + dmgSpread)*protRating());
    }
    else {
      health -= amount + dmgSpread;
    }
      hit.rewind();
      hit.play();
  }
  
  void heal(int amount){
    health += amount;
  }
  
  void spendMana(int amount){
    mana -= amount;
  }
  
  void restoreMana(int amount){
    mana += amount;
  }
  
  void changeRdsProtectedFor(int i){
    rdsProtectedFor += i;
  }
  
  int getRdsProtectedFor() {
    return rdsProtectedFor;
  }
  
  boolean isProtected(){
    return isProtected;
  }
  
  void checkStats(){
    if (health > maxHealth){
      health = maxHealth;
    }
    if (mana > maxMana){
      mana = maxMana;
    }
    if (rdsProtectedFor >= 0){
      isProtected = true;
    }
    else {
      isProtected = false;
    }
  }
  
  abstract void spawn(int x, int y);
  
  abstract float protRating(); //this number is multiplied by natural damage, so lower is better
  
  abstract void act(int i);
  
  abstract void die();
  
  abstract boolean isAlive();
  
  abstract String getName();
  
  abstract int getOffsetX();
  
  abstract int getOffsetY();
  
  abstract int manaCost(int j); //same parameters of act, but just returns amount of mana
}

class Field {
  boolean playerTurn = true;
  int enemyTurn = 0;
  int battleTurn = 0;
  int buttonSelect = 0;
  
  int battleInterface = 0; // |0 -> main | 1 -> attack | 2 -> magic | 3 -> flee |
  
  Field() {
    
  }
  
  boolean isPlayerTurn() {
    return playerTurn;
  }
  
  int returnBattleInterface() {
    return battleInterface;
  }
  
  int buttonSelect() {
    return buttonSelect;
  }
  
  void buttonChange(int i){
    buttonSelect += i;
  }
  
  void buttonSet(int i){
    buttonSelect = i;
  }
  
  void startTurn() {
    for (int i = 0; i < enemies.length; i++) {
      enemies[i].changeRdsProtectedFor(-1);
    }
    
    if (!player.isStunned()){
    playerTurn = true; 
    battleInterface = 0;
    buttonSelect = 0;
    }
    else {
      player.setStun(false);
      endTurn();
    }
  }
  
  void endTurn() {
    playerTurn = false;
  }
  
  void setBattleInterface(int i){
   battleInterface = i;
  }
  
  int getEnemyTurn(){
    return enemyTurn;
  }
  
  void changeEnemyTurn(int i){
    enemyTurn += i;
    r = (int)(Math.random()*5);
  }
  
  void setEnemyTurn(int i){
    enemyTurn = i;
    r = (int)(Math.random()*5);
  }
  
  void enemyTurn() {
    for(int i = 0; i < enemies.length; i++){
      if (enemies[i].isAlive()){
        enemies[i].act(r);
    }
      else {
        enemyTurn++;
      }
  }
  }
}

class Lunetter extends Enemy {

  int health;
  int mana;
  int l;

  int offsetX = 110;
  int offsetY = -10;

  float protRating = .6;
  boolean isAlive = true;

  String name = "Lunetter";
  //Chomp
  //25 damage
  //no mana
  //Ice Spear
  //1 in 3 chance to stun
  //30 damage
  //15 mana
  //Feeding Frenzy!
  //all allies do basic attack
  //25 mana
  //Ice Shield
  //reduces damage for 3 turns
  //20 mana
  //Telekenesis
  //steals 10 mana
  Lunetter(int maxHealth, int mana) {
    super(maxHealth, mana);
    health = maxHealth;
  }

  void die() {
    isAlive = false;
  }

  void spawn(int x, int y) {
    lunetterLeft.display(x, y);
  }

  boolean isAlive() {
    if (isAlive) {
      return true;
    } else {
      return false;
    }
  }

  void act(int j) {
    if (j == 0) {
      if (timer < lagAllow/3) {
        message = "Lunetter attacks!";
      } else if (timer > lagAllow/3 && timer < 2*lagAllow/3) {
        message = "Lunetter attacks! \nLunetter uses 'Chomp'";
        if (timer == 2*lagAllow/3 - 1) {
          tempError = (int)(randomGaussian()*.1*25);
        }
      } else if (timer > 2*lagAllow/3 && timer < lagAllow) {
        if (timer == lagAllow - 1) {
          player.takeDamage(25 + tempError);
        }
        message = "Lunetter attacks! \nLunetter uses 'Chomp'\nYou take " + (int)(tempError + 25) + " damage!";
      } else if (timer == lagAllow) {
        timer = 0;
        nextTurn();
      }

      //player takes 25 damage 
      //no mana
    } //chomp
    else if (j == 1) {
      if (timer < lagAllow/3) {
        message = "Lunetter attacks!";
      } else if (timer > lagAllow/3 && timer < 2*lagAllow/3) {
        message = "Lunetter attacks! \nLunetter uses 'Feeding Frenzy!'";
        if (timer == 2*lagAllow/3 - 1) {
          tempError = (int)(randomGaussian()*.1*30);
        }
      } else if (timer > 2*lagAllow/3 && timer < lagAllow) {
        message = "Lunetter attacks! \nLunetter uses 'Feeding Frenzy!'\nAll of Lunetter's allies attack!";
        for (int i = 0; i < enemies.length; i++) {
          if (enemies[i].isAlive()) {
            message += "\n" + enemies[i].getName() + " attacks!";
          }
        }

        if (timer == lagAllow - 1) {
          int p = 0;
          for (int i = 0; i < enemies.length; i++) {
            if (enemies[i].isAlive()) {
              p++;
            }
          }
          player.takeDamage((30 + tempError)*p);
          super.spendMana(25);
        }
      } else if (timer == lagAllow) {

        timer = 0;
        nextTurn();
      }
      //player takes 75 damage
      //costs 25 mana
    } //impending doom
    else if (j == 2) {
      if (timer < lagAllow/3) {
        message = "Lunetter attacks!";
      } else if (timer > lagAllow/3 && timer < 2*lagAllow/3) {
        message = "Lunetter attacks! \nLunetter uses 'Ice Spear!'";
        if (timer == 2*lagAllow/3 - 1) {
          tempError = (int)(randomGaussian()*.1*30);
        }
      } else if (timer > 2*lagAllow/3 && timer < lagAllow) {
        if (timer == 2*lagAllow/3 + 1) {
          l = (int)(Math.random()*3);
        }
        if (timer == lagAllow - 1) {
          player.takeDamage(30 + tempError);
          super.spendMana(15);
          if (l == 0) {
            player.setStun(true);
          }
        }
        if (l == 0) {
          message = "Lunetter attacks! \nLunetter uses 'Ice Spear!'\nYou take " + (int)(tempError + 30) + " damage!\nYou are stunned for one turn!";
        } else {
          message = "Lunetter attacks! \nLunetter uses 'Ice Spear!'\nYou take " + (int)(tempError + 30) + " damage!";
        }
      } else if (timer == lagAllow) {
        timer = 0;
        nextTurn();
      }
      //lets assume player has 1000 health and 100 mana is standard
      //player takes 30 damage and croc heals 30 health
      //costs 15 mana
    } //chomp
    else if (j == 3) {
      if (timer < lagAllow/3) {
        message = "Lunetter defends!";
      } else if (timer > lagAllow/3 && timer < 2*lagAllow/3) {
        message = "Lunetter defends! \nLunetter uses 'Ice Shield'";
      } else if (timer > 2*lagAllow/3 && timer < lagAllow) {
        if (timer == lagAllow - 1) {
          //implement code
          super.spendMana(20);
          super.rdsProtectedFor = 3;
        }
        message = "Lunetter defends! \nLunetter uses 'Ice Shield!'\nDamage taken reduced for 3 turns!";
      } else if (timer == lagAllow) {

        timer = 0;
        nextTurn();
      }
      //reduces damage taken by 40% for 3 rounds (does not stack)
      //costs 20 mana
    } //doom barrier
    else if (j == 4) {
      if (timer < lagAllow/3) {
        message = "Lunetter rallies!";
      } else if (timer > lagAllow/3 && timer < 2*lagAllow/3) {
        message = "Lunetter rallies! \nLunetter uses 'Telekenisis!'";
        if (timer == 2*lagAllow/3 - 1) {
          tempError = (int)(randomGaussian()*.1*10);
        }
      } else if (timer > 2*lagAllow/3 && timer < lagAllow) {
        if (timer == lagAllow - 1) {
          player.spendMana(10 + tempError);
          super.restoreMana(10 + tempError);
        }
        message = "Lunetter rallies! \nLunetter uses 'Telekenisis'\nLunetter restores " + (int)(10 + tempError) + " mana!\nYou lose " + (int)(tempError + 10) + " mana!";
      } else if (timer == lagAllow) {
        timer = 0;
        nextTurn();
      }
      //gains 10 health
      //gains 10 mana
    } //doom  charge
  }
  int getOffsetX() {
    return offsetX;
  }

  int getOffsetY() {
    return offsetY;
  }

  String getName() {
    return name;
  }

  float protRating() {
    return protRating;
  }

  int manaCost(int j) {
    if (j == 0) {
      return 0;
    } else if (j == 1) {
      return 25;
    } else if (j == 2) {
      return 15;
    } else if (j == 3) {
      return 20;
    } else if (j == 4) {
      return 0;
    } else {
      return -1;
    }
  }
}

class Map {
  int mapX = 0;
  int mapY = 0;
  
  Map(){
    
  }
  
  void drawMap(){
    if (mapX == 0 && mapY == 0){
      
      deadZone(400, 0, 500, 1000, true);
      deadZone(900, 0, 1000, 600, true);
      
      exitPoint(350, 700, 400, 750, 0, 0, 850, 100, true);
      
      if (triggerZone(1000, 135, 1250, 265)){
        inBattle = true;
      }
      
      crocodoomerLeft.display(1125, 200);
    }
  }
  
  void exitPoint(int x1, int y1, int x2, int y2, int mapX, int mapY, int nx, int ny){ 
    //if player is in between x1 and x2, and y1 and y2, player gets tp'd to [mapX, mapY] at coords [nx, ny]
    if ((player.getPlayerX() > x1 - 30 && player.getPlayerX() < x1 - 20 && player.getPlayerY() > y1 - 55 && player.getPlayerY() < y2 + 30) || (player.getPlayerX() > x2 + 20 && player.getPlayerX() < x2 + 25 && player.getPlayerY() > y1 - 55 && player.getPlayerY() < y2 + 30) || (player.getPlayerX() > x1 - 30 && player.getPlayerX() < x2 + 25 && player.getPlayerY() > y1 - 55 && player.getPlayerY() < (y2 + y1)/2 + 30) || (player.getPlayerX() > x1 - 30 && player.getPlayerX() < x2 + 25 && player.getPlayerY() > (y1 + y2)/2 - 55 && player.getPlayerY() < y2 + 30)){
      this.mapX = mapX;
      this.mapY = mapY;
      player.setPlayerX(nx);
      player.setPlayerY(ny);
    }
  }
  
  void exitPoint(int x1, int y1, int x2, int y2, int mapX, int mapY, int nx, int ny, boolean b){ 
    //if player is in between x1 and x2, and y1 and y2, player gets tp'd to [mapX, mapY] at coords [nx, ny]
    if ((player.getPlayerX() > x1 - 30 && player.getPlayerX() < x1 - 20 && player.getPlayerY() > y1 - 55 && player.getPlayerY() < y2 + 30) || (player.getPlayerX() > x2 + 20 && player.getPlayerX() < x2 + 25 && player.getPlayerY() > y1 - 55 && player.getPlayerY() < y2 + 30) || (player.getPlayerX() > x1 - 30 && player.getPlayerX() < x2 + 25 && player.getPlayerY() > y1 - 55 && player.getPlayerY() < (y2 + y1)/2 + 30) || (player.getPlayerX() > x1 - 30 && player.getPlayerX() < x2 + 25 && player.getPlayerY() > (y1 + y2)/2 - 55 && player.getPlayerY() < y2 + 30)){
      this.mapX = mapX;
      this.mapY = mapY;
      player.setPlayerX(nx);
      player.setPlayerY(ny);
    }
    if (b) {
      fill(0, 255, 255);
      rect(x1 + (x2 - x1)/2, y1 + (y2 - y1)/2, x2 - x1, y2 - y1);
    }
  }
  
  void deadZone(int x1, int y1, int x2, int y2){
    //create a zone where the player cannot move into, like walls
    //reason for halves is so doesn't get pushed to the left when coming from the right side
    //thus, deadzones have to be larger than playerspeed
    if (player.getPlayerX() > x1 - 30 && player.getPlayerX() < x1 - 20 && player.getPlayerY() > y1 - 55 && player.getPlayerY() < y2 + 30){
      player.changePlayerX(-player.getPlayerSpeed());
    }
    if (player.getPlayerX() > x2 + 20 && player.getPlayerX() < x2 + 25 && player.getPlayerY() > y1 - 55 && player.getPlayerY() < y2 + 30){
      player.changePlayerX(player.getPlayerSpeed());
    }
    if (player.getPlayerX() > x1 - 30 && player.getPlayerX() < x2 + 25 && player.getPlayerY() > y1 - 55 && player.getPlayerY() < (y2 + y1)/2 + 30){
      player.changePlayerY(-player.getPlayerSpeed());
    }
    if (player.getPlayerX() > x1 - 30 && player.getPlayerX() < x2 + 25 && player.getPlayerY() > (y1 + y2)/2 - 55 && player.getPlayerY() < y2 + 30){
      player.changePlayerY(player.getPlayerSpeed());
    }
  }
  void deadZone(int x1, int y1, int x2, int y2, boolean b){ //same but now visible if b = true
    //create a zone where the player cannot move into, like walls
    //reason for halves is so doesn't get pushed to the left when coming from the right side
    //thus, deadzones have to be larger than playerspeed
    if (player.getPlayerX() > x1 - 30 && player.getPlayerX() < x1 - 20 && player.getPlayerY() > y1 - 55 && player.getPlayerY() < y2 + 30){
      player.changePlayerX(-player.getPlayerSpeed());
    }
    if (player.getPlayerX() > x2 + 20 && player.getPlayerX() < x2 + 25 && player.getPlayerY() > y1 - 55 && player.getPlayerY() < y2 + 30){
      player.changePlayerX(player.getPlayerSpeed());
    }
    if (player.getPlayerX() > x1 - 30 && player.getPlayerX() < x2 + 25 && player.getPlayerY() > y1 - 55 && player.getPlayerY() < (y2 + y1)/2 + 30){
      player.changePlayerY(-player.getPlayerSpeed());
    }
    if (player.getPlayerX() > x1 - 30 && player.getPlayerX() < x2 + 25 && player.getPlayerY() > (y1 + y2)/2 - 55 && player.getPlayerY() < y2 + 30){
      player.changePlayerY(player.getPlayerSpeed());
    }
    if (b) {
      fill(0);
      rect(x1 + (x2 - x1)/2, y1 + (y2 - y1)/2, x2 - x1, y2 - y1);
    }
  }
  
  boolean triggerZone(int x1, int y1, int x2, int y2){
    //returns true if player is in these parameters
    //returns false in all other scenarios
    if ((player.getPlayerX() > x1 - 30 && player.getPlayerX() < x1 - 20 && player.getPlayerY() > y1 - 55 && player.getPlayerY() < y2 + 30) || (player.getPlayerX() > x2 + 20 && player.getPlayerX() < x2 + 25 && player.getPlayerY() > y1 - 55 && player.getPlayerY() < y2 + 30) || (player.getPlayerX() > x1 - 30 && player.getPlayerX() < x2 + 25 && player.getPlayerY() > y1 - 55 && player.getPlayerY() < (y2 + y1)/2 + 30) || (player.getPlayerX() > x1 - 30 && player.getPlayerX() < x2 + 25 && player.getPlayerY() > (y1 + y2)/2 - 55 && player.getPlayerY() < y2 + 30)){
      return true;
    }
    else {
      return false;
    }
  }
}

class Player {
  int playerX;
  int playerY;
  int playerSpeed;
  int playerDamage;
  
  float health;
  int maxHealth;
  float healthPercentage;
  
  float mana;
  int maxMana;
  float manaPercentage;
  
  boolean isStunned = false;
  
  Player(int maxHealth, int maxMana, int playerX, int playerY, int playerSpeed, int playerDamage) {
    this.maxHealth = maxHealth;
    health = saveDataInt[6];
    this.maxMana = maxMana;
    mana = saveDataInt[8];
    
    healthPercentage = health/maxHealth;
    manaPercentage = mana/maxMana;
    
    this.playerX = playerX;
    this.playerY = playerY;
    this.playerSpeed = playerSpeed;
    this.playerDamage = playerDamage;
  }
  
  void healthBar(int x, int y){
    healthPercentage = health/maxHealth;
    strokeWeight(1);
    fill(0);
    rect(x - 15, y - 65, 120, 15);
    fill(255, 0, 0);
    rect(x - 75 + 60*healthPercentage, y - 65, 120*healthPercentage, 15);
    
    manaPercentage = mana/maxMana;
    strokeWeight(1);
    fill(0);
    rect(x - 15, y - 51, 120, 5);
    fill(0, 0, 255);
    rect(x - 75 + 60*manaPercentage, y - 51, 120*manaPercentage, 5);
  }
  
  void spawn(int x, int y){
    marioRight.display(x, y);
  }
  
  void takeDamage(int amount){
    timer = 0;
    playerDamageText = true;
    tempDamageVar = amount;
    hit.rewind();
    hit.play();
    health -= amount;
    nextTurn();
  }
  
  int getPlayerX(){
    return playerX;
  }
  
  int getPlayerY(){
    return playerY;
  }
  
  void setPlayerX(int x){
    playerX = x;
  }
  
  void setPlayerY(int y){
    playerY = y;
  }
  
  void changePlayerX(int c){
    playerX += c;
  }
  
  void changePlayerY(int c){
    playerY += c;
  }
  
  int getPlayerSpeed(){
    return playerSpeed;
  }
  
  void spendMana(int amount){
    mana -= amount;
  }
  
  boolean isStunned(){
    return isStunned;
  }
  
  void setStun(boolean b){
    isStunned = b;
  }
  
  int getPlayerDamage(){
    return playerDamage;
  }
}


class Sidebar {
  
  int sidebarInterface = 0; // |0 -> main (nothing popped up) | 1 -> Character | 2 -> Inventory | 3 -> Spellbook | 4 -> Map |
  
  Sidebar() {
    
  }
  
  void display(int i) {
    if (i == 0){
      
    }
    else if (i == 1){
      
    }
    else if (i == 2){
      
    }
    else if (i == 3){
      
    }
    else if (i == 4){
      
    }
  }
  
}
