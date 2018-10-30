class Spaceship extends Floater  
{   
		public Spaceship()
	{
  	 myColor = 255;    
  	 myCenterX = (double)(Math.random()*1000)+100; 
  	 myCenterY = (double)(Math.random()*700)+100;  
  	 myDirectionX = 0;
  	 myDirectionY = 0;
  	 myPointDirection = 0;  
    corners = 9; 
    xCorners = new int[corners];
    yCorners = new int[corners];
    xCorners[0] = 10;
    yCorners[0] = 0;
    xCorners[1] = 4;
    yCorners[1] = 4;
    xCorners[2] = 20;
    yCorners[2] = 4;
    xCorners[3] = -6;
    yCorners[3] = 10;
    xCorners[4] = -14;
    yCorners[4] = 4;
    xCorners[5] = -14;
    yCorners[5] = -4;
    xCorners[6] = -6;
    yCorners[6] = -10;
    xCorners[7] = 20;
    yCorners[7] = -4;
    xCorners[8] = 4;
    yCorners[8] = -4;
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
