class Decor{
  PImage strawberry, frosting, sprinkle, cherry, chocolate, background, cake, kiss, straw, frost;
  String current = "";
  ArrayList<PVector> strawberryP, frostingP, sprinkleP, cherryP, chocolateP;
  
  Decor(){
    strawberryP = new ArrayList<PVector>();
    frostingP = new ArrayList<PVector>();
    sprinkleP = new ArrayList<PVector>();
    cherryP = new ArrayList<PVector>();
    chocolateP = new ArrayList<PVector>();
    
    strawberry = loadImage("assets/strawberry.png");
    straw = loadImage("assets/strawberry.png");
    frosting = loadImage("assets/frosting.png");
    frost = loadImage("assets/frosting.png");
    sprinkle = loadImage("assets/sprinkle.png");
    cherry = loadImage("assets/cherry.png");
    chocolate = loadImage("assets/chocolate.png");
    kiss = loadImage("assets/kiss.png");
    background = loadImage("assets/kitchen.png");
    cake = loadImage("assets/cake.png");
    strawberry.resize(120, 120);
    straw.resize(70, 70);
    frosting.resize(120, 120);
    frost.resize(60, 60);
    sprinkle.resize(120, 120);
    cherry.resize(120, 120);
    chocolate.resize(120, 120);
    kiss.resize(50, 50);
    cake.resize(600, 0);
    background.resize(600, 900);
  }
  
  void display(){
    int h = 50;
    image(background, 0, 0);
    image(cake, 0, 240);
    image(strawberry, 0, h);
    image(frosting, 120, h);
    image(sprinkle, 240, h);
    image(cherry, 360, h);
    image(chocolate, 480, h);
    
    text("current " + current, 50, 30);
    
    for(PVector p: strawberryP){
      image(straw, p.x, p.y);
    }
    for(PVector p: frostingP){
      image(frost, p.x, p.y);
    }
    for(PVector p: sprinkleP){
      image(sprinkle, p.x, p.y);
    }
    for(PVector p: cherryP){
      image(cherry, p.x, p.y);
    }
    for(PVector p: chocolateP){
      image(kiss, p.x, p.y);
    }
    
  }
  
  void mousePressed(){
    
    if(mouseX>=0 && mouseX<120 && mouseY>=50 && mouseY<170){
      current = "strawberry";
    }
    else if(mouseX>=120 && mouseX<240 && mouseY>=50 && mouseY<170){
      current = "frosting";
    }
    else if(mouseX>=240 && mouseX<360 && mouseY>=50 && mouseY<170){
      current = "sprinkle";
    }
    else if(mouseX>=360 && mouseX<480 && mouseY>=50 && mouseY<170){
      current = "cherry";
    }
    else if(mouseX>=480 && mouseX<600 && mouseY>=50 && mouseY<170){
      current = "chocolate";
    }
    
    if(mouseY>=240){
      if(current.equals("strawberry")){
        strawberryP.add(new PVector(mouseX-35, mouseY-35));
      }
      if(current.equals("frosting")){
        frostingP.add(new PVector(mouseX-30, mouseY-30));
      }
      if(current.equals("sprinkle")){
        sprinkleP.add(new PVector(mouseX-60, mouseY-60));
      }
      if(current.equals("cherry")){
        cherryP.add(new PVector(mouseX-60, mouseY-60));
      }
      if(current.equals("chocolate")){
        chocolateP.add(new PVector(mouseX-25, mouseY-25));
      }
    }
  }
}
