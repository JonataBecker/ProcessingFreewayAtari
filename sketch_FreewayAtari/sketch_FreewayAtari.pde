
Config config = new Config(800, 480);
Scene scene = new Scene(config);
GameController gameController = new GameController();

void setup() {  
  size(800,480);
  noStroke();
}

void keyPressed() {
  gameController.keyPressed(keyCode);   
}

void draw() { 
  scene.display();
  gameController.display();
}