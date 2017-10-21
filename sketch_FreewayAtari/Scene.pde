class Scene {
 
  int roads = 5; 
  int roadHeight = 40;
  int widthScene;
  int heightScene;
  
  Scene(int widthScene, int heightScene) {
    this.widthScene = widthScene;
    this.heightScene = heightScene;
  }
  
  void display() {
    background(#999999);
    noStroke();
    // Score
    fill(#FFFFFF);
    rect(0, 0, widthScene, 30);
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
  } 
  
  void drawSideWalk(int posY) {
    noStroke();
    fill(#CCCCCC);
    rect(0, posY, widthScene, 25);
  }
  
  void drawLineDashed(int posY) {
    for (int i = 0; i < widthScene; i = i + 10) {
      line(i, posY, i+5, posY);
    }
  }
  
  
}