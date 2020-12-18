class Spaceship extends Floater
{ 
  //Constructor class for Spaceship (aka the drone), sets center, direction, and point direction
  public Spaceship (PImage drone) {
   
   
   myCenterX = 1250;
   myCenterY = 750;
   myDirectionX = 0;
   myDirectionY = 0;
   myPointDirection = -90;
   
  }
  //shows the drone
  public void show(){
    drone.resize(0, 75);
    image(drone, (float) myCenterX, (float) myCenterY);

  }

  //getter and setter functions
  public void setX(int x){myCenterX = x;}  
  public int getX(){return (int) myCenterX;}   
  public void setY(int y){myCenterY = y;}   
  public int getY(){return (int) myCenterY;}   
  public void setDirectionX(double x){myDirectionX = x;} 
  public double getDirectionX(){return myDirectionX;}   
  public void setDirectionY(double y){myDirectionY = y;} 
  public double getDirectionY(){return myDirectionY;}  
  public void setPointDirection(int degrees){myPointDirection = degrees;}   
  public double getPointDirection(){return myPointDirection;} 
}
