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
    displacement.add(velocity);
    if (displacement.x < 350 - boxWidth/2 - velocity.x)
    {
      velocity.x *= -1;
      collisions++;
    }
    else if (displacement.x > 350 + boxWidth/2 - velocity.x)
    {
      velocity.x *= -1;
      collisions++;
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
}
