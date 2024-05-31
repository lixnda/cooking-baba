class Cake{
  private int point;
  private String current;
  private int frames;
  private int levelTime;
  
  ArrayList<Chicken> ChickenList;
  String[] games = {"chicken", "egg", "flour", "bake", "decor"};
  int level = 0;
  boolean levelDone;
  
  Cake(PApplet p){
    ChickenList = new ArrayList<Chicken>();
    for(int i = 0; i<=20; i++){
      ChickenList.add(new Chicken(p, random(50,550), random(50,850),random(-6,6),random(-6,7)));
    }
    point = 0;
    frames = 0;
    current = "chicken";
    levelTime = 900;
    frameRate(30);
  }
  
  void display() {
    frames++;
    if(levelDone){
      frames = 0;
      background(0);
      textSize(50);
      fill(200);
      text("press n to continue \n current points: " + point, 100, 500, 450, 500);
      if(key=='n' && level<5){
        level++;
        current = games[level];
        levelDone = false;
      }
    }
    
    if(current.equals("chicken")&&!levelDone){
      PImage bg = loadImage("assets/grass.png");
      bg.resize(600,900);
      image(bg, 0, 0);
      for(Chicken c: ChickenList){
        c.display();
        c.move();
        c.bounce();
        c.stopIfClicked();
      }
      textSize(50);
      fill(0);
      text("time left: " + ((levelTime-frames)/30), 25, 50);
      //60fps?
      if(frames>9){
        point = pointChicken();
        levelDone=true;
      }
    }
      
    if(current.equals("egg")){
      background(0);
      Egg e1 = new Egg(20);
      e1.display();
    }
  }
  
  int pointChicken(){
    int total = 0;
    for(Chicken c: ChickenList){
      if(c.isCaught()){
        total++;
      }
    }
    return total;
  }
  
}
