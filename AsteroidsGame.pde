Floater myBattleship;
Star[] art;
public void setup() 
{
  size(1200,900);
  myBattleship = new Spaceship();
  art = new Star[100];
 for (int i = 0; i<art.length; i++)
 {
 	art[i] = new Star();
 }
}
public void draw() 
{
  background(0);
  for (int i=0; i<art.length; i++)
  {
  	 	art[i].show();
  }
  myBattleship.show();
  myBattleship.move();
       for(int i=0; i<2; i++)
	{
		stroke(255);
		if(key == 'n'){noStroke();}
		text("X-coordinate = " + myBattleship.getX(), 30, 30, 30);
		text("Y-coordinate = " + myBattleship.getY(), 30, 50, 30);
		text("Point Direction = " + myBattleship.getPointDirection(), 30, 70, 30);
	}
}

public void keyPressed()
{
	if(key == 'w'){myBattleship.accelerate(0.2);}
	if(key == 'a'){myBattleship.turn(-10);}
	if(key == 'd'){myBattleship.turn(10);}
}

public void hyperspace()
{
	if(key == 'k')
		{
			myBattleship.setX((int)(Math.random()*1199)+1);
			myBattleship.setY((int)(Math.random()*899)+1);
		}
}