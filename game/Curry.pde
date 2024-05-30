import java.util.ArrayList;
class Curry extends Recipe {
 private boolean poured;
 private int peelerSize;
 private ArrayList<Vegetable> vegetables = new ArrayList<Vegetable>();
 private PVector startPosition;
 private float distanceStirred;
 private float requiredDistance;
 private int points;

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
    int veggies = 0;
    for (Vegetable v : vegetables) {
      v.move();
      if (!v.display()) {
        veggies++;
      }
      if (veggies == 3){
        setIngredients(true);
        break;
      }
    }
    
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
  
