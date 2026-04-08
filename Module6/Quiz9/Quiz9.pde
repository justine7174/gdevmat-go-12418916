Walker[] walker = new Walker[8];

void setup()
{
  size(1280, 720, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);

  initializeWalkers();
}

void draw()
{
  background(80);

  for (int i = 0; i < walker.length; i++)
  {
    walker[i].move();
    walker[i].render();
  }
}

void initializeWalkers()
{
  for (int n = 0; n < walker.length; n++)
  {
    walker[n] = new Walker();
    walker[n].setupWalker(n, walker.length);
  }
}

void mouseClicked()
{
  initializeWalkers();
}
