import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class sketch_FreewayAtari extends PApplet {


Config config = new Config(800, 480);
Scene scene = new Scene(config);
GameController gameController = new GameController();

public void setup() {  
  
  noStroke();
}

public void keyPressed() {
  gameController.keyPressed(keyCode);   
}

public void draw() { 
  scene.display();
  gameController.display();

  print("Ola");
}
class CarEnemy extends Enemy {
 
  int enegy = 1;
    
  CarEnemy(int limit) {
    super();
    this.enegy = (int) random(limit) + 1;
  }
  
  public void move() {
    x += (direction == DIRECTION_LEFT ? enegy * -1 : enegy);
  }

}
class Colider {

  public boolean isColided(Player player, ArrayList<Road> roads) {
    for (int r = 0; r < roads.size(); r++) {
      ArrayList<Enemy> enemies = roads.get(r).get();
      for (int i = 0; i < enemies.size(); i++) {
        if (player.isColided(enemies.get(i))) {
          return true;
        }
      }
    }
    return false;
  }
}
class Config {
  
  static final int FINAL_SCORE = 1;
  static final int FINAL_DIFFICULT = 5;
  final int width;
  final int height;
  int difficult;
  int score;
  boolean win = false;

  Config(int width, int height) {
    this.width = width;
    this.height = height;
    this.difficult = 1;
    this.score = 0;
  }

  public void addScore() {
    this.score++;
    if (this.score > FINAL_SCORE) {
      this.score = 0;
      if (difficult == FINAL_DIFFICULT) {
        win = true;
      } else {
        this.difficult++;
      }
    }
  }

  public int getScore() {
    return this.score;
  }
  
  public int getDifficult() {
    return this.difficult;
  }
 
  public boolean isWin() {
    return win;
  }

}
class Congratulations {
  
  final Config config;
  final int width = 150;
  final int height = 80;
  
  Congratulations(Config config) {
    this.config = config;
  }

  public void display() {
    noStroke();
    fill(0xff000000);
    int x = config.width / 2 - width / 2;
    int y = config.height / 2 - height / 2;
    rect(x, y, width, height);
    fill(0xffFFFFFF);
    text("Voc\u00ea venceu!!!", x + 30, y + 45);
  }

}
abstract class Enemy {
  
  static final int DIRECTION_LEFT = 1;
  static final int DIRECTION_RIGHT = 2;
  
  int width = 30;
  int height = 20;
  int x = 0;
  int y = 0;
  int direction;
  
  Enemy() {
    this.direction = DIRECTION_RIGHT;
  }
 
  public abstract void move();
  
  public void display() {
    noStroke();
    fill(0xfff00f00);
    rect(x, y, width, height);
  }
  

}
class GameController {

  final Player player;
  final ArrayList<Road> roads;
  final Colider colider = new Colider();
  final Congratulations congratulations = new Congratulations(config);
    
  GameController() {
    this.player = new Player(config);
    this.roads = new ArrayList<Road>();
    for (int i = 0; i < 10; i++) {
      Road road = new LeftRoad(i, config);
      if (i >= 5) {
        road = new RightRoad(i,  config);
      }
      road.generate();      
      this.roads.add(road);      
    } 
  }
  
  public void keyPressed(int keyCode) {
    if (config.isWin()) {
      return;
    }
    player.move(keyCode);
    if (player.isFinalSideWalk()) {
      config.addScore();
      player.initialPosition();
    }
  }
  
  public void display() {
    for (int i = 0; i < roads.size(); i++) {
      roads.get(i).display();     
    }
    if (colider.isColided(player, roads)) {
      player.moveBack();
    }
    player.display();
    if (config.isWin()) {
      congratulations.display();
    }
  }


}
class LeftRoad extends Road {

  LeftRoad(int id, Config config) {
    super(id, config);
  }
  
  public void add(Enemy enemy) {
    enemy.x = config.width;
    enemy.y = calcY();
    enemy.direction = Enemy.DIRECTION_LEFT;
    addEnemy(enemy);
  }
  
}
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

  public void initialPosition() {
    this.status = STATUS_MOVE;
    this.x = (config.width / 2) - (widthPlayer / 2);
    this.y = config.height - 17;
  }

  public void move(int keyCode) {
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
  
  public boolean isColided(Enemy enemy) {
    return ((x >= enemy.x && x <= enemy.x + enemy.width) ||
          (x + widthPlayer >= enemy.x && x + widthPlayer <= enemy.x + enemy.width)) && 
          ((y >= enemy.y && y <= enemy.y + enemy.height) ||
          (y + heightPlayer >= enemy.y && y + heightPlayer <= enemy.y + enemy.height)); 
  }

  public void moveBack() {
    y += 50;
    if (y > config.height) {
      y = config.height - 17;
    }
  }

  public boolean isMoveing() {
    return status == STATUS_MOVE;
  }

  public boolean isFinalSideWalk() {
    return status == STATUS_FINAL_SW;
  }

  public void display() {
    noStroke();
    fill(0xfff00f00);
    rect(x, y, widthPlayer, heightPlayer);
  }

}
class RightRoad extends Road {

  RightRoad(int id, Config config) {
    super(id, config);
  }

  public void add(Enemy enemy) {
    enemy.x = 0;
    enemy.y = calcY();
    enemy.direction = Enemy.DIRECTION_RIGHT;
    addEnemy(enemy);
  }
  

}
abstract class Road {
  
  final int id;
  final Config config;
  final ArrayList<Enemy> enemies;
  
  Road(int id, Config config) {
    this.id = id;
    this.config = config;
    this.enemies = new ArrayList<Enemy>();
  }

  protected void addEnemy(Enemy enemy) {
     this.enemies.add(enemy);
  }

  protected int calcY() {
    return id * 40 + 65;
  }

  public void remove(Enemy enemy) {
    this.enemies.remove(enemy);
  }

  public ArrayList<Enemy> get() {
    return new ArrayList<Enemy>(this.enemies);
  }

  public int size() {
    return this.enemies.size();
  }

  protected abstract void add(Enemy enemy);

  public void generate() {
    add(new CarEnemy(4 * config.difficult));
  }

  public void display() {
    for (Enemy enemy : get()) {
      if (!config.isWin()) {
        enemy.move();  
      }
      enemy.display();
      if (enemy.x < 0 || enemy.x > config.width) {
          remove(enemy);
          generate();
      }
    }  
  }
  
}
class Scene {
 
  int roads = 5; 
  int roadHeight = 40;
  final Config config;
  final Score score;
  
  Scene(Config config) {
    this.config = config;
    this.score = new Score(config);
  }
  
  public void display() {
    background(0xff999999);
    noStroke();
    // Score
    fill(0xffFFFFFF);
    rect(0, 0, config.width, 30);
    // Sidewalk
    drawSideWalk(30);
    // Fisrt roads
    int roadY = 55;
    stroke(0xffFFFFFF);
    for (int i = 0; i < roads - 1; i++) {
      roadY += roadHeight;
      drawLineDashed(roadY);
    }
    // Center road
    stroke(0xffdbe71e);
    roadY += roadHeight;
    drawLineDashed(roadY);
    // Second roads
    stroke(0xffFFFFFF);
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
  
  public void drawSideWalk(int posY) {
    noStroke();
    fill(0xffCCCCCC);
    rect(0, posY, config.width, 25);
  }
  
  public void drawLineDashed(int posY) {
    for (int i = 0; i < config.width; i = i + 10) {
      line(i, posY, i+5, posY);
    }
  }
  
  
}
class Score {

  final Config config;
  
  Score(Config config) {
    this.config = config;
  }
  
  public void display() {
    fill(0xff000000);
    text("Score: " + config.score, 10, 20);
    text("Difficult: " + config.difficult, config.width - 80, 20);
  }

}
  public void settings() {  size(800,480); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "sketch_FreewayAtari" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
