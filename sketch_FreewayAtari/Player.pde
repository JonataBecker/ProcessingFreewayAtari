class Player {
  
  static final int STATUS_INIT_SW = 0;
  static final int STATUS_MOVE = 1;
  static final int STATUS_FINAL_SW = 2;
  
  int xSpeed = 5;
  int ySpeed = 40;
  int widthPlayer = 10;
  int widthScene;
  int heightScene;
  int status = STATUS_INIT_SW;
  int y;
  int x;
  
  Player(int widthScene, int heightScene) {
    this.widthScene = widthScene;
    this.heightScene = heightScene;
    this.x = (widthScene / 2) - (widthPlayer / 2);
    this.y = heightScene - 17;
  }

  void move(int keyCode) {
    if (isFinalSideWalk()) {
      return;
    }
    if (keyCode == UP) {
      if (isInitialSideWalk()) {
        y -= 32;
        status = STATUS_MOVE;
      } else {
        y-=ySpeed;
      }
      if (y <= 60) {
        y += 7;
        status = STATUS_FINAL_SW;
      }
    }
    if (keyCode == DOWN) {
      int tmpY = y + ySpeed; 
      if (tmpY < heightScene - 40) {
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
      if (x > widthScene - widthPlayer) {
        x = widthScene - widthPlayer;
      }
    }
  }

  boolean isInitialSideWalk() {
    return status == STATUS_INIT_SW;
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
    rect(x, y, widthPlayer, widthPlayer);
  }

}