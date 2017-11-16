abstract class DifficultGenerator {

    private ArrayList<Road> roads;
    private float numCars;

    DifficultGenerator(ArrayList<Road> roads, float numCars) {
        this.roads = roads;
        this.numCars = numCars;
    }

    abstract HashMap<String, Integer> getEnemies();

    Enemy getEnemy(Road road) {
        if (!isGenerateEnemy(road)) {
            return null;
        }
        int rand = (int) random(100);
        int sum = 0;
        for (HashMap.Entry<String, Integer> entry : getEnemies().entrySet()) {
            sum += entry.getValue();
            if (rand <= sum) {
                if (entry.getKey().equals("car")) {
                    return new CarEnemy(road.id, roads);
                }
                if (entry.getKey().equals("truck")) {
                    return new TruckEnemy(road.id, roads);
                }
                if (entry.getKey().equals("police")) {
                    return new PoliceCarEnemy(road.id, roads);
                }                    
            }
        }
        return null;
    }

    boolean isGenerateEnemy(Road road) {
        if (road.isEmpty()) {
            return true;
        }
        if (road.size() >= numCars) {
            return false;
        }
        if (random(100) <= numCars) {
            return true;
        }
        return false;
    }

}