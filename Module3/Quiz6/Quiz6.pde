void setup()
{
  size(1280, 720, P3D);
  surface.setLocation(
    (displayWidth - width) / 2,
    (displayHeight - height) / 2
  );
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
}

PVector mousePos()
{
  float x = mouseX - Window.windowWidth / 2;
  float y = -(mouseY - Window.windowHeight / 2);
  return new PVector(x, y);
}

void draw()
{
  background(130);

  PVector mouse = mousePos();

  float mag = mouse.mag();

  PVector blade = mouse.copy();
  blade.normalize().mult(500);

  PVector whiteBlade = blade.copy().mult(0.97);

  PVector opposite = PVector.mult(blade, -1);
  PVector whiteOpp = PVector.mult(whiteBlade, -1);

  PVector handle = blade.copy();
  handle.normalize().mult(70);

  PVector handleBack = PVector.mult(handle, -1);

  stroke(255, 0, 0, 80);
  strokeWeight(16);
  line(0, 0, blade.x, blade.y);

  stroke(255);
  strokeWeight(6);
  line(0, 0, whiteBlade.x, whiteBlade.y);

  stroke(255, 0, 0, 80);
  strokeWeight(16);
  line(0, 0, opposite.x, opposite.y);

  stroke(255);
  strokeWeight(6);
  line(0, 0, whiteOpp.x, whiteOpp.y);

  stroke(0);
  strokeWeight(16);
  line(handleBack.x, handleBack.y, handle.x, handle.y);

  println(mag);
}
