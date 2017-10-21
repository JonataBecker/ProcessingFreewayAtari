
Scene scene = new Scene(800, 484);
Player player = new Player(800, 484);

void setup() {  
  size(800,484);
  noStroke();
}


void keyPressed() {
  player.move(keyCode);
   
}

void draw() { 
  scene.display();
  player.display();
  
  
  
}