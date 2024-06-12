class Cake{
  private int point;
  private String current;
  private int frames;
  private int levelTime;
  
  ArrayList<Chicken> ChickenList; //level1
  ArrayList<Gif> starList;
  
  Ingredient ing; //level2
  
  int a, b, index, timeleft, temp; //level3
  boolean done;
  
  Decor c; //level4
  
  String[] games = {"chicken", "ingredient", "bake", "decor", "done"};
  int level = 1;
  boolean levelDone;
  PImage done0, done1, background, end;
  
  
  Cake(PApplet p){
    ChickenList = new ArrayList<Chicken>();
    starList = new ArrayList<Gif>();
    for(int i = 0; i<30; i++){
      ChickenList.add(new Chicken(p, random(50,550), random(50,850),random(-6,6),random(-6,7)));
    }
    for(int i = 0; i<5; i++){
      starList.add(new Gif(p, "assets/star.gif"));
      starList.get(i).loop();
    }
    ing = new Ingredient(30);
    c = new Decor();
    a= (int)(random(99, 199));
    b= (int)(random(99, 199));
    done = false;
    temp = (int)(random(99, 199));
    point = 0;
    frames = 0;
    index = 0;
    current = "chicken";
    timeleft = 300; //for bake level, which has different frameRate
    levelTime = 750;
    frameRate(30);
    done0 = loadImage("assets/done0.png");
    done1 = loadImage("assets/done1.png");
    background = loadImage("assets/kitchen.png");
    end = loadImage("assets/end.png");
    done0.resize(600, 900);
    done1.resize(600, 900);
    background.resize(600, 900);
    end.resize(600, 900);
  }
  
  String getCurrent(){
    return current;
  }
  
  void setPoint(int p){
    point = p;
  }
  
  void setCurrent(String p){
    current = p;
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
      textAlign(LEFT);
      text("time left: " + ((levelTime-frames)/30), 25, 50);
      //60fps?
      if(frames>levelTime||pointChicken()==30){
        point+=pointChicken();
        current="leveldone";
      }
    }
    
    if(current.equals("ingredient")){
      ing.display();
      textSize(50);
      fill(#FFFFFF);
      textAlign(LEFT);
      text("time left: " + ((levelTime-frames)/30), 25, 50);
      if(frames>levelTime){
        point+=pointIng();
        current="leveldone";
      }
    }
    
    if(current.equals("bake")){
      image(background, 0, 0);
      fill(0);
      frameRate(10);
      textAlign(CENTER);
      text("Bake at the \nCorrect Temperature: \n" + a + "+" + b + "\n Press D to Check", 300, 230);
      text(temp, 300, 500);
      fill(#50C878);
      ellipse(200, 600, 150, 150);
      fill(#C70039);
      ellipse(400, 600, 150, 150);
      if(mousePressed==true&&dist(200, 600, mouseX, mouseY)<75){
        temp++;
      }
      if(mousePressed==true&&dist(400, 600, mouseX, mouseY)<75){
        temp--;
      }
      if(keyPressed==true&&key=='d'||done==true){
        done=true;
        boolean correct = ((a+b)==temp);
        textAlign(CENTER);
        fill(0);
        text(""+correct, 300, 800);
        if(correct){
          index++;
        }
      }
      fill(0);
      textAlign(LEFT);
      text("time left: " + ((timeleft-frames)/10), 25, 50);
      if(frames>timeleft||index>15){
        point+=pointBake();
        current="leveldone";
      }
    }
    
    if(current.equals("decor")){
      c.display();
      fill(#FFFFFF);
      text("press k to continue", 140, 200);
      if(keyPressed==true&&key=='k'){
        current = "done";
        level++;
      }
    }
    if(current.equals("done")){
      image(end, 0, 0);
      c.fin();
      level = 0;
      textAlign(CENTER);
      fill(#FFFFFF);
      text("Click N to Exit", 300, 300);
      int k = 90/5;
      if(point>=k){
        image(starList.get(0), 0, 100);
      }
      if(point>=k*2){
        image(starList.get(1), 120, 100);
      }
      if(point>=k*3){
        image(starList.get(2), 240, 100);
      }
      if(point>=k*4){
        image(starList.get(3), 360, 100);
      }
      if(point>=k*5-5){
        image(starList.get(4), 480, 100);
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
  
  int pointIng(){
    int total = 30 - ing.getSize();
    return total;
  }
  
  int pointBake(){
    int total = 0;
    if(temp==(a+b)){
      total = 30;
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
