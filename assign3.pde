final int GAME_START = 0, GAME_RUN = 1, GAME_OVER = 2;
int gameState = 0;

final int GRASS_HEIGHT = 15;
final int START_BUTTON_W = 144;
final int START_BUTTON_H = 60;
final int START_BUTTON_X = 248;
final int START_BUTTON_Y = 360;

PImage life, cabbage;
PImage title, gameover, startNormal, startHovered, restartNormal, restartHovered;
PImage groundhogIdle, groundhogDown, groundhogLeft, groundhogRight;

PImage bg, soil0, soil1, soil2, soil3, soil4, soil5, stone1, stone2;
final int soil_W = 80;
final int soil_H = 80;
final int soilX = 0;
final int soilY = 160;

final int stoneX = 0;
final int stoneY = 160;
final int stone_W = 80;
final int stone_H = 80;

final int lifeX = 10;
final int lifeY = 10;
final int lifeWidth = 50;
int lifeV=2;

float groundhogX, groundhogY;
float dstX,dstY;

// For debug function; DO NOT edit or remove this!
int playerHealth = 0;
float cameraOffsetY = 0;
boolean debugMode = false;

void setup() {
	size(640, 480, P2D);
	// Enter your setup code here (please put loadImage() here or your game will lag like crazy)
	bg = loadImage("img/bg.jpg");
	title = loadImage("img/title.jpg");
	gameover = loadImage("img/gameover.jpg");
	startNormal = loadImage("img/startNormal.png");
	startHovered = loadImage("img/startHovered.png");
	restartNormal = loadImage("img/restartNormal.png");
	restartHovered = loadImage("img/restartHovered.png");
	life = loadImage("img/life.png");
  cabbage = loadImage("img/cabbage.png");
  groundhogIdle = loadImage("img/groundhogIdle.png");
  groundhogDown = loadImage("img/groundhogDown.png");
  groundhogLeft = loadImage("img/groundhogLeft.png");
  groundhogRight = loadImage("img/groundhogRight.png");
  soil0 = loadImage("img/soil0.png");
  soil1 = loadImage("img/soil1.png");
  soil2 = loadImage("img/soil2.png");
  soil3 = loadImage("img/soil3.png");
  soil4 = loadImage("img/soil4.png");
  soil5 = loadImage("img/soil5.png");
  stone1 = loadImage("img/stone1.png");
  stone2 = loadImage("img/stone2.png");
  
  //Grounghog plase
  groundhogX = width/2;
  groundhogY = 80;
  //goal
  dstX=width/2;
  dstY=80;

}

void draw() {
    /* ------ Debug Function ------ 

      Please DO NOT edit the code here.
      It's for reviewing other requirements when you fail to complete the camera moving requirement.

    */
    if (debugMode) {
      pushMatrix();
      translate(0, cameraOffsetY);
    }
    /* ------ End of Debug Function ------ */

    
	switch (gameState) {

		case GAME_START: // Start Screen
		image(title, 0, 0);

		if(START_BUTTON_X + START_BUTTON_W > mouseX
	    && START_BUTTON_X < mouseX
	    && START_BUTTON_Y + START_BUTTON_H > mouseY
	    && START_BUTTON_Y < mouseY) {

			image(startHovered, START_BUTTON_X, START_BUTTON_Y);
			if(mousePressed){
				gameState = GAME_RUN;
				mousePressed = false;
			}

		}else{

			image(startNormal, START_BUTTON_X, START_BUTTON_Y);

		}
		break;

		case GAME_RUN: // In-Game

		// Background
		image(bg, 0, 0);

		// Sun
	  stroke(255,255,0);
	  strokeWeight(5);
	  fill(253,184,19);
	  ellipse(590,50,120,120);

		// Grass
		fill(124, 204, 25);
		noStroke();
		rect(0, 160 - GRASS_HEIGHT, width, GRASS_HEIGHT);

		// Soil - REPLACE THIS PART WITH YOUR LOOP CODE!
		for(int i = 0 ; i <= 8 ; i++){
      for(int n = 0; n <= 4 ; n++){
        image(soil0, soilX+(soil_W*i), soilY+(soil_H*n));
      }
      for(int n = 0; n <= 4 ; n++){
        image(soil1, soilX+(soil_W*i), soilY+(soil_H*(4+n)));
      }
      for(int n = 0; n <= 4 ; n++){
        image(soil2, soilX+(soil_W*i), soilY+(soil_H*(8+n)));
      }
      for(int n = 0; n <= 4 ; n++){
        image(soil3, soilX+(soil_W*i), soilY+(soil_H*(12+n)));
      }
      for(int n = 0; n <= 4 ; n++){
        image(soil4, soilX+(soil_W*i), soilY+(soil_H*(16+n)));
      }
      for(int n = 0; n <= 4 ; n++){
        image(soil5, soilX+(soil_W*i), soilY+(soil_H*(20+n)));
      }
    }
    //stone in line 1-8
    for(int i = 0 ; i <= 8 ; i++){
      image(stone1, stoneX+(stone_W*i), stoneY+(stone_H*i));
    }
    //stone in line 9-16
    for(int n = 0 ; n <= 1 ; n++){
      for(int i = 0; i <= 1 ; i++){
        image(stone1, 80+(320*i), 800+(320*n));
        image(stone1, 160+(320*i), 800+(320*n));
        image(stone1, 0+(320*i), 880+(320*n));
        image(stone1, 240+(320*i), 880+(320*n));
        image(stone1, 0+(320*i), 960+(320*n));
        image(stone1, 240+(320*i), 960+(320*n));
        image(stone1, 80+(320*i), 1040+(320*n));
        image(stone1, 160+(320*i), 1040+(320*n));
      }
    }
    //stone in line 17-24
    for(int n = 0 ; n <= 2 ; n++){
      for(int i = 0; i <= 2 ; i++){
        image(stone1, 80+(240*i), 1440+(240*n));
        image(stone1, 160+(240*i), 1440+(240*n));
        image(stone1, 0+(240*i), 1520+(240*n));
        image(stone1, 80+(240*i), 1520+(240*n));
        image(stone1, 0+(240*i), 1600+(240*n));
        image(stone1, 160+(240*i), 1600+(240*n));
      }
    }
    //stone2 in line 17-24
    for(int n = 0 ; n <= 2 ; n++){
      for(int i = 0; i <= 2 ; i++){
        image(stone2, 160+(240*i), 1440+(240*n));
        image(stone2, 80+(240*i), 1520+(240*n));
        image(stone2, 0+(240*i), 1600+(240*n));
      }
    }
    
		// Player
      //Boundary Lock
      if(dstX + 80 > width){
        dstX = width-80;
      }
      if(dstX < 0){
        dstX = 0;
      }
      if(dstY > height-80){
        dstY = height-80;
      }
      
       if(dstY>groundhogY)
       {
         groundhogY+=80/15;    
         image(groundhogDown, groundhogX, groundhogY);
       }
       else  if(dstX>groundhogX)
       {
         groundhogX+=80/15;
         image(groundhogRight, groundhogX, groundhogY);  
       }
       else if(dstX<groundhogX)
       {        
         groundhogX-=80/15;
         image(groundhogLeft, groundhogX, groundhogY);          
     }
       else
       {
         image(groundhogIdle, groundhogX, groundhogY);     
       }


      //Boundary Lock
      if(groundhogX + 80 > width){
        groundhogX = width-80;
      }
      if(groundhogX < 0){
        groundhogX = 0;
      }
      if(groundhogY > height-80){
        groundhogY = height-80;
      }
      

		// Health UI
    for(int i = 0 ; i <= 1 ; i++){
      image(life , lifeX+(lifeWidth+20)*i , lifeY);
    }

		break;

		case GAME_OVER: // Gameover Screen
		image(gameover, 0, 0);
		
		if(START_BUTTON_X + START_BUTTON_W > mouseX
	    && START_BUTTON_X < mouseX
	    && START_BUTTON_Y + START_BUTTON_H > mouseY
	    && START_BUTTON_Y < mouseY) {

			image(restartHovered, START_BUTTON_X, START_BUTTON_Y);
			if(mousePressed){
				gameState = GAME_RUN;
				mousePressed = false;
				// Remember to initialize the game here!
			}
		}else{

			image(restartNormal, START_BUTTON_X, START_BUTTON_Y);

		}
		break;
		
	}

    // DO NOT REMOVE OR EDIT THE FOLLOWING 3 LINES
    if (debugMode) {
        popMatrix();
    }
}

void keyPressed(){
	// Add your moving input code here
  if (key == CODED && dstY==groundhogY && dstX==groundhogX) { // detect special keys 
    switch (keyCode) {
      case DOWN:        
        dstY+=80;
        break;
      case LEFT:
        dstX-=80;
        break;
      case RIGHT:
        dstX+=80;
        break;
    }
  }

	// DO NOT REMOVE OR EDIT THE FOLLOWING SWITCH/CASES
    switch(key){
      case 'w':
      debugMode = true;
      cameraOffsetY += 25;
      break;

      case 's':
      debugMode = true;
      cameraOffsetY -= 25;
      break;

      case 'a':
      if(playerHealth > 0) playerHealth --;
      break;

      case 'd':
      if(playerHealth < 5) playerHealth ++;
      break;    
    }
}

void keyReleased(){
}
