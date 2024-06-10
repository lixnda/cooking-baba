class Cake{
  private int point;
  private String current;
  private int frames;
  private int levelTime;
  
  ArrayList<Chicken> ChickenList;
  Ingredient ing;
  Decor c;
  String[] games = {"chicken", "ingredient", "bake", "decor"};
  int level = 0;
  boolean levelDone;
  PImage done0;
  PImage done1;
  
  
  Cake(PApplet p){
    ChickenList = new ArrayList<Chicken>();
    for(int i = 0; i<20; i++){
      ChickenList.add(new Chicken(p, random(50,550), random(50,850),random(-6,6),random(-6,7)));
    }
    ing = new Ingredient(20);
    c = new Decor();
    point = 0;
    frames = 0;
    current = "chicken";
    levelTime = 900;
    frameRate(30);
    done0 = loadImage("assets/done0.png");
    done1 = loadImage("assets/done1.png");
    done0.resize(600, 900);
    done1.resize(600, 900);
  }
  
  void display() {
    frames++;
    if(current.equals("leveldone")){
      frames = 0;
      if(second()%2==0){
      image(done0, 0, 0);
      }
      else{
        image(done1,0,0);
      }
      textSize(50);
      fill(#FFFFFF);
      text("press n to continue \n current points: " + point, 100, 500, 450, 500);
      if(keyPressed==true&&key=='n' && level<4){
        current = games[level];
        level++;
      }
    }
    
    else if(current.equals("chicken")&&!levelDone){
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
<<<<<<< HEAD
      if(frames>900){
=======
      if(frames>levelTime){
>>>>>>> 2accebb6c92cee36ffe4563f084096fec4edc0a4
        point = pointChicken();
        current="leveldone";
      }
    }
<<<<<<< HEAD
      
    else if(current.equals("egg")){
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
=======
>>>>>>> 2accebb6c92cee36ffe4563f084096fec4edc0a4
    
    else if(current.equals("ingredient")){
      ing.display();
      textSize(30);
      fill(0);
      text("time left: " + ((levelTime-frames)/30), 25, 50);
      if(frames>levelTime){
        current="leveldone";
      }
    }
    
    if(current.equals("bake")){
      current="leveldone";
    }
    
    if(current.equals("decor")){
      c.display();
      fill(#FFFFFF);
      text("press k to continue", 140, 200);
      if(keyPressed==true&&key=='k'){
        current = "leveldone";
      }
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
    if(current.equals("decor")){
      c.mousePressed();
    }
  }
  
}
