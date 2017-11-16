class DifficultThreeGenerator extends DifficultGenerator {

    HashMap<String, Integer> enemies = new HashMap<String, Integer>();
    
    DifficultThreeGenerator(ArrayList<Road> roads) {
        super(roads, 3);
        enemies.put("car", 70);
        enemies.put("truck", 30);
    }

    HashMap<String, Integer> getEnemies() {
        return enemies;        
    }

}