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
  //void update() {
  //  int veggies = 0;
  //  for (Vegetable v : vegetables) {
  //    v.move();
  //    if (!v.display()) {
  //      veggies++;
  //    }
  //    if (veggies == 3){
  //      setIngredients(true);
  //      break;
  //    }
  //  }
    
  //}
  
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
     textSize(50);
     fill(0);
     text("time left: " + ((levelTime-frames)/30), 25, 50);
     if (frames > 300) {
       levelDone = true;
      for (Vegetable v : vegetables) {
        if (v.isCaught()) {
          points++;
        }
      }
     }
    }
    if (current.equals("peel") && !levelDone) {
      image(pg, width/2, height/2);
      image(peelGraphics, width/2, height/2);
      drawUnpeeled();
    }
     
 }
 
 void drawUnpeeled(){
   pg.beginDraw();
   pg.background(0, 255, 0);
   pg.endDraw();
 }
 
 void peel(float x, float y) {
   peelGraphics.beginDraw();
   peelGraphics.fill(0, 255, 0);
   peelGraphics.noStroke();
   peelGraphics.ellipse(x - width/2 + 100, y - height / 2 + 100, 10, 10);
   peelGraphics.endDraw();
 }
 
 void mousePressed() {
    for (Vegetable v : vegetables) {
      if (v.isCaught(mouseX, mouseY)) {
        v.caught();
      }
    }
  }


  
  int points() {
      return points;
    }
}

 
  
  
  
