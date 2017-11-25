class Score {

  final Config config;
  
  Score(Config config) {
    this.config = config;
  }
  
  void display() {
    fill(#000000);
    text("Live: " + (config.live < 0 ? "0" : config.live), 10, 20);
    text("Difficult: " + config.difficult, config.width - 80, 20);
  }

}