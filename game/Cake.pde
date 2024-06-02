class Cake{
  private int point;
  private String current;
  private int frames;
  private int levelTime;
  
  ArrayList<Chicken> ChickenList;
  //ArrayList<Egg> EggList;
  Ingredient ing;
  String[] games = {"chicken", "ingredient", "bake", "decor"};
  int level = 0;
  boolean levelDone;
  
  
  Cake(PApplet p){
    ChickenList = new ArrayList<Chicken>();
    for(int i = 0; i<20; i++){
      ChickenList.add(new Chicken(p, random(50,550), random(50,850),random(-6,6),random(-6,7)));
    }
    //EggList = new ArrayList<Egg>();
    //for(int i = 0; i<8; i++){
    //  EggList.add(new Egg(random(5, 10)));
    //}
    ing = new Ingredient(20);
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
      //background(0);
      //Egg show = EggList.get(0);
      //int index = 0;
      //for(int i = 0; i<EggList.size(); i++){
      //  if(!EggList.get(i).getCrack()&&!EggList.get(i).getLost()){
      //    show = EggList.get(i);
      //    index = i;
      //    break;
      //  }
      //}
      //show.display();
      //textSize(20);
    }
    
    if(current.equals("ingredient")){
      ing.display();
      textSize(30);
      fill(0);
      text("time left: " + ((levelTime-frames)/30), 25, 50);
      //if(frames>1000){
      //  levelDone = true;
      //}
    }
    
    if(current.equals("bake")){
    }
    
    if(current.equals("decor")){
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
  
  void mousePressed(){
    if(current.equals("ingredient")){
      ing.mousePressed();
    }
  }
  
}
