class Vegetable {
  private float mass;
  private PVector location;
  private PVector velocity;
  private PVector gravity;
  private PVector acceleration;
  private boolean caught;
  private int col;
  
  Vegetable(float x, float y, float xVel, float yVel, float size, int col) {
    location = new PVector(x,y);
    velocity = new PVector(xVel, yVel);
    gravity = new PVector(0, 3);
    mass = size;
    caught = false;
    this.col = col;
  }
  void move() {
    if (!caught) {
     
      acceleration = PVector.div(gravity, mass);
      velocity.add(acceleration);
      location.add(velocity);
      bounce();
      velocity.limit(20);
      acceleration.set(0,0);
    }
  }
  void bounce() {
     float radius = mass / 2;
        
    if (location.x - radius < 0) {
      location.x = radius;
      velocity.x *= -1;
    }
    if (location.x + radius > width) {
      location.x = width - radius;
      velocity.x *= -1;
    }
  }

  boolean display() {
    if (!caught && location.y > 0) {
      if (col == 1) {
        fill(255, 0, 0); // Red if col is 1
      } else if (col == 2) {
        fill(0, 255, 0); // Green if col is 2
      } else if (col == 3) {
        fill(255, 165, 0); // Orange if col is 3
      } else {
        // Default to black if col is not 1, 2, or 3 just for structural
        fill(0);
      }
      ellipse(location.x, location.y, mass, mass);
      return true;
    }
    return false;
  }
  boolean isCaught(float mouseX, float mouseY) {
    float distance = dist(mouseX, mouseY, location.x, location.y);
    return distance < mass / 2;
  }

  void caught() {
    caught = true;
  }
 
  boolean isCaught() {
     return caught; 
  }
}
