import gifAnimation.*;

Curry curry;
Cake cake;
int points;
String current;

void setup() {
  current = "start";
  size(600, 900);
  PImage bg = loadImage("assets/bg.png");
  image(bg, 0, 0);
  curry = new Curry(this);
  cake = new Cake(this);
}

void draw() {
  //small animation
  background(255);
  if (current.equals("start")){
    PImage bg = loadImage("assets/bg.png");
    PImage bg0 = loadImage("assets/bg0.jpg");
    if(second()%2==0){
      image(bg0, 0, 0);
    }
    else{
      image(bg,0,0);
    }
    textSize(50);
    text("press c for curry \n press p for cake", 100, 500, 450, 500);
  }
  
  if(key=='c'){
    current = "curry";
  }
  if(current.equals("curry")){
    curry.display();
    if(curry.getCurrent().equals("done")&&keyPressed==true&&key=='n'){
      current = "start";
      curry = new Curry(this);
    }
  }
 
  
  if(key=='p'){
    current="cake";
  }
  if(current.equals("cake")){
    cake.display();
    if(cake.getCurrent().equals("done")&&keyPressed==true&&key=='n'){
      current = "start";
      cake = new Cake(this);
    }
  }
}

void mousePressed() {
  if(current.equals("curry")){
      curry.mousePressed();
    }
  if(current.equals("cake")){
    cake.mousePressed();
  }
}
void mouseDragged() {
  curry.mouseDragged();
}
void keyPressed() {
   curry.keyPressed();
}
