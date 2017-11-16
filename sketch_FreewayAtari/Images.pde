class Images {
    
    PImage car;
    PImage truck;
    PImage policeCar;
    PImage player;

    PImage getCar() {
        if (car == null) {
            this.car = loadImage("img/Taxi-GTA2.png");
        }
        return car;
    }
    
    PImage getTruck() {
        if (truck == null) {
            this.truck = loadImage("img/FireTruck-GTA2.png");
        }
        return truck;
    }

    PImage getPoliceCar() {
        if (policeCar == null) {
            this.policeCar = loadImage("img/SquadCar-GTA1-LibertyCity.png");
        }
        return policeCar;
    }

    PImage getPlayer() {
        if (player == null) {
            this.player = loadImage("img/chicken.png");
        }
        return player;
    }

}