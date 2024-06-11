class Pour {
  PImage bowl, coriander, cori, carrot, carr, celery, cel, background;
  String current = "";
  ArrayList<PVector> corianderP, carrotP, celeryP;
  
  Pour() {
    // Initialize position arrays
    corianderP = new ArrayList<PVector>();
    carrotP = new ArrayList<PVector>();
    celeryP = new ArrayList<PVector>();
    
    // Load images
    coriander = loadImage("assets/coriander.png");
    cori = loadImage("assets/coriander.png");
    carrot = loadImage("assets/carrot.png");
    carr = loadImage("assets/carrot.png");
    celery = loadImage("assets/celery.png");
    cel = loadImage("assets/celery.png");
    background = loadImage("assets/kitchen.png");
    bowl = loadImage("assets/curry.png");
    
    // Resize images
    coriander.resize(120, 120);
    cori.resize(70, 70);
    carrot.resize(120, 120);
    carr.resize(70, 70);
    celery.resize(120, 120);
    cel.resize(70, 70);
    background.resize(600, 900);
    bowl.resize(0, 600);
  }
  
  void display() {
    int y = 50;
    // Display background and images
    image(background, 0, 0);
    image(bowl, 0, 240);
    image(coriander, 0, y);
    image(carrot, 200, y);
    image(celery, 400, y);
    
    // Display current selection
    text("current " + current, 50, 30);
    
    // Display positioned items
    for (PVector p : corianderP) {
      image(cori, p.x, p.y);
    }
    for (PVector p : carrotP) {
      image(carr, p.x, p.y);
    }
    for (PVector p : celeryP) {
      image(cel, p.x, p.y);
    }
  }
  
  void fin() {
    // Display final items on bowl
    image(bowl, 0, 240);
    for (PVector p : corianderP) {
      image(cori, p.x, p.y);
    }
    for (PVector p : carrotP) {
      image(carr, p.x, p.y);
    }
    for (PVector p : celeryP) {
      image(cel, p.x, p.y);
    }
  }
  
  void mousePressed() {
    // Handle item selection
    if (mouseX >= 0 && mouseX < 200 && mouseY >= 50 && mouseY < 170) {
      current = "coriander";
    } else if (mouseX >= 200 && mouseX < 400 && mouseY >= 50 && mouseY < 170) {
      current = "carrot";
    } else if (mouseX >= 400 && mouseX < 600 && mouseY >= 50 && mouseY < 170) {
      current = "celery";
    }
    
    // Handle item placement
    if (mouseY >= 240) {
      if (current.equals("coriander")) {
        corianderP.add(new PVector(mouseX - 35, mouseY - 35));
      }
      if (current.equals("carrot")) {
        carrotP.add(new PVector(mouseX - 35, mouseY - 35));
      }
      if (current.equals("celery")) {
        celeryP.add(new PVector(mouseX - 35, mouseY - 35));
      }
    }
  }
}
