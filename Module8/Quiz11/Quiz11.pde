Walker[] walker = new Walker[10];

void setup()
{
  size(1280, 720, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);

  for (int i = 0; i < walker.length; i++)
  {
    walker[i] = new Walker();

    walker[i].position = new PVector(
      random(Window.left, Window.right),
      random(Window.bottom, Window.top)
    );

    walker[i].mass = random(1, 11);
    walker[i].scale = walker[i].mass * 10;

    walker[i].r = random(0, 255);
    walker[i].g = random(0, 255);
    walker[i].b = random(0, 255);
  }
}

void draw()
{
  background(255);

  for (int i = 0; i < walker.length; i++)
  {
    for (int j = 0; j < walker.length; j++)
    {
      if (i != j)
      {
        walker[i].applyForce(walker[j].calculateAttraction(walker[i]));
      }
    }
  }

  for (int i = 0; i < walker.length; i++)
  {
    walker[i].update();
    walker[i].checkEdges();
    walker[i].render();
  }
}
