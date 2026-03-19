class Walker
{
  float x;
  float y;
  float stepSize = 5;

  Walker()
  {
    x = 0;
    y = 0;
  }

  void randomWalk()
  {
    int rng = int(random(8));

    if (rng == 0) { x += stepSize; }                         // right
    else if (rng == 1) { x -= stepSize; }                    // left
    else if (rng == 2) { y += stepSize; }                    // down
    else if (rng == 3) { y -= stepSize; }                    // up
    else if (rng == 4) { x += stepSize; y += stepSize; }     // down-right
    else if (rng == 5) { x -= stepSize; y += stepSize; }     // down-left
    else if (rng == 6) { x += stepSize; y -= stepSize; }     // up-right
    else if (rng == 7) { x -= stepSize; y -= stepSize; }     // up-left
  }

  void randomWalkBiased()
  {
    float chance = random(100);

    if (chance < 40) { x += stepSize; }      // 40% right
    else if (chance < 60) { x -= stepSize; } // 20% left
    else if (chance < 80) { y -= stepSize; } // 20% up
    else { y += stepSize; }                  // 20% down
  }

  void render()
  {
    float r = random(0, 256);
    float g = random(0, 256);
    float b = random(0, 256);
    float a = random(50, 101);

    noStroke();
    fill(r, g, b, a);
    circle(x, y, 30);
  }
}
