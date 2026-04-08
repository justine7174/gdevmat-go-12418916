public class Walker
{
  public PVector position = new PVector();
  public PVector velocity = new PVector();
  public PVector acceleration = new PVector();

  public float velocityLimit = 10;
  public float scale = 15;
  public float mass = 1;

  public float r = 255;
  public float g = 255;
  public float b = 255;

  public Walker() {}

  public void setupWalker(int n, int totalWalkers)
  {
    mass = n + 1;
    scale = mass * 15;

    float posY = 2 * (Window.windowHeight / float(totalWalkers)) * (n - (totalWalkers / 2.0));
    position = new PVector(Window.left + 100, posY);

    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);

    r = random(0, 255);
    g = random(0, 255);
    b = random(0, 255);
  }

  public void applyForce(PVector force)
  {
    PVector f = PVector.div(force, this.mass);
    this.acceleration.add(f);
  }

  public void applyMovementForce()
  {
    PVector moveRight = new PVector(0.2, 0);
    applyForce(moveRight);
  }

  public void applyFriction()
  {
    float mew = 0.01;

    if (position.x > 0)
    {
      mew = 0.4;
    }

    if (velocity.mag() > 0)
    {
      PVector friction = velocity.copy();
      friction.mult(-1);
      friction.normalize();
      friction.mult(mew);

      applyForce(friction);
    }
  }

  public void update()
  {
    velocity.add(acceleration);
    velocity.limit(velocityLimit);
    position.add(velocity);
    acceleration.mult(0);
  }

  public void move()
  {
    applyMovementForce();
    applyFriction();
    update();
  }

  public void render()
  {
    fill(r, g, b);
    noStroke();
    circle(position.x, position.y, scale);
  }
}
