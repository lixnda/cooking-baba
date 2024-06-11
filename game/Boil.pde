class Boil {
  float barX, barY, barWidth, barHeight;
  float targetX, targetWidth;
  float sliderX, speed;
  boolean sliderMovingRight;
  boolean gameActive;
  int points;
  PImage bg;

  Boil() {
   barX = 50;
    barY = 800;
    barWidth = 500;
    barHeight = 30;
    targetWidth = 75;
    targetX = barX + random(barWidth - targetWidth);
    sliderX = barX;
    speed = 10;
    sliderMovingRight = true;
    gameActive = true;
    points = 0;
    bg = loadImage("assets/kitchen.png");
    bg.resize(600,900);
  }
  
  int getPoints() {
    return points;
  }
  boolean isActive() {
    return gameActive;
  }
  void display() {
    image(bg, 0, 0);
    text("Press space when the slider is in the red to boil", 50, 30);
    fill(200);
    rect(barX, barY, barWidth, barHeight);
    fill(255, 0, 0);
    rect(targetX, barY, targetWidth, barHeight);
    fill(0);
    rect(sliderX, barY - 10, 10, barHeight + 20);
    if (gameActive) {
      if (sliderMovingRight) {
        sliderX += speed;
        if (sliderX + 10 > barX + barWidth) {
          sliderMovingRight = false;
        }
      } else {
        sliderX -= speed;
        if (sliderX < barX) {
          sliderMovingRight = true;
        }
      }
    }
  }
  
  void keyPressed() {
    if(key == ' ') {
      stopSlider();
    }
  }
  void stopSlider() {
    if (gameActive) {
      gameActive = false;

      if (sliderX >= targetX && sliderX + 10 <= targetX + targetWidth) {
        points += 5;       
      } 
      
    }
  }

}
