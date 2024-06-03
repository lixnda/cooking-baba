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
  }
  
  void catchIngredients() {
    Vegetable veggie = new Vegetable(random(0, width), 0, random(-1, 1), random(1, 3), 50, 1);
    Vegetable veggie2 = new Vegetable(random(0, width), 0, random(-1, 1), random(1, 3), 50, 2);
    Vegetable veggie3 = new Vegetable(random(0, width), 0, random(-1, 1), random(1, 3), 50, 3);
    vegetables.add(veggie);
    vegetables.add(veggie2);
    vegetables.add(veggie3);
  }

<<<<<<< HEAD
  void display() {
    frames++;
    if(levelDone){
      frames = 0;
      background(0);
      textSize(50);
      fill(200);
      text("press n to continue \n current points: " + points, 100, 500, 450, 500);
      if(key=='n' && level<5){
        level++;
        current = games[level];
        levelDone = false;
      }
    }
    if (current.equals("catch") && !levelDone) {
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
        levelDone = true;
        for (Vegetable v : vegetables) {
          if (v.isCaught()) {
            points++;
          }
        }
      }
    }
    else if (current.equals("peel") && !levelDone) {
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
        levelDone = true;
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
=======
 Curry() {
   super();
   requiredDistance = 100;
   startPosition = new PVector(mouseX, mouseY);
   catchIngredients();
 }
 
 
 void catchIngredients() {
     Vegetable veggie = new Vegetable(random(0, width), 0, random(-1, 1), random(1, 3), 50, 1);
     Vegetable veggie2 = new Vegetable(random(0, width), 0, random(-1, 1), random(1, 3), 50, 2);
     Vegetable veggie3 = new Vegetable(random(0, width), 0, random(-1, 1), random(1, 3), 50, 3);
     vegetables.add(veggie);
     vegetables.add(veggie2);
     vegetables.add(veggie3);
 }
 
  void update() {
    for (Vegetable v : vegetables) {
      v.move();
      v.display();
    }
  }
  
 void mousePressed() {
>>>>>>> refs/remotes/origin/main
    for (Vegetable v : vegetables) {
      if (v.isCaught(mouseX, mouseY)) {
        v.caught();
      }
    }
  }
  
<<<<<<< HEAD
  void mouseDragged() {
    if (current.equals("peel") && !levelDone) {
      peel(mouseX, mouseY);
    }
  }

=======
  //void isAllCaught() {
  //  for (Vegetable v : vegetables) {
  //    if (!v.isCaught()) {
  //        ingredientsCaught = false;
  //    }
  //  }
  //  ingredientsCaught = true;
  //}
  
>>>>>>> refs/remotes/origin/main
  int points() {
    return points;
  }
}
 
  
  
