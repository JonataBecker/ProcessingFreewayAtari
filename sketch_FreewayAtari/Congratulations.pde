class Congratulations {
  
  final Config config;
  final int width = 150;
  final int height = 80;
  
  Congratulations(Config config) {
    this.config = config;
  }

  void display() {
    noStroke();
    fill(#000000);
    int x = config.width / 2 - width / 2;
    int y = config.height / 2 - height / 2;
    rect(x, y, width, height);
    fill(#FFFFFF);
    text("Você venceu!!!", x + 30, y + 45);
  }

}