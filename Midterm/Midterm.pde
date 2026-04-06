ArrayList<Walker> matters = new ArrayList<Walker>();
ArrayList<Integer> matterColors = new ArrayList<Integer>();

Walker blackHole = new Walker();

int matterCount = 150;
float gaussianSpreadX = Window.widthPx / 6.0;
float gaussianSpreadY = Window.heightPx / 6.0;
float pullSpeed = 2.0;

void setup()
{
  size(1280, 720, P3D);
  surface.setLocation(
    (displayWidth - width) / 2,
    (displayHeight - height) / 2
  );
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);

  blackHole.scale = 50;
  resetScene();
}

PVector mousePos()
{
  float x = mouseX - Window.windowWidth / 2;
  float y = -(mouseY - Window.windowHeight / 2);
  return new PVector(x, y);
}

void resetScene()
{
  matters.clear();
  matterColors.clear();

  for (int i = 0; i < matterCount; i++)
  {
    Walker matter = new Walker();

    float gx = (float)randomGaussian() * gaussianSpreadX;
    float gy = (float)randomGaussian() * gaussianSpreadY;

    matter.position.x = constrain(gx, Window.left, Window.right);
    matter.position.y = constrain(gy, Window.bottom, Window.top);
    matter.scale = random(8, 25);

    matters.add(matter);
    matterColors.add(color(random(255), random(255), random(255)));
  }
}

void draw()
{
  background(0);

  PVector mouse = mousePos();
  blackHole.position.x = mouse.x;
  blackHole.position.y = mouse.y;

  fill(255);
  noStroke();
  blackHole.render();

  for (int i = matters.size() - 1; i >= 0; i--)
  {
    Walker matter = matters.get(i);

    PVector direction = PVector.sub(blackHole.position, matter.position);
    float distance = direction.mag();

    if (distance <= blackHole.scale / 2)
    {
      matters.remove(i);
      matterColors.remove(i);
    }
    else
    {
      direction.normalize();
      direction.mult(pullSpeed);
      matter.position.add(direction);

      fill(matterColors.get(i));
      noStroke();
      matter.render();
    }
  }

  if (matters.size() == 0)
  {
    resetScene();
  }
}
