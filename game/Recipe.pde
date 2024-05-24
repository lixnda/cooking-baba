class Recipe {
  private boolean ingredientsCaught;
  private boolean prepared;
  private boolean stirred;
  private float distanceStirred;
  private float requiredDistance;
  private PVector startPosition;
  private boolean served;
  
  Recipe() {
    
  }
  boolean isCaught() {
    return ingredientsCaught;
  }
  boolean isPrepared() {
    return prepared;
  }
  boolean isStirred() {
    return stirred;
  }
  boolean isServed() {
    return served; 
  }
  //is overidden in curry and cake
  void catchIngredients() {
  
  }
  void prepare() {
  
  }
  void stir() {
  
  }
  void serve() {
  
  }
  
  
}
