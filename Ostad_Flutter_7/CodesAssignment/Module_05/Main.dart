import 'dart:io';
import 'ClassCar.dart';

void main() {
    List<Car> cars = [
        Car('Toyota', 'Camry', 2015, 50000),
        Car('Honda', 'Civic', 2018, 30000),
        Car('Ford', 'Mustang', 2020, 15000)
    ];

    cars[0].drive(100);
    cars[1].drive(200);
    cars[2].drive(300);

    stdout.writeln(
        '\x1B[1;38;5;48mBrand\t\x1B[0m'
        '\x1B[1;38;5;44mModel\t\x1B[0m'
        '\x1B[1;38;5;45mYear\t\x1B[0m'
        '\x1B[1;38;5;208mTravelled\t\x1B[0m'
        '\x1B[1;38;5;226mAge\x1B[0m'
    );

    for (var car in cars) {
        stdout.writeln(
            '${car.getBrand()}\t'
            '${car.getModel()}\t'
            '${car.getYear()}\t'
            '${car.getMilesDriven()} miles\t'
            'Age: ${car.getAge()} years'
        );
    }

    stdout.writeln('\nTotal number of Car objects created: ${Car.numberOfCars}');
}
