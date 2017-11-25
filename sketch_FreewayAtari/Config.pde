class Config {
  
  static final int FINAL_SCORE = 0;
  static final int FINAL_DIFFICULT = 5;
  final int width;
  final int height;
  int difficult;
  int score;
  boolean win = false;
  int live;

  Config(int width, int height) {
    this.width = width;
    this.height = height;
    this.difficult = 1;
    this.score = 0;
    resetLive();
  }

  void resetLive() {
    live = 5;
  }

  void addScore() {
    this.score++;
    if (this.score > FINAL_SCORE) {
      this.score = 0;
      if (difficult == FINAL_DIFFICULT) {
        win = true;
      } else {
        this.difficult++;
        resetLive();
      }
    }
  }

  int getScore() {
    return this.score;
  }
  
  int getDifficult() {
    return this.difficult;
  }
 
  boolean isWin() {
    return win;
  }

  void die() {
    live--;
  }

  boolean isDead() {
    return live < 0;
  }

  boolean isFinished() {
    return win || isDead();
  }
}