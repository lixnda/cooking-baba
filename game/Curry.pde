import java.util.ArrayList;
class Curry {
  private int peelerSize;
  private ArrayList<Vegetable> vegetables = new ArrayList<Vegetable>();
  private PVector startPosition;
  private float distanceStirred;
  private float requiredDistance;
  private int points;
  private String[] games = {"catch", "peel", "boil", "pour"};
  private String current;
  private int frames;
  private int levelTime;
  private boolean levelDone;
  private int level;
  private PGraphics pg;
  private PGraphics peelGraphics;
  private float peeledArea;
  private float totalArea;
  private float requiredPeelPercentage;
  private ArrayList<PVector> peeledPart = new ArrayList<PVector>();
  PImage done0;
  PImage done1;
  PImage end;
  ArrayList<Gif> starList;
  Pour c;
  Boil b;
  
  Curry(PApplet p) {
    starList = new ArrayList<Gif>();
    for(int i = 0; i<5; i++){
      starList.add(new Gif(p, "assets/star.gif"));
      starList.get(i).loop();
    }
    requiredDistance = 100;
    startPosition = new PVector(mouseX, mouseY);
    current = "catch";
    points = 0;
    frames = 0;
    frameRate(30);
    levelDone = false;
    pg = createGraphics(200, 200);
    peelGraphics = createGraphics(200, 200);
    requiredPeelPercentage = 0.9; 
    peeledArea = 0;
    totalArea = PI * sq(100); 
    catchIngredients();
    done0 = loadImage("assets/done0.png");
    done1 = loadImage("assets/done1.png");
    done0.resize(600, 900);
    done1.resize(600, 900);
    end = loadImage("assets/end.png");
    end.resize(600,900);
    c = new Pour();
    b = new Boil();
  }
  
  void catchIngredients() {
    Vegetable veggie = new Vegetable(random(0, width), 0, random(-1, 1), random(1, 3), 50, 1);
    Vegetable veggie2 = new Vegetable(random(0, width), 0, random(-1, 1), random(1, 3), 50, 2);
    Vegetable veggie3 = new Vegetable(random(0, width), 0, random(-1, 1), random(1, 3), 50, 3);
    Vegetable veggie4 = new Vegetable(random(0, width), 0, random(-1, 1), random(1, 3), 50, 1);
    Vegetable veggie5 = new Vegetable(random(0, width), 0, random(-1, 1), random(1, 3), 50, 2);
    Vegetable veggie6 = new Vegetable(random(0, width), 0, random(-1, 1), random(1, 3), 50, 3);
    vegetables.add(veggie);
    vegetables.add(veggie2);
    vegetables.add(veggie3);
    vegetables.add(veggie4);
    vegetables.add(veggie5);
    vegetables.add(veggie6);
  }

  void display() {
    frames++;
    if(current.equals("leveldone")){
      frames = 0;
      if(second()%2==0){
      image(done0, 0, 0);
      }
      else{
        image(done1,0,0);
      }
      textSize(50);
      fill(#FFFFFF);
      text("press n to continue \n current points: " + points, 100, 500, 450, 500);
      if(keyPressed==true&&key=='n' && level<4){
                level++;
        current = games[level];
      }
    }
    if (current.equals("catch")) {
      PImage bg = loadImage("assets/grass.png");
      image(bg, 0, 0);
      bg.resize(600,900);
      levelTime = 300;
      for (Vegetable v : vegetables) {
        v.move();
        v.display();
      }
      int veggies = 0;
      for (Vegetable v : vegetables) {
         if (v.isCaught()) {
            veggies++;
          }
      }
      textSize(50);
      fill(0);
      text("time left: " + ((levelTime-frames)/30), 25, 50);
      if (frames > 300 || veggies == 6) {
        for (Vegetable v : vegetables) {
          if (v.isCaught()) {
            points++;
          }
        }
         current = "leveldone";
      }
    }
    else if (current.equals("peel")) {
      PImage bg = loadImage("assets/kitchen.png");
      bg.resize(600,900);
      image(bg, 0, 0);
      image(pg, width/2 - 100, height/2 - 100); 
      image(peelGraphics, width/2 - 100, height/2 - 100);
      drawUnpeeled();
      textSize(50);
      fill(0);
      text("Peeled: " + ((peeledArea / totalArea) * 100) + "%", 50, 50);
      textSize(50);
      fill(0);
      text("time left: " + ((levelTime-frames)/30), 50, 100);
      //60fps?
      if(frames>300){
        peelPoints(peeledArea / totalArea);
        current = "leveldone";
      }
    }
    else if (current.equals("boil")) {
       b.display();
       if (!b.isActive()) {
         points = b.getPoints();
         current = "leveldone";
       }
    }
    else if (current.equals("pour")){
       c.display();
      fill(#FFFFFF);
      text("press k to continue", 140, 200);
      if(keyPressed==true&&key=='k'){
        current = "done";
        level++;
      }
    }
    else if(current.equals("done")){
      image(end, 0, 0);
      c.fin();
      level = 0;
      textAlign(CENTER);
      fill(#FFFFFF);
      text("Click N to Exit", 300, 300);
      if(points>=2){
        image(starList.get(0), 0, 100);
      }
      if(points>=4){
        image(starList.get(1), 120, 100);
      }
      if(points>=6){
        image(starList.get(2), 240, 100);
      }
      if(points>=8){
        image(starList.get(3), 360, 100);
      }
      if(points==10){
        image(starList.get(4), 480, 100);
      }
    }
  }
  void peelPoints(float percent) {
    if (percent >= 0.9) {
      points += 4; 
    }
    else if (percent >= 0.6) {
      points += 3;
    }
    else if (percent >= 0.3) {
      points += 2;
    }
    else if (percent >= 0.1) {
      points++;
    }
    
  }
  void drawUnpeeled(){
    pg.beginDraw();
    pg.fill(255, 0, 0); 
    pg.ellipse(100, 100, 200, 200); 
    pg.noStroke(); 
    pg.endDraw();
  }

  void peel(float x, float y) {
    float distance = dist(x, y, width / 2, height / 2);
    PVector p = new PVector(x, y);

    if (distance <= 100 && !isPeeled(p)) {
      peelGraphics.beginDraw();
      peelGraphics.fill(255, 128, 128); 
      peelGraphics.noStroke();
      peelGraphics.ellipse(x - (width / 2 - 100), y - (height / 2 - 100), 10, 10); 
      peelGraphics.endDraw();
      for (int i = -5; i <= 5; i++) {
        for (int j = -5; j <= 5; j++) {
          PVector pixel = new PVector(x + i, y + j);
          if (!isPeeled(pixel)) {
            peeledArea++;
            peeledPart.add(pixel);
          }
        }
      }
    }
  }

  boolean isPeeled(PVector p) {
    for (PVector pv : peeledPart) {
      if (PVector.dist(p, pv) < 1) { 
        return true;
      }
    }
    return false;
  }

 void mousePressed() {
   if (current.equals("catch")) {
     for (Vegetable v : vegetables) {
      if (v.isCaught(mouseX, mouseY)) {
        v.caught();
      }
    }
   }
   if (current.equals("pour")) {
     c.mousePressed();
   }
  }
  

  void mouseDragged() {
    if (current.equals("peel") && !levelDone) {
      peel(mouseX, mouseY);
    }
  }
  void keyPressed() {
    b.keyPressed();
  }

  int points() {
    return points;
  }
}
 
  
  
