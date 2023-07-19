// ?: Write a program to calculate the sum of digits of a number.


import 'dart:io';

void main () {
    stdout.write("Number: ");
    int number = int.parse(stdin.readLineSync()!);
    int sum = 0;
    while (number > 0) {
        sum += number % 10;
        number ~/= 10;
    }
    stdout.write("Digit Sum: ${sum}\n");
}
