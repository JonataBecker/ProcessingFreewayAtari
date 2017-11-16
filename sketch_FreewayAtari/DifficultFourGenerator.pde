class DifficultFourGenerator extends DifficultGenerator {

    HashMap<String, Integer> enemies = new HashMap<String, Integer>();
    
    DifficultFourGenerator(ArrayList<Road> roads) {
        super(roads, 1.1);
        enemies.put("car", 50);
        enemies.put("truck", 30);
        enemies.put("police", 20);
    }

    HashMap<String, Integer> getEnemies() {
        return enemies;        
    }

}