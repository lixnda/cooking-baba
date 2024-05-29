Curry curry;

void setup() {
  size(800, 600);
  curry = new Curry();
    // Call catchIngredients directly for testing
}

void draw() {
  background(255);
  curry.update();
  // curry.stir();  // Comment out stir for now if not needed
}

void mousePressed() {
  curry.mousePressed();
}
