
Images images = new Images();
Config config;
Scene scene;
GameController gameController;

void setup() {  
  size(800,480);
  noStroke();
  start();
}

void keyPressed() {
  if (keyCode == 116) {
    start();
    return;
  }
  gameController.keyPressed(keyCode);   
}

void start() {
    config = new Config(800, 480);
    scene = new Scene(config);
    gameController = new GameController();
}

void draw() { 
  scene.display();
  gameController.display();
}