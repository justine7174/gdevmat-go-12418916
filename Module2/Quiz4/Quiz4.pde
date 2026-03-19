void setup()
{
  size(1020, 720, P3D);
  camera(0, 0, -(height/2.0) / tan(PI*30.0 / 180.0), 0, 0, 0, 0, -1, 0);
}

void draw()
{
  if(frameCount % 300 == 0)
    {
      background(255);
    }
    
    paintSplatter();
}

void paintSplatter()
{
  float meanX = 0;
  float stdX = 120;
  float x = meanX + randomGaussian() * stdX;
  
  float y = random (-height / 2.0, height / 2.0);
  
  float meanSize = 25;
  float stdSize = 10;
  float size = meanSize + randomGaussian() * stdSize;
  
  if(size <5)
  {
    size = 5;
  }
  
  float r = random(0, 256);
  float g = random(0, 256);
  float b = random(0, 256);
  float a = random(10, 101);
  
  noStroke();
  fill(r, g, b, a);
  
  circle(x, y, size);
}
