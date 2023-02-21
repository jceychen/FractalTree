private double fractionLength = .8;
private int smallestBranch = 7;
private double branchAngle = .5;
public void setup()
{
  size(640, 480);
  noLoop();
}
public void draw()
{
  background(0);
  stroke(149, 69, 53);
  strokeWeight(3);
  line(320, 480, 320, 380);
  drawBranches(320, 380, 100, 3*Math.PI/2);
}
public void mouseDragged()
{
  if (branchAngle <= 0.5) 
  {
    fractionLength+=0.005;
    branchAngle+=.005;
    redraw();
  } 
  else 
  {
    fractionLength-=0.005;
    branchAngle-=.005;
    redraw();
  }
}
public void drawBranches(int x, int y, double branchLength, double angle)
{
  double angle1 = angle + branchAngle;
  double angle2 = angle - branchAngle;
  branchLength *= fractionLength;
  int endX1 = (int)(branchLength*Math.cos(angle1) + x);
  int endX2 = (int)(branchLength*Math.cos(angle2) + x);
  int endY1 = (int)(branchLength*Math.sin(angle1) + y);
  int endY2 = (int)(branchLength*Math.sin(angle2) + y);
  int endX3 = (int)x;
  int endY3 = (int)y;
  line(x, y, endX1, endY1);
  line(x, y, endX2, endY2);
  line(x, y, endX3, endY3);
  if (branchLength <= 10) 
  {
    stroke((int)(Math.random()*200), 255, 255);
  }
  if (branchLength <= 40) 
  {
    stroke((int)(Math.random()*50), 135, 100);
  } 
  else  
  {
    stroke(50, 40, 40);
  }
  if (branchLength > smallestBranch) {
    stroke(255, 255, (int)(Math.random()*255));
    drawBranches(endX1, endY1, branchLength, angle1);
    drawBranches(endX2, endY2, branchLength, angle2);
    drawBranches(endX3, endY3, branchLength-20, angle);
  }
}
