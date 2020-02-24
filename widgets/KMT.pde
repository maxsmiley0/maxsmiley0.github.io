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
  frameRate(600);
  background(#FFFFFF);
  fill(#FFCC99); 
  rect(350, 350, boxWidth, boxHeight);
  runtime++;
  
  for (int i = 0; i < molecule.length; i++)
  {
    molecule[i].draw();
    molecule[i].move();
  }
  
  text("Collisions: " + collisions + "\nBox Area: " + (int)(boxWidth*boxHeight) , 55, 23);
  text("Pressure : " + (int)(100*collisions/runtime)/100.0, 255, 23);
  
  if (mousePressed)
  {
    if (mouseButton == LEFT)
    {
      boxWidth --;
    }
    else if (mouseButton == RIGHT)
    {
      boxWidth++;
    }
    /*for (int i = 0; i < molecule.length; i++)
     {
       molecule[i].changeSpeed(1.01);
     }*/
    //collisions = 0;
    //runtime = 0;
     
     for (int i = 0; i < molecule.length; i++)
     {
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

class Molecule
{
  private int moleculeSize = 2;
  private float randAngle = random(0, 2*PI);
  private float speed = randomGaussian() + 4;
  private PVector displacement = new PVector(random(350 - boxWidth/2, 350 + boxWidth/2), random(350 - boxHeight/2, 350 + boxHeight/2));
  private PVector velocity = new PVector(speed*cos(randAngle), speed*sin(randAngle));
  
  public Molecule()
  {
    
  }
  
  public void draw()
  {
    fill(#000000);
    ellipse(displacement.x, displacement.y, moleculeSize, moleculeSize); 
  }
  
  public void move()
  {
    if (displacement.x <= 350 - boxWidth/2)
    {
      displacement.x += 2;
    }
    else if (displacement.x >= 350 + boxWidth/2)
    {
      displacement.x -= 2;
    }
    
    displacement.add(velocity);
    if (displacement.x < 350 - boxWidth/2 - velocity.x)
    {
      velocity.x *= -1;
      collisions++;
      if (mousePressed)
      {
        velocity.x++;
      }
    }
    else if (displacement.x > 350 + boxWidth/2 - velocity.x)
    {
      velocity.x *= -1;
      collisions++; if (mousePressed)
      {
        velocity.x--;
      }
    }
    if (displacement.y > 350 + boxHeight/2 - velocity.y)
    {
      velocity.y *= -1;
      collisions++;
    }
    else if (displacement.y < 350 - boxHeight/2 - velocity.y)
    {
      velocity.y *= -1;
      collisions++;
    }
  } 
  
  public void setPosition(int x, int y)
  {
    displacement.x = x;
    displacement.y = y;
  }
  public void changeSpeed(float del)
  {
    velocity.mult(del);
  }
  public float getXVel()
  {
    return velocity.x;
  }
}