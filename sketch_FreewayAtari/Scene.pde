class Scene {
 
  int roads = 5; 
  int roadHeight = 40;
  final Config config;
  final Score score;
  
  Scene(Config config) {
    this.config = config;
    this.score = new Score(config);
  }
  
  void display() {
    background(#999999);
    noStroke();
    // Score
    fill(#FFFFFF);
    rect(0, 0, config.width, 30);
    // Sidewalk
    drawSideWalk(30);
    // Fisrt roads
    int roadY = 55;
    stroke(#FFFFFF);
    for (int i = 0; i < roads - 1; i++) {
      roadY += roadHeight;
      drawLineDashed(roadY);
    }
    // Center road
    stroke(#dbe71e);
    roadY += roadHeight;
    drawLineDashed(roadY);
    // Second roads
    stroke(#FFFFFF);
    for (int i = 0; i < roads - 1; i++) {
      roadY += roadHeight;
      drawLineDashed(roadY);
    }
    // Sidewalk
    roadY += roadHeight;
    drawSideWalk(roadY);  
    // Display score
    score.display();
  } 
  
  void drawSideWalk(int posY) {
    noStroke();
    fill(#CCCCCC);
    rect(0, posY, config.width, 25);
  }
  
  void drawLineDashed(int posY) {
    for (int i = 0; i < config.width; i = i + 10) {
      line(i, posY, i+5, posY);
    }
  }
  
  
}