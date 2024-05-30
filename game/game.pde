public class Game{
Curry curry;
int points;

void setup() {
  size(800, 600);
  curry = new Curry();
    
}

void draw() {
  background(255);
  curry.update();
}

void mousePressed() {
  curry.mousePressed();
}
