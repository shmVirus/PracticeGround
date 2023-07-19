// ?: Write a program to find the largest among three numbers.
// *: ternary operator

import 'dart:io';

void main () {
    stdout.write("First Number: ");
    int a = int.parse(stdin.readLineSync()!);
    stdout.write("Second Number: ");
    int b = int.parse(stdin.readLineSync()!);
    stdout.write("Third Number: ");
    int c = int.parse(stdin.readLineSync()!);
    int largest = a > b ? (a > c ? a : c) : (b > c ? b : c);
    stdout.write("Largest Number: ${largest}\n");
}
