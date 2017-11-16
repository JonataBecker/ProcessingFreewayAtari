class DifficultFiveGenerator extends DifficultGenerator {

    HashMap<String, Integer> enemies = new HashMap<String, Integer>();
    
    DifficultFiveGenerator(ArrayList<Road> roads) {
        super(roads, 1.3);
        enemies.put("car", 30);
        enemies.put("truck", 40);
        enemies.put("police", 30);
    }

    HashMap<String, Integer> getEnemies() {
        return enemies;        
    }

}