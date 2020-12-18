class Bullet extends Floater{
  //Bullet contructor to set the center, point direction, speed, and direction of bullets
  public Bullet(Spaceship theShip, PImage bulletImg){
   
    myCenterX = theShip.getX() + 80;
    myCenterY = theShip.getY();
    myPointDirection = theShip.getPointDirection();
    double dRadians = myPointDirection * (Math.PI/180);
    myDirectionX = 5 * Math.cos(dRadians) + theShip.getDirectionX();
    myDirectionY = 5 * Math.sin(dRadians) + theShip.getDirectionY();
    
  }
  //shows the bullets
  public void show(){
    bulletImg.resize(0, 20);
    image(bulletImg, (float) myCenterX, (float) myCenterY); 
}
  //movement of the bullet 
  public void move(){
   myCenterX += myDirectionX;
   myCenterY += myDirectionY;
  }
  //setter & getter functions of center, direction, and point direction of bullets
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
