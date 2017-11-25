class DifficultThreeGenerator extends DifficultGenerator {

    HashMap<String, Integer> enemies = new HashMap<String, Integer>();
    
    DifficultThreeGenerator(ArrayList<Road> roads) {
        super(roads, 2);
        enemies.put("car", 40);
        enemies.put("truck", 40);
        enemies.put("police", 20);
    }

    HashMap<String, Integer> getEnemies() {
        return enemies;        
    }

}