
class Bullet extends Floater{
  //Bullet contructor to set the center, point direction, speed, and direction of bullets
  public Bullet(Spaceship theShip, PImage bulletImg){
    console.log(ship_distance(theShip));
    myCenterX = theShip.getX() + 80;
    myCenterY = theShip.getY();
    myPointDirection = theShip.getPointDirection();
    double dRadians = myPointDirection * (Math.PI/180);
    //myDirectionX = 20 * Math.cos(dRadians) + theShip.getDirectionX();
    //myDirectionY = 20 * Math.sin(dRadians) + theShip.getDirectionY(); 
    
    //myDirectionX = 20 * Math.cos(dRadians) + getAngleX() + theShip.getDirectionX();
    //myDirectionY = 20 * Math.sin(dRadians) + getAngleY() +theShip.getDirectionY();
    
    myDirectionX = 20 * Math.cos(getAngleX());
    myDirectionY = 20 * Math.sin(getAngleY());



    
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
//code from web
  float xPosition, yPosition;
  float xVelocity, yVelocity;
  float directionAngle;
  float speed;

  void update() {
    xPosition += xVelocity;
    yPosition += yVelocity;
  }


  void setVelocity(float dir, float spd) {
    directionAngle = dir;
    speed = spd;
    xVelocity = speed * cos(dir);
    yVelocity = speed * sin(dir);
  }
  
  float getDistance(Spaceship other) {
    return dist(this.xPosition, this.yPosition, other.xPosition, other.yPosition);
  }

  float getDistancePow2(Spaceship other) {
    return sq(other.xPosition - this.xPosition) + sq(other.yPosition - this.yPosition);
  }

  // float getAngle() {
  //   return atan2(theShip.getX() - mouseX, theShip.getY() - mouseY);
  // }

  
  // get distance of drone -- 
  // get distance of x, y mouse --
  // get angle using inverse trig
  // set interval in x direction

  float ship_distance (Spaceship ship) {

    int x = (int) mouseX;
    int y = (int) mouseY;

    int shipx =  ship.getX();
    int shipy =  ship.getY();

    int disx = x - shipx;
    int disy = y - shipy;
    
    console.log('x' + disx);
    console.log('y' + disy);

    float res = atan2(disy / disx);
    
    return res;
  }


   float getAngleX() {
    return tan(mouseX - pmouseX); 
   }

  float getAngleY() {
    return tan(mouseY - pmouseY);
  }

}
