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

  float gravitationalConstant = 1;

  public Walker() {}

  public void applyForce(PVector force)
  {
    PVector f = PVector.div(force, this.mass);
    this.acceleration.add(f);
  }

  public void update()
  {
    this.velocity.add(this.acceleration);
    this.velocity.limit(velocityLimit);
    this.position.add(this.velocity);
    this.acceleration.mult(0);
  }

  public void render()
  {
    fill(r, g, b);
    noStroke();
    circle(position.x, position.y, scale);
  }

  public void checkEdges()
  {
    float radius = scale / 2.0;

    if (this.position.x + radius > Window.right)
    {
      this.position.x = Window.right - radius;
      this.velocity.x *= -1;
    }
    else if (this.position.x - radius < Window.left)
    {
      this.position.x = Window.left + radius;
      this.velocity.x *= -1;
    }

    if (this.position.y + radius > Window.top)
    {
      this.position.y = Window.top - radius;
      this.velocity.y *= -1;
    }
    else if (this.position.y - radius < Window.bottom)
    {
      this.position.y = Window.bottom + radius;
      this.velocity.y *= -1;
    }
  }

  public PVector calculateAttraction(Walker walker)
  {
    PVector force = PVector.sub(this.position, walker.position);

    float distance = force.mag();

    // prevent too strong / unstable force
    distance = constrain(distance, 5, 25);

    force.normalize();

    float strength = (this.gravitationalConstant * this.mass * walker.mass) / (distance * distance);
    force.mult(strength);

    return force;
  }
}
