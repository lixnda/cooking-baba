class Egg{
  private int mass;
  private PVector acceleration;
  
  Egg(int mass){
    this.mass = mass;
    acceleration = new PVector(0, 0);
  }
  
  boolean isLose(){
    acceleration.x = Math.abs(pmouseX-mouseX);
    acceleration.y = Math.abs(pmouseY-mouseY);
    
    PVector maxForce = new PVector(50, 50);
    PVector minForce = new PVector(25, 25);
    
    if(acceleration.mult(mass).mag()>maxForce.mag()||acceleration.mult(mass).mag()<minForce.mag()){
      return true;
    }
    else{
      return false;
    }
  }
  
  void display(){
    PImage egg = loadImage("assets/egg.jpg");
    image(egg, mouseX-100, mouseY-80);
    
  }
}
