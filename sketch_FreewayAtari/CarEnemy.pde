class CarEnemy extends Enemy {
 
  int enegy = 1;
   
  CarEnemy(int x, int y, int limit) {
    super(x, y);
    this.enegy = (int) random(limit) + 1;
    println(random(limit));
  }
  
  void move() {
    x += enegy;
  }

}