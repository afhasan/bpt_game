class COVID extends Floater{
  
  private int rotationSpeed;

  
  public COVID(PImage covidImg){
   
   myCenterY = Math.random() * width;
   myCenterX = Math.random() * height;
   myDirectionX = (int)(Math.random() * 4 - 2);
   myDirectionY = (int)(Math.random() * 4 - 2);
   while(myDirectionX == 0 && myDirectionY == 0){
   myDirectionX = (int)(Math.random() * 4 - 2);
   myDirectionY = (int)(Math.random() * 4 - 2);
   }
   myPointDirection = (int)(Math.random() * 360);
   rotationSpeed = (int)(Math.random() * 2 + 1);
   
  }
  
  public void show(){
    covidImg.resize(0, 90);
    image(covidImg, (float) myCenterX, (float) myCenterY); 
}

  public void move(){   
    turn(rotationSpeed);
    
    myCenterX += myDirectionX;    
    myCenterY += myDirectionY;     
    
    if(myCenterX >width)
    {     
      myCenterX = 0;    
    }    
    else if (myCenterX<0)
    {     
      myCenterX = width;    
    }    
    if(myCenterY > height)
    {    
      myCenterY = 0;    
    } 
    
    else if (myCenterY < 0)
    {     
      myCenterY = height;    
    }   
  }
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
