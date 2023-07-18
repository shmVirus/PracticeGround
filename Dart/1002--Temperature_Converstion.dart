// ?: Convert temperature from Fahrenheit to Celsius and vice-versa.

// * variables
// dynamic - can hold any data types
// int variable - sets data type explicitly
// var - sets data type depending on assigned values
// const - compile time initialization
// final - run time initialization

import 'dart:io';

void main() {
    stdout.write("Celsius: ");
    double celsius = double.parse(stdin.readLineSync()!); // '!' ensures not null
    stdout.write("Converted to Fahrenheit: ${(celsius * 9 / 5) + 32}\n");

    stdout.write("Fahrenheit: ");
    double fahrenheit = double.parse(stdin.readLineSync()!); // '!' ensures not null
    stdout.write("Converted to Celsius: ${(fahrenheit - 32) * 5 / 9}\n");
}
