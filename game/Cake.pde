ArrayList<Chicken> ChickenList;
int finished = 0;
int points;
String current;
  
void setup() {
  current = "start";
  size(600, 900);
  PImage bg = loadImage("assets/bg.png");
  image(bg, 0, 0);
  ChickenList = new ArrayList<Chicken>();
  for(int i = 0; i<=15; i++){
    ChickenList.add(new Chicken(random(50,70), random(100,150),random(1,12),random(1,12)));
  }
} 

void draw() {
  if(current.equals("start")){
    PImage bg = loadImage("assets/bg.png");
    PImage bg0 = loadImage("assets/bg0.jpg");
    if(second()%2==0){
      image(bg0, 0, 0);
    }
    else{
      image(bg,0,0);
    }
  }
  if(key=='p'){
    current="chicken";
  }
  if(key=='e'){
    current="egg";
  }
  if(current.equals("chicken")){
    background(20);
    for(Chicken c: ChickenList){
      c.display();
      c.move();
      c.bounce();
      c.stopIfClicked();
    }
  }
  if(current.equals("egg")){
    background(0);
    Egg e1 = new Egg(20);
    e1.display();
  }
}
