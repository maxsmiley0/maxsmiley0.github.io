String[] saveData;     //stores whole strings, line by line of saveData.txt, e.g. 'playerX = 100'
String[] storeStrings; //stores just the string part before the number, e.g. 'playerX = '
int[] saveDataInt;    //stores the numerical data part of each line, e.g. '100'   
boolean keys[] = new boolean[4];
int playerX, playerY; 
  
Save save = new Save();

void setup()
{
  background(800, 800);
  size(800, 800);
 
  saveData = loadStrings("data/saveData.txt");
  storeStrings = new String[saveData.length]; //temporary storage of strings before the #'s
  saveDataInt = new int[saveData.length];

  save.load();
  
  playerX = saveDataInt[0];
  playerY = saveDataInt[1]; 
}

void draw()
{
  background(#FFFFFF); 
  ellipse(playerX, playerY, 100, 100);
  controls();
  save.save(); 
}

void controls() {
    if (keys[0] && keys[1] && !keys[2] && !keys[3]) {
      playerX--;
      playerY--;
    } else if (keys[1] && keys[2] && !keys[0] && !keys[3]) {
       playerX++;
      playerY--; 
    } else if (keys[2] && keys[3] && !keys[0] && !keys[1]) {
       playerX++;
      playerY++; 
    } else if (keys[3] && keys[0] && !keys[1] && !keys[2]) {
       playerX--;
      playerY++; 
    } else if (keys[0] && !keys[1] && !keys[2] && !keys[3]) {
      playerX--;
    } else if (keys[1] && !keys[0] && !keys[2] && !keys[3]) {
      playerY--;
    } else if (keys[2] && !keys[0] && !keys[1] && !keys[3]) {
      playerX++;
    } else if (keys[3] && !keys[0] && !keys[1] && !keys[2]) {
      playerY++;
  }
}

void keyPressed() {
  if (keyCode == LEFT) {
    keys[0] = true;
  } else if (keyCode == UP) {
    keys[1] = true;
  } else if (keyCode == RIGHT) {
    keys[2] = true;
  } else if (keyCode == DOWN) {
    keys[3] = true;
  }
} 

void keyReleased() {
  if (keyCode == LEFT) {
    keys[0] = false;
  } else if (keyCode == UP) {
    keys[1] = false;
  } else if (keyCode == RIGHT) {
    keys[2] = false;
  } else if (keyCode == DOWN) {
    keys[3] = false;
  }
} 

class Save {
  int n; //index of actual number within a line
  String line; //stores each line
  int storeData; //temporary storage of variable
  
  Save(){//empty constructor

  }
  
  void save(){
    //have to create save for everything now
    saveData[0] = storeStrings[0] + Integer.toString(playerX);
    saveData[1] = storeStrings[1] + Integer.toString(playerY);
       
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
