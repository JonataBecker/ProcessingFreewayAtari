class Score {

  final Config config;
  
  Score(Config config) {
    this.config = config;
  }
  
  void display() {
    fill(#000000);
    text("Score: " + config.score, 10, 20);
    text("Difficult: " + config.difficult, config.width - 80, 20);
  }

}