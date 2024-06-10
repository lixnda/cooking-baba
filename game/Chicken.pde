class Chicken{
  private PVector location;
  private PVector velocity;
  //private float mass;
  private boolean caught;
  private Gif gif;
  private PApplet p;
  
  Chicken(PApplet p, float x, float y, float xVel, float yVel) {
    this.p = p;
    location = new PVector(x, y); 
    velocity = new PVector(xVel, yVel);
    caught = false;
    gif = new Gif(p, "assets/chicken.gif");
    gif.loop();
    
  }
  
  boolean isCaught(){
    return caught;
  }
  
  void move() {
    if (!caught) {
       location.add(velocity);
       velocity.limit(7); // may change value
    }
    else{
      gif.stop();
    }
  }
  
  void bounce() {
    if (location.x > p.width || location.x < 0) {
      velocity.x *= -1; // Change direction
    }
    
    if (location.y > p.height || location.y < 0) {
      velocity.y *= -1; // Change direction
    }
  }
  
  void stopIfClicked() {
    if (mousePressed) {
      if (mouseX > location.x && mouseX < location.x + 100 &&
          mouseY > location.y && mouseY < location.y + 100) {
        caught = true;
      }
    }
  }
  

  void display(){
    //PImage chicken = loadImage("assets/chicken.png");
    p.image(gif, location.x, location.y);
    
  }
  
}
