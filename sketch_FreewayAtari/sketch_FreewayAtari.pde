
Scene scene = new Scene(800, 480);
Player player = new Player(800, 480);
EnemiesController enemiesController = new EnemiesController();
void setup() {  
  size(800,480);
  noStroke();
}


void keyPressed() {
  player.move(keyCode);
   
}

void draw() { 
  scene.display();
  player.display();
  enemiesController.display();
  
  
}