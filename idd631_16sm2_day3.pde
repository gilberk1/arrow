int numAcross = 12;
int numDown = 24;
int alphaStart = 255;
int alpha = 255;
int alphaColor = 255;

color gray = color(128, 128, 128, alpha);
color red = color(228, 3, 3, alphaColor);
color orange = color(255, 140, 0, alphaColor);
color yellow = color(255, 237, 0, alphaColor);
color green = color(0, 128, 38, alphaColor);
color blue = color(0, 77, 255, alphaColor);
color purple = color(117, 7, 135, alphaColor);

void setup() {
  size(300, 600);
  strokeWeight(1);
  noFill();
  rectMode(CORNER);
  background(255);
  
  float squareWidth = width/numAcross;
  
  for (int j = 0; j < numDown; j++) {
    //add an alpha change based off of the location down
    //alpha for gray
    if(j < (numDown/3)) {
      alpha = 255-j*alphaStart/(numDown/3);
    }
    //alpha for rainbow
    if(j >= (numDown/3)) {
      alphaColor = 255-(255-(j-numDown/3)*alphaStart/(2*numDown/3));
    }
    
    for (int i = 0; i < numAcross; i++) {
      //fill for squares
      //fill for gray
      if(j < (numDown/3)) {
        fill(gray, alpha);
      }
      //fill for rainbow based off location across
      if(j >= (numDown/3)) {
        if(i < (numAcross/6)) {
          fill(red, alphaColor);
        }
        else if((numAcross/6) <= i && i < (numAcross/3)) {
          fill(orange, alphaColor);
        }
        else if((numAcross/3) <= i && i < (numAcross/2)) {
          fill(yellow, alphaColor);
        }
        else if((numAcross/2) <= i && i < (2*numAcross/3)) {
          fill(green, alphaColor);
        }
        else if((2*numAcross/3) <= i && i < (5*numAcross/6)) {
          fill(blue, alphaColor);
        }
        else {
          fill(purple, alphaColor);
        }
      }
      
      float x = i * squareWidth;
      float y = j * squareWidth;
      
      pushMatrix();
      translate(x, y);
      
      float deg = map(y, 0, height, 0, 45);
      float direction = random(-1, 1);
      
      if(direction < 0) {
        direction = -1;
      }
      else {
        direction = 1;
      }
      
      float vertPos = map(y, 0, height, 0, squareWidth);
      
      rotate(random(radians(direction * deg)));
      rect(random(vertPos), random(vertPos), squareWidth, squareWidth);
      popMatrix();
    }
  }
  
  //saves art image each time it is run
  save("color.png");
}