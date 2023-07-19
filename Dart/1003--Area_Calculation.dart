// ?: Write a program to find the area of Circle, Triangle and Rectangle.

import 'dart:io';
void main() {
    stdout.write("Circle Radius: ");
    double radius = double.parse(stdin.readLineSync()!);
    stdout.write("Circle Arena: ${3.1416 * radius * radius}\n\n");

    stdout.write("Triangle Base: ");
    double base = double.parse(stdin.readLineSync()!);
    stdout.write("Triangle Height: ");
    double height = double.parse(stdin.readLineSync()!);
    stdout.write("Triangle Arena: ${0.5 * base * height}\n\n");

    stdout.write("Rectangle Length: ");
    double length = double.parse(stdin.readLineSync()!);
    stdout.write("Rectangle Width: ");
    double width = double.parse(stdin.readLineSync()!);
    stdout.write("Rectangle Arena: ${length * width}\n");
}
