class Egg{
  private float mass;
  private PVector acceleration;
  private boolean cracked;
  private boolean lost;
  
  Egg(float mass){
    this.mass = mass;
    acceleration = new PVector(0, 0);
    cracked = false;
  }
  
  float getMass(){
    return mass;
  }
  
  boolean getCrack(){
    return cracked;
  }
  
  boolean getLost(){
    return cracked;
  }
  
  boolean tooSoft(){
    acceleration.x = Math.abs(pmouseX-mouseX);
    acceleration.y = Math.abs(pmouseY-mouseY);
    
    PVector minForce = new PVector(50, 50);

    if((dist(300, 800, mouseX, mouseY)<330)&&acceleration.mult(mass).mag()<minForce.mag()){
      return true;
    }
    else{
      return false;
    }
  }
  
  boolean tooHard(){
    acceleration.x = Math.abs(pmouseX-mouseX);
    acceleration.y = Math.abs(pmouseY-mouseY);
    PVector maxForce = new PVector(600, 600);
    
    if((dist(100, 800, mouseX, mouseY)<330)&&(acceleration.mult(mass).mag()>maxForce.mag())){
      lost = true;
      return true;
    }
    else{
      return false;
    }
  }
  
  void display(){

    PImage egg = loadImage("assets/egg.jpg");
    egg.resize(150*(int)mass/5, 150*(int)mass/5);
    float yx = constrain(mouseY, 0, 500);
    image(egg, mouseX-100, yx-100);
    
    fill(#fbefbf);
    ellipse(300, 800, 800, 600);
    fill(#FFFFFF);
    ellipse(300, 800, 700, 500);
    
    textSize(50);
    text("current acceleration" + acceleration.x + " " + acceleration.y, 10, 450);
    
    //if(!cracked&&tooHard()){
    //  lost = true;
    //  background(100);
    //  textSize(20);
    //  fill(200);
    //  text("too hard", 300, 450);
    //}
    //if(!lost&&dist(100, 800, mouseX, mouseY)<300&&!tooSoft()){
    //  cracked = true;
    //  background(100);
    //  textSize(50);
    //  fill(200);
    //  text("point", 300, 450);
    //}
    
  }
}
