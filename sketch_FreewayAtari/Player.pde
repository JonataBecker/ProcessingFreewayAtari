class Player {
  
  static final int MILLS = 100;
  static final int STATUS_MOVE = 1;
  static final int STATUS_FINAL_SW = 2;
  
  final Config config;
  int xSpeed = 10;
  int ySpeed = 10;
  int widthPlayer = 10;
  int heightPlayer = 10;
  int status = STATUS_MOVE;
  int y;
  int x;
  int oldMills;
  
  Player(Config config) {
    this.config = config;
    initialPosition();
  }

  void initialPosition() {
    this.status = STATUS_MOVE;
    this.x = (config.width / 2) - (widthPlayer / 2);
    this.y = config.height - 17;
  }

  void move(int keyCode) {
    if (isFinalSideWalk()) {
      return;
    }
    int m = millis();
    // if the user press much fast
    if (oldMills > 0 && (m - oldMills) < MILLS) {
      return;
    }
    oldMills = m;
    if (keyCode == UP) {
      y-=ySpeed;
      if (y <= 40) {
        y += 7;
        status = STATUS_FINAL_SW;
      }
    }
    if (keyCode == DOWN) {
      int tmpY = y + ySpeed; 
      if (tmpY < config.height - 30) {
        y = tmpY;
      }
    }
    if (keyCode == LEFT) {
      x-=xSpeed;
      if (x < 0) {
        x = 0;
      }
    }
    if (keyCode == RIGHT) {
      x+=xSpeed;
      if (x > config.width - widthPlayer) {
        x = config.width - widthPlayer;
      }
    }
  }
  
  boolean isColided(Enemy enemy) {
    return ((x >= enemy.x && x <= enemy.x + enemy.width) ||
          (x + widthPlayer >= enemy.x && x + widthPlayer <= enemy.x + enemy.width)) && 
          ((y >= enemy.y && y <= enemy.y + enemy.height) ||
          (y + heightPlayer >= enemy.y && y + heightPlayer <= enemy.y + enemy.height)); 
  }

  void moveBack() {
    y += 50;
    if (y > config.height) {
      y = config.height - 17;
    }
  }

  boolean isMoveing() {
    return status == STATUS_MOVE;
  }

  boolean isFinalSideWalk() {
    return status == STATUS_FINAL_SW;
  }

  void display() {
    noStroke();
    fill(#f00f00);
    rect(x, y, widthPlayer, heightPlayer);
  }

}