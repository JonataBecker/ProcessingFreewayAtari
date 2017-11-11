class DifficultFiveGenerator extends DifficultGenerator {

    HashMap<String, Integer> enemies = new HashMap<String, Integer>();
    
    DifficultFiveGenerator(ArrayList<Road> roads) {
        super(roads, 3);
        enemies.put("car", 20);
        enemies.put("truck", 50);
        enemies.put("police", 30);
    }

    HashMap<String, Integer> getEnemies() {
        return enemies;        
    }

}