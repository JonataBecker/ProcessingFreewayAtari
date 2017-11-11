class DifficultOneGenerator extends DifficultGenerator {

    HashMap<String, Integer> enemies = new HashMap<String, Integer>();
    
    DifficultOneGenerator(ArrayList<Road> roads) {
        super(roads, 1);
        enemies.put("car", 100);
    }

    HashMap<String, Integer> getEnemies() {
        return enemies;        
    }

}