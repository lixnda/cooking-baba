class Pour {
  PImage bowl, corriander, pepper, chicken, background;
  String current = "";
  ArrayList<PVector> corrianderP, pepperP, chickenP;
  
  Pour() {
    corrianderP = new ArrayList<PVector>();
    pepperP = new ArrayList<PVector>();
    chickenP = new ArrayList<PVector>();
  }
  text("current " + current, 50, 30);
  void display() {
    for(PVector p: corrianderP){
      image(, p.x, p.y);
    }
    for(PVector p : pepperC) {
     
    }
  }
}
