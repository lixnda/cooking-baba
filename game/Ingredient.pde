class Ingredient{
  private ArrayList<String> order;
  
  String[] possible = {"flour", "sugar", "salt", "egg", "baking powder", "milk", "strawberry","butter"};
  PImage flour, sugar, salt, egg, baking, milk, strawberry, butter, background;
  
  Ingredient(int total){
    order = new ArrayList<String>();
    for(int i = 0; i< total; i++){
      order.add(possible[(int)random(0, possible.length)]);
    }
    
    flour = loadImage("assets/flour.png");
    sugar = loadImage("assets/sugar.png");
    salt = loadImage("assets/salt.png");
    egg = loadImage("assets/egg.png");
    baking = loadImage("assets/baking.png");
    milk = loadImage("assets/milk.png");
    strawberry = loadImage("assets/strawb.png");
    butter = loadImage("assets/butter.png");
    background = loadImage("assets/bg0.png");
    
    flour.resize(150, 150);
    sugar.resize(150, 150);
    salt.resize(150, 150);
    egg.resize(150, 150);
    baking.resize(150, 150);
    milk.resize(150, 150);
    strawberry.resize(150, 150);
    butter.resize(150, 150);
    background.resize(600, 900);
  }
  
  int getSize(){
    return order.size();
  }
  
  void display(){
    fill(#FFFFFF);
    image(background, 0, 0);
    textSize(50);
    
    String display = "";
    if(order.size()>0){
      display = order.get(0);
    }
    
    textAlign(CENTER);
    text("Ingredients left: " + order.size(), 300, 200);
    textSize(75);
    text(display, 300, 300);
      
    int height = 390;
    image(flour, 0, height);
    image(sugar, 150, height);
    image(salt, 300, height);
    image(egg, 450, height);
    image(baking, 0, height+150);
    image(milk, 150, height+150);
    image(strawberry, 300, height+150);
    image(butter, 450, height+150);
    
    
    
  }
  
  void mousePressed(){
    if(order.isEmpty()){
      return;
    }
    int height = 390;
    String first = order.get(0);
    
    if(first.equals("flour")&& mouseX>=0 && mouseX<150 && mouseY>=height && mouseY<height+150){
      order.remove(0);
    }
    else if(first.equals("sugar")&& mouseX>=150 && mouseX<300 && mouseY>=height && mouseY<height+150){
      order.remove(0);
    }
    else if(first.equals("salt") && mouseX>=300 && mouseX<450 && mouseY>=height && mouseY<height+150){
      order.remove(0);
    }
    else if(first.equals("egg")&& mouseX>=450 && mouseX<600 && mouseY>=height && mouseY<height+150){
      order.remove(0);
    }
    else if(first.equals("baking powder")&& mouseX>=0 && mouseX<150 && mouseY>= height+150 && mouseY<height+300){
      order.remove(0);
    }
    else if(first.equals("milk") && mouseX>=150 && mouseX<300 && mouseY>=height+150 && mouseY<height+300){
      order.remove(0);
    }
    else if(first.equals("strawberry") && mouseX>=300 && mouseX < 450 && mouseY>= height+150 && mouseY <height+300){
      order.remove(0);
    }
    else if(first.equals("butter")&& mouseX>=450 && mouseX<600 && mouseY>=height+150 && mouseY<height+300) {
      order.remove(0);
    }
 
  }
}
