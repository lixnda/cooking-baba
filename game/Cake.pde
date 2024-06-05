class Cake{
  private int point;
  private String current;
  private int frames;
  private int levelTime;
  
  ArrayList<Chicken> ChickenList;
  Ingredient ing;
  Decor c;
  int a;
  int b;
  int temp;
  String[] games = {"chicken", "ingredient", "bake", "decor"};
  int level = 1;
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
    a= (int)(random(1, 999));
    b= (int)(random(1, 999));
    temp = 0;
    point = 0;
    frames = 0;
    current = "chicken";
    levelTime = 10;
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
      if(frames>levelTime){
        point = pointChicken();
        current="leveldone";
      }
    }
    
    if(current.equals("ingredient")){
      ing.display();
      textSize(30);
      fill(0);
      text("time left: " + ((levelTime-frames)/30), 25, 50);
      if(frames>levelTime){
        current="leveldone";
      }
    }
    
    if(current.equals("bake")){
      background(0);
      text("bake at the correct temperature: \n" + a + "+" + b, 0, 300);
      text(temp, 120, 500);
      ellipse(150, 600, 100, 100);
      ellipse(350, 600, 100, 100);
      if(mousePressed==true&&dist(200, 600, mouseX, mouseY)<50){
        temp++;
      }
      if(mousePressed==true&&dist(400, 600, mouseX, mouseY)<50){
        temp--;
      }
      if(keyPressed==true&&key=='d'){
        boolean correct = ((a+b)==temp);
        text("right"+correct, 300, 600);
      }
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
