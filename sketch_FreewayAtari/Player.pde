class Player {
  
  static final int MILLS = 100;
  static final int STATUS_MOVE = 1;
  static final int STATUS_FINAL_SW = 2;
  
  static final int POS_DOWN = 0;
  static final int POS_LEFT = 1;
  static final int POS_RIGHT = 2;
  static final int POS_UP = 3;

  static final int SIZE_IMG = 49;

  final Config config;
  int xSpeed = 10;
  int ySpeed = 10;
  int widthPlayer = 30;
  int heightPlayer = 30;
  int status = STATUS_MOVE;
  int y;
  int x;
  int oldMills;
  int count;
  int pos;
  
  Player(Config config) {
    this.config = config;
    initialPosition();
    pos = POS_UP;
  }

  void initialPosition() {
    this.status = STATUS_MOVE;
    this.x = (config.width / 2) - (widthPlayer / 2);
    this.y = config.height - 28;
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
      if (pos != POS_UP) {
        pos = POS_UP;
        count = -1;
      }
      y-=ySpeed;
      if (y <= 40) {
        y += 7;
        status = STATUS_FINAL_SW;
      }
    }
    if (keyCode == DOWN) {
      if (pos != POS_DOWN) {
        pos = POS_DOWN;
        count = -1;
      }      
      int tmpY = y + ySpeed; 
      if (tmpY < config.height - 30) {
        y = tmpY;
      }
    }
    if (keyCode == LEFT) {
      if (pos != POS_LEFT) {
        pos = POS_LEFT;
        count = -1;
      }      
      x-=xSpeed;
      if (x < 0) {
        x = 0;
      }
    }
    if (keyCode == RIGHT) {
      if (pos != POS_RIGHT) {
        pos = POS_RIGHT;
        count = -1;
      }            
      x+=xSpeed;
      if (x > config.width - widthPlayer) {
        x = config.width - widthPlayer;
      }
    }
    count++;
    if (count >= 3) {
      count = 0;
    }
  }
  
  boolean isColided(Enemy enemy) {
    return (
            (x >= enemy.x && x <= enemy.x + enemy.width) ||
            (x + widthPlayer >= enemy.x && x + widthPlayer <= enemy.x + enemy.width) ||
            (x <= enemy.x && x + widthPlayer >= enemy.x + enemy.width)
          ) && 
          (
            (y >= enemy.y && y <= enemy.y + enemy.height) ||
            (y + heightPlayer >= enemy.y && y + heightPlayer <= enemy.y + enemy.height) ||
            (y <= enemy.y && y + heightPlayer >= enemy.y + enemy.height)
          ); 
  }

  void moveBack() {
    y += 20;
    if (y > config.height) {
      y = config.height - 28;
    }
  }

  boolean isMoveing() {
    return status == STATUS_MOVE;
  }

  boolean isFinalSideWalk() {
    return status == STATUS_FINAL_SW;
  }

  void display() {
    int pX = SIZE_IMG * count;
    int pY = SIZE_IMG * pos;
    copy(images.getPlayer(), pX, pY, SIZE_IMG, SIZE_IMG, x, y, widthPlayer, heightPlayer);
  }

}