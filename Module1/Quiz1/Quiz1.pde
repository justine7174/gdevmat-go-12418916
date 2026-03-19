float t = 0;

void setup()
{
  size(1280, 720, P3D);
  camera(0, 0, -(height/2.0) / tan(PI*30.0 / 180.0), 0, 0, 0, 0, -1, 0);
  ortho();
}

void draw()
{
  background(0);

  drawCartesianPlane();
  drawQuadraticFunction();
  drawLinearFunction();
  drawSineWave();
  drawCircleHighlight();

  t += 0.05;
}

void drawCartesianPlane()
{
  stroke(255);
  strokeWeight(1);

  line(-300, 0, 300, 0);
  line(0, -300, 0, 300);

  for (int i = -300; i <= 300; i += 10)
  {
    point(i, 0);
    point(0, i);
  }
}

void drawQuadraticFunction()
{
  stroke(0, 255, 0);
  strokeWeight(3);

  for (float x = -10; x <= 15; x += 0.05)
  {
    float y = x * x - 15 * x - 3;
    point(x * 20, y * 0.8);
  }
}

void drawLinearFunction()
{
  stroke(255, 0, 0);
  strokeWeight(3);

  for (float x = -10; x <= 10; x += 0.05)
  {
    float y = -5 * x + 30;
    point(x * 20, y * 0.8);
  }
}

void drawSineWave()
{
  stroke(0, 0, 255);
  strokeWeight(3);

  float amplitude = 2;
  float frequency = 2;

  for (float x = -15; x <= 15; x += 0.05)
  {
    float y = (float)Math.sin(frequency * x + t) * amplitude;
    point(x * 20, y * 20);
  }
}

void drawCircleHighlight()
{
  stroke(255, 255, 0);
  strokeWeight(3);

  float radius = 60;

  for (int x = 0; x <= 360; x++)
  {
    float px = (float)Math.cos(x * PI / 180) * radius;
    float py = (float)Math.sin(x * PI / 180) * radius;

    point(px, py);
  }
}
