Walker[] walker = new Walker[100];

void setup()
{
  size(1280, 720, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);

  for (int i = 0; i < walker.length; i++)
  {
    walker[i] = new Walker();

    // random position
    walker[i].position = new PVector(
      random(Window.left, Window.right),
      random(Window.bottom, Window.top)
    );

    // random scale
    walker[i].scale = random(10, 40);
  }
}

void draw()
{
  background(80);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);

  for (int i = 0; i < walker.length; i++)
  {
    PVector mouse = new PVector(
      mouseX - Window.windowWidth,
      mouseY - Window.windowHeight
    );

    PVector direction = PVector.sub(mouse, walker[i].position);
    direction.normalize();
    direction.mult(0.2);

    walker[i].acceleration = direction;

    fill(255);
    noStroke();

    walker[i].update();
    walker[i].render();
    walker[i].checkEdges();
  }
}
