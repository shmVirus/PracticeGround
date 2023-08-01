// ?: Checks whether a string is palindrome or not.

import 'dart:io';
void main() {
    stdout.write("String: ");
    String string = stdin.readLineSync()!;
    bool palindrome = true;
    for (int i = 0, j = string.length - 1; i <= j; ++i, --j) {
        if (string[i] != string[j]) {
            palindrome = false;
            break;
        }
    }
    stdout.write("Given String is" + (palindrome ? "" : " not") + " a Palindrome!\n");
}
