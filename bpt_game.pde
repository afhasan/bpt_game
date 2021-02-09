//add images
public PImage landscape;
public PImage drone; 
public PImage covidImg;
public PImage bulletImg;

//sets keys for movement, creates list for COVID/Bullets, sets number of points, health, and amount of times COVID has been hit
private boolean a, w, d, s;
public int points = 0;
public int life = 5;
public int counter = 6;
ArrayList<COVID> covid = new ArrayList<COVID>();
ArrayList <Bullet> bullets = new ArrayList <Bullet> ();

//setup of game board
public void setup() 
{
  //sets size of game to be 1500px x 800px
  size(1500, 800);
  //loads images
  landscape = loadImage("landscape.png");
  drone = loadImage("drone.png");
  covidImg = loadImage("COVID.png");
  bulletImg = loadImage("bullet.png");
  
  //creates 40 covid particles
  for(int i = 0; i < 40; i++){
    covid.add(new COVID(covidImg));
  }
  

}

//creates a spaceship
Spaceship ship = new Spaceship(drone);

//draws the game, how the game works
public void draw() 
{
 
 //inserts background image
 background(0);
 landscape.resize(width, height);
 image(landscape, 0, 0);

  
  //health bar 
  if(life == 5){
  noStroke();
  fill(255, 0, 0);
  rect(1100, 50, 300, 25);
  }
  else if (life == 4){
   noStroke();
   fill(255, 0, 0);
   rect(1100, 50, 240, 25);
  }else if(life == 3){
   noStroke();
   fill(255, 0, 0);
   rect(1100, 50, 180, 25); 
  }else if(life == 2){
   noStroke();
   fill(255, 0, 0);
   rect(1100, 50, 120, 25); 
   }else if(life == 1){
   noStroke();
   fill(255, 0, 0);
   rect(1100, 50, 60, 25); 
  }else{
   noStroke();
   fill(0);
   rect(0, 0, 0, 0);
  }


 //movement of ship
  if(!w && !s){
   ship.setDirectionX(ship.getDirectionX() * .95); 
   ship.setDirectionY(ship.getDirectionY() * .95);
  }
  if (w){
      ship.accelerate(0, -1);
  }
  if (s){
      ship.accelerate(0, 1);
  }
  if (a){
     ship.accelerate(-1, 0);
  }
  if (d){
    ship.accelerate(1, 0);
  }
  ship.move();
  ship.show();

//creation/movement of bullets
  for(int h = 0; h < bullets.size(); h++){
    bullets.get(h).show();
    bullets.get(h).move();
   }
/* 
  Snippet of code for mouse location 
  PointerInfo a = MouseInfo.getPointerInfo();
  Point b = a.getLocation();
  int x = (int) b.getX();
  int y = (int) b.getY();
  System.out.print(y + "jjjjjjjjj");
  System.out.print(x);
  Robot r = new Robot();
  r.mouseMove(x, y - 50);
*/ 
//creations/movement of covid  
  for(int i = 0; i < covid.size(); i++){
    covid.get(i).show();
    covid.get(i).move();
    
    //collision detector, if ship gets close enough to covid, remove that particle, add 2 more, health goes down by one
    float distance = dist(ship.getX(), ship.getY(), covid.get(i).getX(), covid.get(i).getY());
    if(distance <= 40){
      covid.remove(i);
      covid.add(new COVID(covidImg));
      covid.add(new COVID(covidImg));
      life--;
    }
      
  }

//if bullet hits covid particle, counter subtracts by one. if a covid particle is hit 6 times, remove that particle and health bar goes up by one
 for (int t = 0; t < covid.size(); t ++)
{
  for(int p = 0; p < bullets.size(); p++)
  {
    float distanceTwo = dist(bullets.get(p).getX(),bullets.get(p).getY(), covid.get(t).getX(), covid.get(t).getY());
    if(distanceTwo <= 30){
      counter--;
      if(counter == 0){
      covid.remove(t);
      counter = 6;
      if(life != 5){
      life++;
      }
      points++;
      }
      bullets.remove(p);
      break;
    }
  }
}
}
//The mouseClicked() function is called after a mouse button has been pressed and then released.
public void mouseClicked() {
   bullets.add(new Bullet(ship, bulletImg)); 
}

//checks to see if keys are pressed or not and sets boolean values for movement of ship
public void keyPressed(){
 
  if (key == 'w'){
     w = true;
 
  }
  if (key == 's'){
     s = true;
  }
  if (key == 'a'){
   a = true;
  }
 if (key == 'd'){
   d = true;
  }
  //if space bar is pressed, shoot bullets
  // if(key == ' '){
  //  bullets.add(new Bullet(ship, bulletImg)); 
  // }
}

//checks to see if keys are released for movement 
public void keyReleased(){
  if (key == 'w'){
     w = false;
  }
   if (key == 's'){
     s = false;
  }
  if (key == 'a'){
   a = false;
  }
 if (key == 'd'){
   d = false;
  }
}
