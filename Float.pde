abstract class Floater 
{   
  protected int corners;    
  protected int[] xCorners;   
  protected int[] yCorners;   
  protected int myColor;   
  protected double myCenterX, myCenterY; 
  protected double myDirectionX, myDirectionY; 
  protected double myPointDirection;   
  abstract public void setX(int x);  
  abstract public int getX();   
  abstract public void setY(int y);   
  abstract public int getY();   
  abstract public void setDirectionX(double x);   
  abstract public double getDirectionX();   
  abstract public void setDirectionY(double y);   
  abstract public double getDirectionY();   
  abstract public void setPointDirection(int degrees);   
  abstract public double getPointDirection(); 

    
  public void accelerate (double x, double y)   
  {          
       
    //double dRadians = myPointDirection*(Math.PI/180);        
    //myDirectionX += ((dAmount) * Math.cos(dRadians));    
    //myDirectionY += ((dAmount) * Math.sin(dRadians)); 
    myDirectionX += (x);    
    myDirectionY += (y);  
  }   
  public void turn (int nDegreesOfRotation)   
  {     
       
    myPointDirection+=nDegreesOfRotation;   
  }   
  public void move ()  
  {      
      
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
    if(myCenterY >height)
    {    
      myCenterY = 0;    
    } 
    
    else if (myCenterY < 0)
    {     
      myCenterY = height;    
    }   
  }   
  public void show ()  
  {             
    fill(myColor);   
    stroke(myColor);    
    translate((float)myCenterX, (float)myCenterY);  
    float dRadians = (float)(myPointDirection*(Math.PI/180));
    rotate(dRadians);
    beginShape();
    for (int nI = 0; nI < corners; nI++)
    {
      vertex(xCorners[nI], yCorners[nI]);
    }
    endShape(CLOSE);

    rotate(-1*dRadians);
    translate(-1*(float)myCenterX, -1*(float)myCenterY);
  }   
} 
