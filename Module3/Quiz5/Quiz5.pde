Walker w;

void setup()
{
  size(1280, 720, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
  w = new Walker();
}

void draw() {
  background(255);
  w.step();
  w.display();
}
