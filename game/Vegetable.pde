class Vegetable {
  private float mass;
  private PVector location;
  private PVector velocity;
  private PVector gravity;
  private PVector acceleration;
  
  Vegetable(float x, float y, float xVel, float yVel, float size) {
    location = new PVector(x,y);
    velocity = new PVector(xVel, yVel);
    gravity = new PVector(0, 0.01);
    mass = size;
  }
  void move() {
    acceleration = PVector.div(gravity, mass);
    location.add(velocity);
    velocity.add(acceleration);
    velocity.limit(5);
    acceleration.set(0,0);
  }
  
}
