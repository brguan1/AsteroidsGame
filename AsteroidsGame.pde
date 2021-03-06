Floater myBattleship;
HealthBar health = new HealthBar(10,300);
ArrayList <Asteroid> theRock = new ArrayList <Asteroid>();
ArrayList <Bullet> shots = new ArrayList <Bullet>();
ArrayList <Double> speedX = new ArrayList <Double>();
ArrayList <Double> speedY = new ArrayList <Double>();
Star[] art;
boolean isAccelerating = false; //sorry i copied your variables to make the controls smoother :9
boolean isRotatingLeft = false;
boolean isRotatingRight = false;
boolean isHyperspace = false;
boolean isHit = false;
boolean firing = false;
int cooldown = 60;
int bob = 0;
int remember = 0;
boolean cooldownNull = true;
boolean spawnRateThing = false;
boolean debuggy = true;
boolean typeOne = true;
boolean infHealth = false;
boolean spawnType = true;
boolean unlocked = false;
boolean partOne = false;
boolean partTwo = false;
boolean partThree = false;
boolean partFour = false;
boolean complete = false;
boolean allowthistoturnoff = false;
boolean timestop = false;
int timer = 5;

public void setup() 
{
  size(1200,900);
  myBattleship = new Spaceship();
  for (int i = 0; i<11; i++)
  {
  	theRock.add(new Asteroid());
  	theRock.get(i).accelerate(Math.random()*5-0.5);
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
   for(int i=0; i<shots.size();i++){
  	shots.get(i).show();
  	shots.get(i).move();
  }
 weaponTypes();
 shipMotion();
 collision();
 if (spawnType == true)
 {
 addrock();
} else {
 addrockTwo();
}
 stats();
if(isHit == true && infHealth == false)
		{
			health.setHealth(health.getHealth()-21);
			remember = health.getHealth();
			isHit = false;
		} else {
			int derp = health.getHealth();
			health.setHealth(derp-21);
			health.setHealth(derp);
			isHit = false;
		}
if (debuggy == true)
{
 debug();
}
 if (unlocked == true && allowthistoturnoff == false)
 {
 	textSize(30);
 	
 	text("Infinite Health Unlocked" ,425 ,450);
 	text("Press 'I' to enable" ,475 ,520);
 }
}

public void keyPressed()
{
	if(key == 'w'){isAccelerating = true;}
	if(key == 'a'){isRotatingLeft = true;}
	if(key == 'd'){isRotatingRight = true;}
	if(key == ' '){firing = true;}
	if(key == 'h' && cooldownNull == true){isHyperspace = true;}
	//if (key == 'r'&& cooldownNull == true){cooldownNull = false;}
	/*else*/ if (key == 'r'&& cooldownNull == false){cooldownNull = true;}
	if(key == 'm' && debuggy == true){debuggy = false;}
	else if(key == 'm' && debuggy == false){debuggy = true;}
	if(key == 'q'){typeOne = true;}
	if(key == 'e'){typeOne = false;}
	if(key == 'z'){partOne = true;}
	if(key == 'x'){partTwo = true;}
	if(key == 'c') {partThree = true;}
	if(key == 'v'){partFour = true;}
	if(partOne == true && partTwo == true &&partThree == true &&partFour == true){complete = true;}
	if (complete == true){unlocked = true;}
	if (unlocked == true)
	{
	if(key == 'i' && infHealth == false)
		{
			health.setHealth(20999987);
			infHealth = true;
			allowthistoturnoff = true;
		} else if (key == 'i' && infHealth == true){
			health.setHealth(remember);
			infHealth = false;
			allowthistoturnoff = true;
		}
	}
	if(key == 'u' && spawnType == true){spawnType = false;}
	else if(key == 'u' && spawnType == false){spawnType = true;}

	if(key == 't' && timestop == false){timestop = true;}
	else if(key == 't' && timestop == true)
		{
			for (int i = 0; i < theRock.size(); i++)
			{
			theRock.get(i).accelerate(Math.random()*5-0.5);
			theRock.get(i).setRotSpeed((int)(Math.random()*11)-5);
	 		}
	 		for (int n = 0; n < shots.size(); n++){shots.get(n).accelerate(.1);}
	 			timestop = false;
	 	}
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
		myBattleship.setDirectionX(0);
		myBattleship.setDirectionY(0);
		isHyperspace = false;
		cooldownNull = false;
	}
  if(isAccelerating == true)myBattleship.accelerate(.1);
  if(isRotatingLeft == true)myBattleship.turn(-5);
  if(isRotatingRight == true)myBattleship.turn(5);
  if(firing == true){
  	    shots.add(new Bullet(myBattleship));
  }

}

public void debug()
{
  fill(255);                                                    //this is the debug menu.
  textSize(11);
  text("X-coordinate = " + myBattleship.getX(), 30, 30, 30);
  text("Y-coordinate = " + myBattleship.getY(), 30, 50, 30);
  text("Point Direction = " + myBattleship.getPointDirection(), 30, 70, 30);
  if (typeOne == true)
  {
  	text("weapon: normal" ,30 ,90 ,30);
  } else {
  	text("weapon: whip" ,30 ,90 ,30);
  }
  text("health = " + ((int)((health.getHealth()+10)/2.1)) ,30 ,110 ,30);
  if (spawnType == true)
  {
  	text("rock spawn: normal" ,30 ,130 ,30);
  } else {
  	text("rock spawn: burst" ,30 ,130 ,30);
  }
  if(cooldownNull == true)
  {
  	text("hyperspace-status: ready",30 ,150, 30);
  } else {
  	text("hyperspace-status: loading",30 ,150, 30);
  }

  text("Debug Controls:", 1000, 30, 30);
  text("q & e for weapons", 1000, 50, 30);
  text("r to skip hyperspace cooldown", 1000, 70, 30);
  text("u for changing rock spawn type", 1000, 90, 30);
  text("m for toggle debug menu", 1000, 110, 30);
  if(unlocked == true){text("i for infinite health", 1000, 130, 30);}
}

public void stats() 
{                     //no longer jsut stats
	 health.show();
	 if (timestop == true)
	 {
	 	for (int i = 0; i < theRock.size(); i++)
	 	{
	 		speedX.add(theRock.get(i).getDirectionX());
	 		speedY.add(theRock.get(i).getDirectionY());
	 		theRock.get(i).setDirectionX(0);
	 		theRock.get(i).setDirectionY(0);
	 		theRock.get(i).setRotSpeed(0);
	 	}
	 	for (int i = timer; i > 0; i--)
	 	{
	 		if (i < 0)
	 		{
	 			theRock.get(i).setDirectionX(speedX.get(0));
	 			theRock.get(i).setDirectionY(speedY.get(0));
	 			for (int n = 0; n < shots.size(); n++){shots.get(n).accelerate(.1);}
	 			speedX.remove(0);
	 			speedY.remove(0);
	 			timestop = false;
	 		} else {
	 			for (int n = 0; n < shots.size(); n++)
	 			{
	 				shots.get(n).setDirectionX(0);
	 	  		shots.get(n).setDirectionY(0);

	 			}
	 		}
	 	}

	 }
	 
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
			break;
		}
		}
	}
	for (int i=0; i < theRock.size(); i++)
	{
		if(dist(myBattleship.getX(), myBattleship.getY(), theRock.get(i).getX(), theRock.get(i).getY()) < 20)
		{
			theRock.remove(i);
			int help = (int)(Math.random()*5);
			if (help < 3)
			{
				spawnRateThing = true;
			}
			isHit = true;
		}
	}
	for (int i=0; i < shots.size(); i++)
	{
		if (shots.get(i).getX() > 1190|| shots.get(i).getX() < 10 || shots.get(i).getY() > 890 || shots.get(i).getY() < 10)
			shots.remove(i);
	}
}

public void addrock()
{
	if(cooldown%2 == 0)
	{
		spawnRateThing = true;
	if (spawnRateThing == true && bob == 0)
	{
	theRock.add(0, new Asteroid());
    theRock.get(0).accelerate(Math.random()*5-0.5);
    spawnRateThing = false;
    bob = 1;
	}
	}
	if (cooldown%2 != 0)
		bob = 0;
}

public void addrockTwo()
{
	if(cooldown%5 == 0)
	{
		spawnRateThing = true;
	if (spawnRateThing == true && bob == 0)
	{
	theRock.add(0, new Asteroid());
    theRock.get(0).accelerate(Math.random()*5-0.5);
    spawnRateThing = false;
    bob = 1;
	}
	}
		bob = 0;
}
public void weaponTypes()
{
	if (typeOne == true)
	{
		   for(int i=0; i<shots.size();i++){
		  	shots.get(i).accelerate(0.5);
		  }
 } else {
 	   for(int i=0; i<shots.size();i++){
 	  	shots.get(i).accelerate(10);
 	  }
 	if (shots.size() == 10)
 		shots.remove(0);
 }

}