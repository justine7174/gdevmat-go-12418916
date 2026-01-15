void setup()
{
  size(1280, 720, P3D); // set window size to 1280 X 720
  camera(0, 0 , -(height/2.0) / tan (PI*30.0 / 180.0) , 0, 0, 0, 0, -1, 0); // center view
}

void draw()
{
  background(0);
  
  //circle(0, 0, 15);
  
  //strokeWeight(2); // thickness of line
  //color white = color(255,255,255); // declare a color var
  //fill(white); // fills it with the color selected
  //stroke(white); // all the strokes will be the color selected
  //line(-75, -75, 75, 75);
  
  drawCartesian();
  drawLinearFunction();
  drawQuadraticFunction();
  drawCircle();
}

void drawCartesian()
{
  strokeWeight(1);
  color white = color(255,255,255);
  fill(white);
  stroke(white);
  line(300,0,-300,0);
  line(0,-300,0,300);
  
  for (int i = -300; i <= 300; i += 10)
  {
    line(i,-2,i,2);
    line(-2,i,2,i);
  }
}

void drawLinearFunction()
{
  //f(x) = x + 2
  // let x be 3 then y 6(4,6)
  // let x be -5 then y -3(-5, -3)
  color red = color(255,0,0);
  fill(red);
  noStroke();
  
  for (int x = -200; x<= 200; x++)
  {
    circle(x , x+2, 5);
  }
}

void drawQuadraticFunction()
{
  color green = color(0,255,0);
  fill(green);
  noStroke();
  for (float x = -300 ; x<= 300; x+= 0.1f)
  {
    circle(x*10, (float)(x*x) + (2*x) - 5, 5);
  }
}

void drawCircle()
{
  color blue = color(0,0,255);
  fill(blue);
  stroke(blue);
  float radius = 50;
  
  for(int x = 0; x<=360; x++)
  {
    circle((float)Math.cos(x) * radius, (float)Math.sin(x) * radius, 5);
  }
}
