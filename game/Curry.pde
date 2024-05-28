import java.util.ArrayList;
class Curry extends Recipe {
 private boolean poured;
 private int peelerSize;
 private ArrayList<Vegetable> vegetables = new ArrayList<Vegetable>();
 private float distanceStirred;
  private float requiredDistance;

 Curry() {
   super();
   requiredDistance = 100;
   startPosition = new PVector(mouseX, mouseY);
 }
 
 
 void catchIngredients() {
   Vegetable veggie1 = new Vegetable(random(0, width), height, 0, 10, 50);
   
 }
}
