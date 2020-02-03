Molecule[] molecule = new Molecule[400];

public void setup() 
{ 
  size(800, 800); 
  background(#FFFFFF);
  rectMode(CENTER);
  
  for (int i = 0; i < molecule.length; i++)
  {
    molecule[i] = new Molecule();
  }
}

float boxWidth = 600;
float boxHeight = 600;
int collisions = 0;
float runtime;

public void draw()
{
  background(#FFFFFF);
  fill(#FFCC99); 
  rect(350, 350, boxWidth, boxHeight);
  runtime++;
  
  for (int i = 0; i < molecule.length; i++)
  {
    molecule[i].draw();
    molecule[i].move();
  }
  
  text("Collisions: " + collisions + "\nBox Width: " + boxWidth, 55, 23);
  text("Pressure : " + (int)(100*collisions/runtime)/100.0, 255, 23);
  
  if (mousePressed)
  {
    boxWidth --;
    /*for (int i = 0; i < molecule.length; i++)
     {
       molecule[i].changeSpeed(1.01);
     }*/
    //collisions = 0;
    //runtime = 0;
     
     for (int i = 0; i < molecule.length; i++)
     {
       molecule[i].setPosition(350, 350);
       runtime = 1;
       collisions = 0;
     }
  }
}

/*
Model Ideas:
Standard Ideal Gas
Loses Kinetic Energy when colliding with walls
Loses Kinetic Energy when colliding with other particles
Attractive forces
*/
