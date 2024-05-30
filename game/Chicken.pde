class Chicken {
  private PVector location;
  private PVector velocity;
  //private float mass;
  private boolean caught;
  
  Chicken(float x, float y, float xVel, float yVel) {
    location = new PVector(x, y); 
    velocity = new PVector(xVel, yVel);
    caught = false;
  }
  
  void move() {
    if (!caught) {
       location.add(velocity);
       velocity.limit(10); // may change value
    }
  }
  
  void bounce() {
    if (location.x > width || location.x < 0) {
      velocity.x *= -1; // Change direction
    }
    
    if (location.y > height || location.y < 0) {
      velocity.y *= -1; // Change direction
    }
  }
  
  void stopIfClicked() {
    if (mousePressed) {
      if (mouseX > location.x - 40 && mouseX < location.x + 40 &&
          mouseY > location.y - 40 && mouseY < location.y + 40) {
        caught = true;
      }
    }
  }
  

  void display(){
    PImage chicken = loadImage("assets/chicken.png");
    image(chicken, location.x, location.y);
    
  }
  
}
