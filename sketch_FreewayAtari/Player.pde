class Player {

  int xSpeed = 5;
  int ySpeed = 40;
  int widthPlayer = 10;
  int widthScene;
  int heightScene;
  int initY;
  
  int y;
  int x;
  
  Player(int widthScene, int heightScene) {
    this.widthScene = widthScene;
    this.heightScene = heightScene;
    this.initY = heightScene - 17;
    this.x = (widthScene / 2) - (widthPlayer / 2);
    this.y = initY;
  }

  void move(int keyCode) {
    if (keyCode == UP) {
      if (y == initY) {
        y -= 32;
      } else {
        y-=ySpeed;
      }
    }
    if (keyCode == DOWN) {
      y+=ySpeed;
    }
    if (keyCode == LEFT) {
      x-=xSpeed;
    }
    if (keyCode == RIGHT) {
      x+=xSpeed;
    }
  }

  void display() {
     noStroke();
    fill(#f00f00);
    rect(x, y, widthPlayer, widthPlayer);
  }

}