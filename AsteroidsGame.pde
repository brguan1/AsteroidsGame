Floater myBattleship;
HealthBar health = new HealthBar(10,300);
ArrayList <Asteroid> theRock = new ArrayList <Asteroid>();
ArrayList <Bullet> shots = new ArrayList <Bullet>();
Star[] art;
boolean isAccelerating = false; //sorry i copied your variables to make the controls smoother :9
boolean isRotatingLeft = false;
boolean isRotatingRight = false;
boolean isHyperspace = false;
boolean isHit = false;
boolean firing = false;
int cooldown = 60;
boolean cooldownNull = true;
boolean spawnRateThing = false;
boolean debuggy = true;
public void setup() 
{
  size(1200,900);
  myBattleship = new Spaceship();
  for (int i = 0; i<11; i++)
  {
  	theRock.add(new Asteroid());
  }
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
  for (int i=0; i<art.length; i++) //also stolen :T
  {
  	 	art[i].show();
  }
  myBattleship.show();
  myBattleship.move(); 
  for (int i=0; i<theRock.size(); i++)
  {
  	 	Asteroid placeholder = theRock.get(i);
  	 	placeholder.show();
  	 	placeholder.move();
  }
  if (shots.size()>10)
  	shots.remove(0);
 shipMotion();
 collision();
 addrock();
 stats();
if(isHit == true)
		{
			health.setHealth(health.getHealth()-21);
			isHit = false;
		}
if (debuggy == true)
{
 debug();
}
}

public void keyPressed()
{
	if(key == 'w'){isAccelerating = true;}
	if(key == 'a'){isRotatingLeft = true;}
	if(key == 'd'){isRotatingRight = true;}
	if(key == ' '){firing = true;}
	if(key == 'h' && cooldownNull == true){isHyperspace = true;}
	if(key == 'm' && debuggy == true){debuggy = false;}
	else if(key == 'm' && debuggy == false){debuggy = true;}
}

public void keyReleased()
{
	if(key == 'w'){isAccelerating = false;}
	if(key == 'a'){isRotatingLeft = false;}
	if(key == 'd'){isRotatingRight = false;}
	if(key == ' '){firing = false;}
}

public void shipMotion()
{
  if (second() == cooldown){cooldownNull = true;}//this is the cooldown for hyperspace
  cooldown = second() - 1;
    if(isHyperspace == true)  //bunch of stuff that allows the ship to move... that i stole :p
    {
		myBattleship.setX((int)(Math.random()*1199)+1);
		myBattleship.setY((int)(Math.random()*899)+1);
		isHyperspace = false;
		cooldownNull = false;
	}
  if(isAccelerating == true)myBattleship.accelerate(.1);
  if(isRotatingLeft == true)myBattleship.turn(-5);
  if(isRotatingRight == true)myBattleship.turn(5);
  if(firing == true){
  	    shots.add(new Bullet(myBattleship));
    for(int i=0; i<shots.size();i++){
  	shots.get(i).show();
  	shots.get(i).move();
  	shots.get(i).accelerate(10);
  }
  }

}

public void debug()
{
  fill(255);                                                    //this is the debug menu.
  text("X-coordinate = " + myBattleship.getX(), 30, 30, 30);
  text("Y-coordinate = " + myBattleship.getY(), 30, 50, 30);
  text("Point Direction = " + myBattleship.getPointDirection(), 30, 70, 30);
  text("health = " + ((int)((health.getHealth()+10)/2.1)) ,30 ,90 ,30);
}

public void stats() 
{                     //planning to put a health bar here and maybe a cooldown timer if i figure out how to make it
	 health.show();
}

public class HealthBar
{
	private int myX, myY, damaged;
	public HealthBar(int x, int y)
	{
		myX = x;
		myY = y;
		damaged = 200;
	}
	public void show()
	{
		stroke(255);
		fill(0);
		rect(myX,myY,myX+200,myY-275);
		stroke(255);
		fill(255,25,25);
		rect(myX,myY,myX+damaged,myY-275);
	}
	public void setX(int x){myX = x;}
	public int getX(){return myX;}
	public void setY(int y){myY = y;}
	public int getY(){return myY;}
	public void setHealth(int health){damaged = (int)health;}
	public int getHealth(){return damaged;}
}

public void collision()
{
	for (int n=0; n < theRock.size(); n++){
		for (int i=0; i < shots.size(); i++){
			if(dist(shots.get(i).getX(), shots.get(i).getY(), theRock.get(n).getX(), theRock.get(n).getY()) < 20)
		{
			theRock.remove(n);
			shots.remove(i);
			spawnRateThing = true;
			break;
		}
		}
	}
	for (int i=0; i < theRock.size(); i++)
	{
		if(dist(myBattleship.getX(), myBattleship.getY(), theRock.get(i).getX(), theRock.get(i).getY()) < 20)
		{
			theRock.remove(i);
			spawnRateThing = true;
			isHit = true;
		}
	}
}

public void addrock()
{
	if(cooldown == second())
	theRock.add(new Asteroid());
	if(spawnRateThing == true)
	{
		theRock.add(new Asteroid());
		spawnRateThing = false;
	}
}