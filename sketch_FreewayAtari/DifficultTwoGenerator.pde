class DifficultTwoGenerator extends DifficultGenerator {

    HashMap<String, Integer> enemies = new HashMap<String, Integer>();
    
    DifficultTwoGenerator(ArrayList<Road> roads) {
        super(roads, 1);
        enemies.put("car", 70);
        enemies.put("truck", 30);
    }

    HashMap<String, Integer> getEnemies() {
        return enemies;        
    }

}