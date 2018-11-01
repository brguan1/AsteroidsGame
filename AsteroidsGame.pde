Floater myBattleship;
Star[] art;
boolean isAccelerating = false; //sorry i copied your variables to make the controls smoother :9
boolean isRotatingLeft = false;
boolean isRotatingRight = false;
boolean isHyperspace = false;
int cooldown = 60;
boolean cooldownNull = true;
public void setup() 
{
  size(1200,900);
  myBattleship = new Spaceship();
  art = new Star[100];
 for (int i = 0; i<art.length; i++)
 {
 	art[i] = new Star();
 }
  cooldown = second();
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
  if (second() == cooldown){cooldownNull = true;}
  cooldown = second() - 1;
    if(isHyperspace == true) 
    {
		myBattleship.setX((int)(Math.random()*1199)+1);
		myBattleship.setY((int)(Math.random()*899)+1);
		isHyperspace = false;
		cooldownNull = false;
	}
  if(isAccelerating == true)myBattleship.accelerate(.1);
  if(isRotatingLeft == true)myBattleship.turn(-5);
  if(isRotatingRight == true)myBattleship.turn(5);
  stroke(255);
  text("X-coordinate = " + myBattleship.getX(), 30, 30, 30);
  text("Y-coordinate = " + myBattleship.getY(), 30, 50, 30);
  text("Point Direction = " + myBattleship.getPointDirection(), 30, 70, 30);
  //text("Hyperspace Cooldown = " + abs((cooldown-second())), 30, 90, 30);
}

public void keyPressed()
{
	if(key == 'w'){isAccelerating = true;}
	if(key == 'a'){isRotatingLeft = true;}
	if(key == 'd'){isRotatingRight = true;}
	if(key == 'h' && cooldownNull == true){isHyperspace = true;}
}

public void keyReleased()
{
	if(key == 'w'){isAccelerating = false;}
	if(key == 'a'){isRotatingLeft = false;}
	if(key == 'd'){isRotatingRight = false;}
}