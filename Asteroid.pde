class Asteroid extends Floater
{
	private int rotSpeed;
	public Asteroid()
	{
		 rotSpeed = (int)(Math.random()*11)-5;
		 myColor = 150;    
	  	 myCenterX = (double)(Math.random()*1000)+100; 
	  	 myCenterY = (double)(Math.random()*700)+100;  
	  	 myDirectionX = 0;
	  	 myDirectionY = 0;
	  	 myPointDirection = 0;  
	     corners = 8; 
	     xCorners = new int[corners];
	     yCorners = new int[corners];
		 xCorners[0] = -5;
	     yCorners[0] = -20;
	     xCorners[1] = 15;
	     yCorners[1] = -15;
	     xCorners[2] = 20;
	     yCorners[2] = 0;
	     xCorners[3] = 20;
	     yCorners[3] = 15;
	     xCorners[4] = 5;
	     yCorners[4] = 20;
	     xCorners[5] = -15;
	     yCorners[5] = 18;
	     xCorners[6] = -25;
	     yCorners[6] = 10;
	     xCorners[7] = -25;
	     yCorners[7] = -10;
	}

public void move ()   //move the floater in the current direction of travel
  {      
  	turn(rotSpeed);
  	super.move();
  }   

   public void setX(int x){ myCenterX = x;}  
   public int getX(){return (int)myCenterX;}   
   public void setY(int y){myCenterY = y;}   
   public int getY(){return (int)myCenterY;}   
   public void setDirectionX(double x){myDirectionX = x;}   
   public double getDirectionX(){return myDirectionX;}   
   public void setDirectionY(double y){myDirectionY = y;}   
   public double getDirectionY(){return myDirectionY;}   
   public void setPointDirection(int degrees){myPointDirection = degrees;}   
   public double getPointDirection(){return myPointDirection;} 
}