public PImage landscape;
public PImage drone; 
public PImage covidImg;
public PImage bulletImg;

private boolean a, w, d, s;
public int gameOver = 0;
public int points = 0;
public int life = 5;
public int counter = 6;
ArrayList<COVID> covid = new ArrayList<COVID>();
ArrayList <Bullet> bullets = new ArrayList <Bullet> ();

public void setup() 
{
  
  size(1450, 800);
  landscape = loadImage("landscape.png");
  drone = loadImage("drone.png");
  covidImg = loadImage("COVID.png");
  bulletImg = loadImage("bullet.png");
  
  for(int i = 0; i < 40; i++){
    covid.add(new COVID(covidImg));
  }
  
}

Spaceship ship = new Spaceship(drone);

public void draw() 
{
 
 background(0);
 landscape.resize(width, height);
 image(landscape, 0, 0);
 //image(drone, 0, 0);
  
  
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
  if(!w && !s){
   ship.setDirectionX(ship.getDirectionX() * .95); 
   ship.setDirectionY(ship.getDirectionY() * .95);
  }
  if (w){
      ship.accelerate(0, -0.2);
  }
  if (s){
      ship.accelerate(0, 0.2);
  }
  if (a){
     ship.accelerate(-0.2, 0);
  }
  if (d){
    ship.accelerate(0.2, 0);
  }
  ship.move();
  ship.show();

  for(int h = 0; h < bullets.size(); h++){
    bullets.get(h).show();
    bullets.get(h).move();
   }
    
  for(int i = 0; i < covid.size(); i++){
    covid.get(i).show();
    covid.get(i).move();
    
    float distance = dist(ship.getX(), ship.getY(), covid.get(i).getX(), covid.get(i).getY());
    if(distance <= 40){
      covid.remove(i);
      covid.add(new COVID(covidImg));
      covid.add(new COVID(covidImg));
      gameOver++;
      life--;
    }
      
  }

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
  
  if(key == ' '){
   bullets.add(new Bullet(ship, bulletImg)); 
  }
}

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