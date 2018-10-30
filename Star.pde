class Star //note that this class does NOT extend Floater
{
  private int myX,myY, myColor;
  public Star()
  {
  	myX = (int)(Math.random()*1199)+1;
  	myY = (int)(Math.random()*899)+1;
  }
  public void show()
  {
  	noStroke();
  	fill((int)(Math.random()*254)+1,(int)(Math.random()*254)+1,(int)(Math.random()*254)+1);
  	ellipse(myX, myY, 5, 5);
  }
}
