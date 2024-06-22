import 'dart:core';

class Car {
    String brand;
    String model;
    int year;
    double milesDriven;

    static int numberOfCars = 0;

    Car(this.brand, this.model, this.year, this.milesDriven) {
        numberOfCars++;
    }

    void drive(double miles) {
        milesDriven += miles;
    }

    double getMilesDriven() => milesDriven;
    String getBrand() => brand;
    String getModel() => model;
    int getYear() => year;
    int getAge() => DateTime.now().year - year;
}
