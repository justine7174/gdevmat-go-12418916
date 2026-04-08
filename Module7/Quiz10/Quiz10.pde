Liquid ocean = new Liquid(0, -100, Window.right, Window.bottom, 0.1f);
Walker[] walker = new Walker[10];

void setup()
{
  size(1280, 720, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);

  initializeWalkers();
}

void draw()
{
  background(255);

  ocean.render();

  for (int i = 0; i < walker.length; i++)
  {
    walker[i].render();
    walker[i].update();

    // wind
    PVector wind = new PVector(0.1f, 0);
    walker[i].applyForce(wind);

    // gravity scaled by mass
    PVector gravity = new PVector(0, -0.15f * walker[i].mass);
    walker[i].applyForce(gravity);

    // drag force when colliding with liquid
    if (ocean.isCollidingWith(walker[i]))
    {
      PVector dragForce = ocean.calculatingDragFrorce(walker[i]);
      walker[i].applyForce(dragForce);
    }

    // bounce at bottom edge
    if (walker[i].position.y <= Window.bottom)
    {
      walker[i].position.y = Window.bottom;
      walker[i].velocity.y *= -1;
    }
  }
}

void initializeWalkers()
{
  float spacing = (Window.right - Window.left) / float(walker.length + 1);

  for (int i = 0; i < walker.length; i++)
  {
    walker[i] = new Walker();

    // equally spaced side-by-side
    float posX = Window.left + spacing * (i + 1);

    // slightly above the screen
    float posY = Window.top + 50;

    walker[i].position = new PVector(posX, posY);

    // random mass
    walker[i].mass = random(1, 10);

    // scaled according to mass
    walker[i].scale = walker[i].mass * 10;

    // random colors
    walker[i].r = random(0, 255);
    walker[i].g = random(0, 255);
    walker[i].b = random(0, 255);
  }
}
