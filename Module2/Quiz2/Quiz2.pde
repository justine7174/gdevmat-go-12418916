Walker walker1;
Walker walker2;

void setup()
{
  size(1020, 720, P3D);
  background(255);

  camera(0, 0, -(height / 2.0) / tan(PI * 30.0 / 180.0), 0, 0, 0, 0, -1, 0);

  walker1 = new Walker();
  walker2 = new Walker();

  walker1.x = 0;
  walker1.y = 0;

  walker2.x = 0;
  walker2.y = 0;
}

void draw()
{
  camera(0, 0, -(height / 2.0) / tan(PI * 30.0 / 180.0), 0, 0, 0, 0, -1, 0);

  // do not put background(255); here if you want the trail

  walker1.randomWalk();
  walker1.render();

  walker2.randomWalkBiased();
  walker2.render();
}
