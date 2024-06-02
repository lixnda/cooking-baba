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
  curry = new Curry();
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
    curry.update();
  }
  
  if(key=='p'){
    current="cake";
  }
  if(current.equals("cake")){
    cake.display();
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
