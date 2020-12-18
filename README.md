# Berkeley Pharma Tech Game

**Java files**

bpt_game.pde
- Essentially where the code for the game is located, connects all of the other Java files here
- Changes/modification/add-ons for how the game works are done here

Bullet.pde
- Sets the properties of bullets (direction, speed, position)

COVID.pde
- Sets the properties of COVID particles (direction, speed, position)

Floater.pde
- Abstract class, extended by the Bullet, COVID, and Spaceship class. 

Spaceship.pde
- Sets the properties of Spaceship (direction, speed, position)

**HTML files**

index.html
- Home page, the login/signup page
- Connects with script.js 
- Connects with style.css

game.html
- The page after a successful login, the game itself
- Connects with processing.js

**Javascript files**

script.js
- Where all Firebase code is located for user authentication (and possible database)	
- Firebase is Google's mobile application development platform that helps you build, improve, and grow your app
- Helpful videos for getting started with Firebase:
  - User Authentication: https://youtu.be/-OKrloDzGpU
  - Database: https://youtu.be/noB98K6A0TY

processing.js
- Connects code from Java to something HTML can read and show on a webpage
- Learn more about Processing here: https://processing.org/
  - Essentially Processing is an open-source Java library and IDE for creating visuals, which can be connected to HTML by using processing.js  

**CSS Files**

style.css
- Designing the format of the home page 

**Images**

landscape.png
- Background for game

drone.png 
- Design of the drone

bullet.png 
- Design of bullets

COVID.png 
- Design of COVID particles



