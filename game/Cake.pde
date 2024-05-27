ArrayList<Chicken> ChickenList;
int finished = 0;
int points;
  
void setup() {
    size(600, 900);
    PImage bg = loadImage("bg.png");
    image(bg, 0, 0);
    ChickenList = new ArrayList<Chicken>();
    for(int i = 0; i<=15; i++){
      ChickenList.add(new Chicken(random(50,70), random(100,150),random(-10,10),random(-10,10)));
    }
} 

void draw() {
  if(keyPressed||key=='p'){
    background(20);
    for(Chicken c: ChickenList){
      c.display();
      c.move();
      c.bounce();
      c.stopIfClicked();
    }
  }
}
