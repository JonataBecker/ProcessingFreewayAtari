class EnemyGenerator {

    final ArrayList<DifficultGenerator> difficults;

    EnemyGenerator(Config config, ArrayList<Road> roads) {
        this.difficults = new ArrayList<DifficultGenerator>();
        this.difficults.add(new DifficultOneGenerator(roads));
        this.difficults.add(new DifficultTwoGenerator(roads));
        this.difficults.add(new DifficultThreeGenerator(roads));
        this.difficults.add(new DifficultFourGenerator(roads));
        this.difficults.add(new DifficultFiveGenerator(roads));
    }

    DifficultGenerator getGenerator() {
        return this.difficults.get(config.getDifficult() - 1);
    }

    Enemy getEnemy(Road road) {
        return getGenerator().getEnemy(road);
    }

}