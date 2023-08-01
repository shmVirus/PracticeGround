// ?: Reverses an List (array) in in-place method.

import 'dart:io';

void main () {
    stdout.write("List Length: ");
    int len = int.parse(stdin.readLineSync()!);
    var list = List<int>.filled(len, 0);

    stdout.write("Items:\n");
    for (int i = 0; i < len; ++i) {
        stdout.write("\t"); list[i] = int.parse(stdin.readLineSync()!);
    }

    for (int i = 0, j = len - 1; i < j; ++i, --j) {
        int t = list[i];
        list[i] = list[j];
        list[j] = t;
    }

    stdout.write("Reversed List: ");
    for (int i = 0; i < len; ++i) {
        stdout.write("${list[i]}" + (i+1 == len ? "\n" : " "));
    }
}
