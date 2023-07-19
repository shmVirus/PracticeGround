// ?: Write a program to display student grades using switch cases.

import 'dart:io';

void main () {
    stdout.write("Marks: ");
    int marks = int.parse(stdin.readLineSync()!);
    String grade;
    switch (marks ~/ 10) {
        case 10:
            grade = (marks > 100 ? "INVALID MARKS" : "A+");
            break;
        case 9:
            grade = "A+";
            break;
        case 8:
            grade = "A+";
            break;
        case 7:
            grade = (marks >= 75 ? "A" : "A-");
            break;
        case 6:
            grade = (marks >= 65 ? "B+" : "B");
            break;
        case 5:
            grade = (marks >= 55 ? "B-" : "C+");
            break;
        case 4:
            grade = (marks >= 45 ? "C" : "D");
            break;
        default:
            grade = (marks > 100 || marks < 0 ? "INVALID MARKS" : "F");
    }
    stdout.write("Grade: ${grade}\n");
}
