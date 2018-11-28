public class Bullet extends Floater
{
	private double dRadians;
	public Bullet(Floater theShip)
	{
	 myColor = 255;    
  	 myCenterX = theShip.getX(); 
  	 myCenterY = theShip.getY();  
  	 myPointDirection = theShip.getPointDirection();  
  	 dRadians = myPointDirection*(Math.PI/180);
  	 myDirectionX = 5 * Math.cos(dRadians) + theShip.getDirectionX();
  	 myDirectionY = 5 * Math.sin(dRadians) + theShip.getDirectionY();
    corners = 4; 
    xCorners = new int[corners];
    yCorners = new int[corners];
    xCorners[0] = 0;
    yCorners[0] = -2;
    xCorners[1] = 7;
    yCorners[1] = -2;
    xCorners[2] = 7;
    yCorners[2] = 2;
    xCorners[3] = 0;
    yCorners[3] = 2;
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