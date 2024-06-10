import java.util.ArrayList;
class Curry {
  private boolean ingredientsCaught;
  private boolean prepared;
  private boolean stirred;
  private boolean served;
  private boolean poured;
  private int peelerSize;
  private ArrayList<Vegetable> vegetables = new ArrayList<Vegetable>();
  private PVector startPosition;
  private float distanceStirred;
  private float requiredDistance;
  private int points;
  private String[] games = {"catch", "peel", "stir", "pour"};
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
  
  Curry() {
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
    totalArea = PI * sq(100); // Area of the circle with radius 100
    catchIngredients();
    done0 = loadImage("assets/done0.png");
    done1 = loadImage("assets/done1.png");
    done0.resize(600, 900);
    done1.resize(600, 900);
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
        current = games[level];
        level++;
      }
    }
    if (current.equals("catch") && !levelDone) {
      PImage bg = loadImage("assets/grass.png");
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
      if (frames > 300 || veggies == 3) {
        current = "leveldone";
        for (Vegetable v : vegetables) {
          if (v.isCaught()) {
            points++;
          }
        }
      }
    }
    else if (current.equals("peel") && !levelDone) {
      PImage bg = loadImage("assets/kitchen.png");
      bg.resize(600,900);
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
      peelGraphics.ellipse(x - (width/2 - 100), y - (height/2 - 100), 10, 10); 
      peelGraphics.endDraw();
      peeledArea += PI * sq(5); 
      peeledPart.add(p);
    }
  }

  boolean isPeeled(PVector p) {
    for (PVector pv : peeledPart) {
      if (PVector.dist(p, pv) < 5) { 
        return true;
      }
    }
    return false;
  }

 void mousePressed() {
    for (Vegetable v : vegetables) {
      if (v.isCaught(mouseX, mouseY)) {
        v.caught();
      }
    }
  }
  

  void mouseDragged() {
    if (current.equals("peel") && !levelDone) {
      peel(mouseX, mouseY);
    }
  }


  int points() {
    return points;
  }
}
 
  
  
