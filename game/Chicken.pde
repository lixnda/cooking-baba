class Chicken {
  private PVector location;
  private PVector velocity;
  private float mass;
  private boolean caught;
  private boolean stopped;
  
  Chicken(float x, float y, float xVel, float yVel) {
    location = new PVector(x, y); 
    velocity = new PVector(xVel, yVel);
  }
  void move() {
    if (!stopped) {
       location.add(velocity);
       velocity.limit(5); // may change value
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
      float chickenRadius = mass / 2; 
      if (mouseX > location.x - chickenRadius && mouseX < location.x + chickenRadius &&
          mouseY > location.y - chickenRadius && mouseY < location.y + chickenRadius) {
        stopped = true;
        caught = true;
      }
    }
  }
  boolean isCaught(){
    return caught;
  }
  
}
